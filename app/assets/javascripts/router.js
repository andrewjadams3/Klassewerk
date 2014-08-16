// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.resource("teacherapp", function() {
    this.resource("classrooms", function() {
      this.resource('classroom', { path: "/:id" })
    });


    this.resource("worksheets");
    this.resource("teacher", {path: "/account"});
  });
  this.resource("studentapp");
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})
