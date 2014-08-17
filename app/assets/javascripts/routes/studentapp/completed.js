App.CompletedRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/completed')
  },
  model: function() {
    return this.store.find('response')
  }
})

App.CompletedResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/completed_response')
  },
  model: function(params) {
    return this.store.find('response', params.id)
  }
})