var Field = function( board, x, y, width, height) {
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
    .append("<div contenteditable='true' class='content'></div>")
    .click(function(e) {
      e.stopPropagation();
    });
};

App.CreateResponseController = Ember.ObjectController.extend({
  actions: {
    loadFields: function() {
      var model = this.get('model');
      var inputFields = model.get('inputFields');
      tags=[];
      for(i = 0; i < inputFields.length; i++) {
        var post = inputFields[i];
        new Field($('.post_board'), post["x"], post["y"], post["width"], post["height"]);
      }
    },
    submitResponse: function() {
      var model = this.get('model');
      var i, response;
      var $fields = $('.post_board .post-it');
      var answers = [];
      for(i = 0; i < $('.post_board .post-it').length; i++) {
        $post = $fields.eq(i);
        response = {
            "content": $post.text()
        };
        answers.push(response);
      }
      console.log(JSON.stringify(answers));
      console.log(this.get('model'));
      var responseRecord = this.store.createRecord('response', {
        answers: answers,
        worksheet: this.get('model'),
        submitted: true
      });
      responseRecord.save();
      return answers;
    }
  }
});
