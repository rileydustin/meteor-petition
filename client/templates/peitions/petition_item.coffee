Template.petitionItem.helpers
  ownPetition: ->
    this.userId is Meteor.userId()
