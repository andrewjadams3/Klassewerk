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
      $('.post_board').remove()
      $('#image_panel').append('<div class="post_board"><img class="worksheet-img" src="'+this.get('model.url')+'"></div>');
    },

    saveTags: function() {

    },

    edit: function() {
      var tags = []
      var PostIt = function( board, x, y, width, height, question) {
          this.question = question;
          this.x = x;
          this.y = y;
          this.height = height;
          this.width = width;
          tags.push(this);
          console.log(this);
          console.log(tags);
          board.append("<div class = 'post-it' id=" + question + "></div>");
          this.$elem = $('.post-it').last();
          var position = this.$elem.position();
          this.$elem
            .css('left', this.x)
            .css('top', this.y)
            .css('height', this.height)
            .css('width', this.width)
            .append("<div class='header'><a class='to-image'>Input: " + this.question + "</a> <a class='destroy'>X</a></div>")
            .append("<div contenteditable='true' class='content'></div>")
            .click(function(e) {
              e.stopPropagation()
            })
            .draggable({handle: ".header"})
            .resizable();
          this.$elem.on('click', '.destroy', function(e) {
            e.stopPropagation();
            question -= 1;
            $(this).closest('.post-it').remove();
            tags.pop();
            console.log(tags);
          });
      } //PostIt
      var question = 0
      var image = $('.post_board').last();
      console.log(image);
      image.click(function(event) {
        var x = event.offsetX;
        var y = event.offsetY;
        console.log(x);
        question += 1
        console.log(this)
        console.log($(this));
        new PostIt($(this), x, y, "100px", "48px", question);
      });
    },//Edit Action
  }//Actions
});
