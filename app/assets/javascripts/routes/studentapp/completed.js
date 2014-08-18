App.CompletedRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/completed', {
      outlet: 'left',
      into: 'studentapp'
    })
  },
  model: function() {
    return this.store.find('response')
  }
})

App.CompletedResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/completed_response', {
      outlet: 'right',
      into: 'studentapp'
    })
  },
  model: function(params) {
    return this.store.find('response', params.id)
  }
})

App.SubmissionsResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('response',  {
      into: 'studentapp',
      outlet: 'right'
    })
  },
  model: function(params) {
    return this.store.find('response', params.id)
  }
})