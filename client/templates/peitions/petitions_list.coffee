Template.petitionsList.helpers
  petitions: ->
    Petitions.find {}, {sort: {submitted: -1}}
