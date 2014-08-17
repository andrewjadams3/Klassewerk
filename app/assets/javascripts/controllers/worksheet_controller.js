App.WorksheetController = Ember.ObjectController.extend({
  actions: {
  //   loadTags: function() {
  //     var name = this.get('model.name');
  //     var model = this.get('model')
  //     var input_field = model.get('inputFields');
  //     console.log(model);
  //     console.log(name);
  //     console.log(input_field[0].left);
  //     console.log(input_field[0].right);
  //     console.log(input_field[1].left);
  //     console.log(input_field[1].right);
  //   }
  // }

    loadWorksheet: function() {
      $('#image_panel').append('<div class="post_board"><img class="worksheet-img" src="'+this.get('model.url')+'"></div>')
    }
  }
});
