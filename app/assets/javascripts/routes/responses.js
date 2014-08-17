App.ResponsesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('response', {classroom: parseInt(this.modelFor('assignment').id)});
  },
  renderTemplate: function() {
    this.render({ outlet: 'responses' });
  }
})
