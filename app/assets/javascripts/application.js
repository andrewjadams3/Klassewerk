// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.ui.touch-punch
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require ./app
//= require foundation

// for more details see: http://emberjs.com/guides/application/

//= require_tree .

App = Ember.Application.create({
  rootElement: '#ember-app',
  LOG_TRANSITIONS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_ACTIVE_GENERATION: true
});

// App.ApplicationView = Em.View.extend({
//   initFoundation: function(){
//     this.$(document).foundation()
//   }.on('didInsertElement')
// });

Ember.View.reopen({
  didInsertElement : function(){
    this._super();
    $('#deleteModal').hide();
    App.modalWorksheetId = null;
    Ember.run.scheduleOnce('afterRender', this, this.afterRenderEvent);
  },
  afterRenderEvent : function(){
    Ember.$(document).foundation();
  }
});



function selectText(element) {
    var doc = document
        , text = doc.getElementsByClassName(element)[0]
        , range, selection
    ;    
    if (doc.body.createTextRange) { //ms
        range = doc.body.createTextRange();
        range.moveToElementText(text);
        range.select();
    } else if (window.getSelection) { //all others
        selection = window.getSelection();        
        range = doc.createRange();
        range.selectNodeContents(text);
        selection.removeAllRanges();
        selection.addRange(range);
    }
}

$(function() {
  // $(document).foundation();
  $(document).on('click', '.class-code', function() {
    selectText('class-code')
  });
});



DS.Model.reopen({
  numericId: function() {
    return parseInt(this.get('id'))
  }.property('id')
})
