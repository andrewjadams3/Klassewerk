App.WorksheetView = Ember.View.extend({
  templateName: "worksheet",

  didInsertElement: function() {
    this.get('controller').send('loadTags');
  }.observes('controller.model')
});
