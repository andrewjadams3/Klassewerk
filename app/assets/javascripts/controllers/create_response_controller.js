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
    }
  }
});
