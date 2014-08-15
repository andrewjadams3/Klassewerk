// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  // this.resource('posts');
  this.resource('teacher', function() {
    this.route('session');
  })
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})
