Router.configure
  layoutTemplate: 'layout'
  loading: 'loading'
  notFoundTemplate: 'notFound',
  waitOn: ->
    Meteor.subscribe 'petitions'

Router.route '/',
  name: 'petitionsList'

Router.route '/petitions/:_id',
  name: 'petitionPage',
  data: -> Petitions.findOne this.params._id

Router.route '/petitions/:_id/edit',
  name: 'petitionEdit'
  data: -> Petitions.findOne this.params._id

Router.route '/submit', name: 'petitionSubmit'

requireLogin = ->
  if not Meteor.user()
    if Meteor.loggingIn()
      this.render this.loadingTemplate
    else
      this.render 'accessDenied'
  else
    this.next()

Router.onBeforeAction 'dataNotFound', only: 'petitionPage'
Router.onBeforeAction requireLogin, only: 'petitionSubmit'
