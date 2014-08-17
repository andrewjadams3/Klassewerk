App.WorksheetController = Ember.ObjectController.extend({
  actions: {
    loadWorksheet: function() {
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
    console.log(posts)
  }
  boards[currentBoard] = posts

  $('.post_board').remove()
  new Board()
    },
    loadTags: function() {
      var name = this.get('model.name');
      console.log(name);
  //       for(key in samples) {
  //   $('#board_list').append("<button>"+key+"</button><br>")
  //   boards[key] = samples[key]
  // }

  // $('#load_samples').remove()
    }
  }
});