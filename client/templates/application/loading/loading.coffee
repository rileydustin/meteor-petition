Template.loading.rendered = ->
  if not Session.get('loadingSplash')
    this.loading = window.pleaseWait
      logo: '/images/Meteor-logo.png',
      backgroundColor: '#7f8c8d',
      loadingHtml: message + spinner

    Session.set('loadingSplash', true); # just show loading splash once

Template.loading.destroyed = ->
  if this.loading
    this.loading.finish()

message = '<p class="loading-message">Loading Petition!</p>'
spinner = '<div class="sk-spinner sk-spinner-cube-grid">
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
      <div class="sk-cube"></div>
    </div>'
