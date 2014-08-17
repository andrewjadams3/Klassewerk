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