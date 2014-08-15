// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.route("teachers", { path: "/teachers" });
  this.route("students", { path: "/students" });
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})