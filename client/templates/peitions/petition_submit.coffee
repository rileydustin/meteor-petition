Template.petitionSubmit.events
  'submit form': (e) ->
    e.preventDefault()

    petition =
      title: $(e.target).find('[name=title]').val(),
      description: $(e.target).find('[name=description]').val()

    Meteor.call 'petitionInsert', petition, (error, result) ->
      if error
        return alert error.reason

      Router.go 'petitionPage', _id: result._id
