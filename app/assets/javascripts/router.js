// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.resource("teachers", function() {
    this.route("logout");
    this.resource("worksheets");
    this.resource("classrooms");
    this.resource("teacher", {path: "/account"});
  });
  this.resource("students");
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})
