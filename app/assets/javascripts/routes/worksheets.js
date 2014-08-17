App.WorksheetsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('worksheet');
  }
});
