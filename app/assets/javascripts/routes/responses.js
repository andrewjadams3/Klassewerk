App.ResponsesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('response');
  },
  renderTemplate: function() {
    this.render({
      outlet: 'responses'
    });
  }
})
