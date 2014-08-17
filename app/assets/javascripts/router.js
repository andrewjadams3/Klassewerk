// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route("index", { path: "/" });
  this.resource("teacherapp", function() {
    this.resource("submissions", function() {
      this.resource("worksheet", {path: '/:id'}, function() {
        this. resource("response", {path: '/:id'})
      })
    });

    this.resource("worksheets", function(){
      this.resource("worksheet", {path: '/:id'}, function(){
        this.route("edit")
      }),
      this.route("new")
    });

    this.resource("teacher", {path: "/account"});
  });
  this.resource("studentapp");
});

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
})
