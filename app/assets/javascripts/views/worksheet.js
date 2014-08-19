App.WorksheetView = Ember.View.extend({
  templateName: "worksheet",

  didInsertElement: function() {
    this.get('controller').send('drop_image');
  }
});
