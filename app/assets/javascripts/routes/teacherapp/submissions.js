App.SubmissionsIndexRoute = Ember.Route.extend({
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
      into: 'teacherapp',
      outlet: 'left'
    })
  },
  model: function(params) {
    return this.store.find('worksheet', params.id)
  }
})

App.SubmissionsResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/submissions_response',  {
      into: 'teacherapp',
      outlet: 'right'
    })
  },
  model: function(params) {
    return this.store.find('response', params.id)
  }
})