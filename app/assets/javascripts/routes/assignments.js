App.AssignmentsRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('assignment', {classroom: parseInt(this.modelFor('classroom').id)});
  },
  renderTemplate: function() {
    this.render({ outlet: 'assignments' });
  }
})