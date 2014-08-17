App.WorksheetsController = Ember.ArrayController.extend({
  actions: {
    clear: function() {
      $('.post_board').remove();
    }
  }
});
