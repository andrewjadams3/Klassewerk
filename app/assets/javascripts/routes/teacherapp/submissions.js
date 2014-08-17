App.SubmissionsRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/submissions')
  },
  model: function() {
    return this.store.find('worksheet')
  }
})