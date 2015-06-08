@Petitions = new Mongo.Collection 'peitions'

Petitions.allow
  update: (userId, post) -> ownsDocument userId, post
  remove: (userId, post) -> ownsDocument userId, post

Petitions.deny
  update: (userId, post, fieldNames) ->
    (_.without(fieldNames, 'description', 'title').length > 0)

Meteor.methods
  petitionInsert: (petitionAttributes) ->
    check Meteor.userId(), String
    check petitionAttributes,
      title: String,
      description: String
    user = Meteor.user()
    petition = _.extend petitionAttributes,
      userId: user._id,
      username: user.username,
      signees: [user.username]
      submitted: new Date()

    petitionId = Petitions.insert petition
    _id: petitionId
