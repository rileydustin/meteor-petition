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

Router.onBeforeAction 'dataNotFound', only: 'petitionPage'
