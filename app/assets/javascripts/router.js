// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.resource("teacherapp", function() {
    this.route("logout");
    this.resource("worksheets");
    this.resource("classrooms");
    this.resource("teacher", {path: "/account"});
  });
  this.resource("studentapp");
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})
