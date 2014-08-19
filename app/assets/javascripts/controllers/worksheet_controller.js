var test = this
var tags = []

// --------------PostIt def-------------------
var PostIt = function(board, x, y, width, height) {
  this.x = x;
  this.y = y;
  this.height = height;
  this.width = width;
  tags.push(this);
  board.append("<div class = 'post-it' id=" + tags.length + "><a><i class='fa fa-bomb destroy'></i></a></div>");
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
      containment: "parent",
      grid: [ 5, 5 ]
    })
    .resizable({
      grid: [ 5, 5 ]
    });
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
            new PostIt($(this), x, y, "100px", "48px");
          }
        });
      }
      var model = this.get('model')
      var inputFields = model.get('inputFields')
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
        posts.push(post)
      }
      console.log(JSON.stringify(posts))
      model.set('inputFields', posts);
      model.save();
      $("#edit-ws-title").prepend("<div data-alert class='alert-box success'>Your shit was Saved!<a href='#'' class='close'>&times;</a></div>")
      return posts;
    }
  } //Actions
});
