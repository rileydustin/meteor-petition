Meteor.publish 'petitions', ->
  Petitions.find()
