App.SubmissionsRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/submissions', {
      into: 'teacherapp',
      outlet: 'left'
    })
  },
  model: function() {
    return this.store.find('worksheet')
  }
})

App.SubmissionsResponsesRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/submissions_responses',  {
      outlet: 'responses'
    })
  },
  model: function(params) {
    return this.store.find('worksheet', params.id)
  }
})

App.SubmissionsResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/submissions_response',  {
      outlet: 'response'
    })
  },
  model: function(params) {
    return this.store.find('response', params.id)
  }
})