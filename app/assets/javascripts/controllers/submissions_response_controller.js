App.SubmissionsResponseController = Ember.ObjectController.extend({

  actions: {
    saveNotes: function() {
      var onSuccess = function(post) {
        $(".alert-box").remove();
        $("textarea").before("<div data-alert class='alert-box'>Your notes were saved!<a class='close'>&times;</a></div>");
      };

      var onFail = function(post) {
        $(".alert-box").remove();
        $("textarea").before("<div data-alert class='alert-box alert'>Uh oh! Something went wrong...<a class='close'>&times;</a></div>");
      };
      var model = this.get('model');
      model.save().then(onSuccess, onFail);
      return model;
    }
  }
});