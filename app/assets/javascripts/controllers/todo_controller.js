App.TodoController = Ember.ArrayController.extend({
  actions: {
    clearFields: function() {
      $('.post-it').remove();
    }
  }
});
