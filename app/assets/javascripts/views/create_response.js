App.CreateResponseView = Ember.View.extend({
  templateName: "studentapp/create_response",

  didInsertElement: function() {
    this.get('controller').send('loadFields');
  }.observes('controller.model')
});
