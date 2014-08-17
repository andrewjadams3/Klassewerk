App.WorksheetsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('worksheet');
  }
});

App.WorksheetsNewRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render({
      into: "worksheets"
    })
  }
})