var tags = []

// --------------PostIt def-------------------
var PostIt = function(board, x, y, width, height) {
  this.x = x;
  this.y = y;
  this.height = height;
  this.width = width;
  tags.push(this);

  lastPostIt = this //----------------------

  board.append("<div class = 'post-it' id=" + tags.length + "><a><i class='fa fa-times destroy'></i></a></div>");
  this.$elem = $('.post-it').last();
  var position = this.$elem.position();
  this.$elem
    .css('left', this.x)
    .css('top', this.y)
    .css('height', this.height)
    .css('width', this.width)
    .append("<div class='content'></div>")
    .click(function(e) {
      e.stopPropagation()
    })
    .draggable({
      containment: "parent"
    })
    .resizable();
  this.$elem.on('click', '.destroy', function(e) {
    e.stopPropagation();
    $(this).closest('.post-it').remove();
    for (i = 0; i < $('.header').length; i++) {
      $('.to-image').eq(i).text((i + 1) + ".  ");
    }
    tags.pop();
  });
}


App.WorksheetController = Ember.ObjectController.extend({

  actions: {
    delete: function() {
      if(App.modalWorksheetId == null) {
        App.modalWorksheetId = this.content.id
        $('#deleteModal').show()
      }
    },
    loadTags: function() {
      var image = $('.post_board').last();
      if ($('.post-it')) {
        $('.post-it').remove();
      }
      if (image.attr('class') != "post_board clickable") {
        image.addClass('clickable');

        image.click(function(event) {
          if ($(event.target).is("img")) {
            var x = event.offsetX;
            var y = event.offsetY;
            if ($('.post-it').last()) {
              var elem = $('.post-it').last()
              new PostIt(
                $('.post_board').last(),
                x,
                y,
                elem.css('width'),
                elem.css('height'));
            } else {
              new PostIt($(this), x, y, "2em", ".9em");
            }
          }
        });
      }
      var model = this.get('model')
      var inputFields = model.get('inputFields') || []

      tags = []
      for (i = 0; i < inputFields.length; i++) {
        var field = inputFields[i]
        new PostIt($('.post_board'), field["x"], field["y"], field["width"], field["height"]);
      };

    },
    saveTags: function() {

      var model = this.get('model')
      var i, post;
      var $postIts = $('.post_board .post-it')
      var posts = []
      for (i = 0; i < $('.post_board .post-it').length; i++) {
        $post = $postIts.eq(i)
        post = {
          "x": $post.css('left'),
          "y": $post.css('top'),
          "width": $post.css('width'),
          "height": $post.css('height')
        }
        posts.push(post);
      }

      var onSuccess = function(post) {
        $(".alert-box").remove();
        $("#edit-ws-title").prepend("<div data-alert class='alert-box'>Your worksheet was saved!<a class='close'>&times;</a></div>");
      };

      var onFail = function(post) {
        $(".alert-box").remove();
        $("#edit-ws-title").prepend("<div data-alert class='alert-box alert'>Uh oh! Something went wrong...<a class='close'>&times;</a></div>");
      };

      if(posts.length == 0) { posts = []; };

      model.set('inputFields', posts);
      model.save().then(onSuccess, onFail);
      return posts;
    }
  } //Actions
});
