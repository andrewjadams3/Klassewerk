App.IndexRoute = Ember.Route.extend({
  beforeModel: function() {
    var self = this;

    $.getJSON("/api/v1", function(json) {
      self.transitionTo(json.app);
    });
  }
})
