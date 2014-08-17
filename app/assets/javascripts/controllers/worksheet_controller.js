var test = this
var tags = []

      // --------------PostIt def-------------------
var PostIt = function( board, x, y, width, height) {
    this.x = x;
    this.y = y;
    this.height = height;
    this.width = width;
    tags.push(this);
    board.append("<div class = 'post-it' id=" + tags.length + "></div>");
    this.$elem = $('.post-it').last();
    var position = this.$elem.position();
    this.$elem
      .css('left', this.x)
      .css('top', this.y)
      .css('height', this.height)
      .css('width', this.width)
      .append("<div class='header'><a class='to-image'>Input: " + tags.length + "</a> <a class='destroy'>X</a></div>")
      .append("<div contenteditable='true' class='content'></div>")
      .click(function(e) {
        e.stopPropagation()
      })
      .draggable({handle: ".header"})
      .resizable();
    this.$elem.on('click', '.destroy', function(e) {
      e.stopPropagation();
      $(this).closest('.post-it').remove();
      tags.pop();
    });
}


App.WorksheetController = Ember.ObjectController.extend({
  actions: {

    loadTags: function() {
      var model = this.get('model')
      var inputFields = model.get('inputFields')
      tags=[]
      for(i in inputFields) {
        var postit
        var post = inputFields[i]
        console.log(i);
        console.log(inputFields[i]);
        postit = new PostIt($('.post_board'), post['position']['left'], post['position']['top'], post['position']['width'], post['position']['height']);
        postit.$elem.find('.content').text(post.content);
      };
    },

    loadWorksheet: function() {
      tags=[]
      $('.post_board').remove()
      $('#image_panel').append('<div class="post_board"><img class="worksheet-img" src="'+this.get('model.url')+'"></div>');
      console.log(test)
    },

    saveTags: function() {
      var model = this.get('model')
      var i, post;
      var $postIts = $('.post_board .post-it')
      var posts = []
      for(i = 0; i < $('.post_board .post-it').length; i++) {
        $post = $postIts.eq(i)
        post = {
          "question": $post.attr("id"),
          "content": $post.find('.content').text(),
          "position": {
            "left": $post.css('left'),
            "top": $post.css('top'),
            "width": $post.css('width'),
            "height": $post.css('height')
          }
        }
        posts.push(post)
      }
      console.log(JSON.stringify(posts))
      model.set('inputFields', posts);
      model.save();
      return posts;
    },

    editTags: function() {
      var image = $('.post_board').last();
      image.click(function(event) {
        var x = event.offsetX;
        var y = event.offsetY;
        new PostIt($(this), x, y, "100px", "48px");
      });
    }//Edit Action
  }//Actions
});
