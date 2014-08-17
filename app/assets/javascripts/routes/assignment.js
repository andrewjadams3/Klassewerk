App.AssignmentRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('assignment', params.assignmentId)
  }
})
