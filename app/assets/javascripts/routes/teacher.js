App.TeacherRoute = Ember.Route.extend({
  model: function(params) { return this.store.find('teacher', params.id) }
})