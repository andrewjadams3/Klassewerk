App.ClassroomsRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('Classroom')
  }
});
