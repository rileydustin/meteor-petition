Template.petitionEdit.events
  'submit form': (e) ->
    e.preventDefault()

    currentpetitionId = this._id

    petitionProperties = {
      description: $(e.target).find('[name=description]').val()
      title: $(e.target).find('[name=title]').val()
    }

    Petitions.update currentpetitionId, $set: petitionProperties, (error) ->
      if error
        alert error.reason
      else
        Router.go('petitionPage', {_id: currentpetitionId})

  'click .delete': (e) ->
    e.preventDefault()

    if confirm "Delete this petition?"
      currentpetitionId = this._id
      Petitions.remove currentpetitionId
      Router.go 'petitionsList'
