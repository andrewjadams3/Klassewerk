App.ClassroomRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('classroom', params.classroomId)
  }
})