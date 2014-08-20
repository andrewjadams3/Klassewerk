App.AccountEditController = Ember.ArrayController.extend({
  actions: {
    saveChanges: function() {
      var onSuccess = function(post) {
        $(".alert-box").remove();
        $(".alert-div").prepend("<div data-alert class='alert-box'>Your account has been updated!<a class='close'>&times;</a></div>");
      };

      var onFail = function(post) {
        $(".alert-box").remove();
        $(".alert-div").prepend("<div data-alert class='alert-box alert'>Uh oh! Something went wrong...<a class='close'>&times;</a></div>");
      };
      this.get('model').save().then(onSuccess, onFail);;
    }
  }
});