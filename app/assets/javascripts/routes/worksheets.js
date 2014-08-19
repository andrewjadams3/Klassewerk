App.WorksheetsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('worksheet');
  },
  renderTemplate: function() {
    this.render('teacherapp/worksheets', {
      into: "teacherapp",
      outlet: 'left'
    })
  }
});

App.WorksheetsNewRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render({
      into: "teacherapp",
      outlet: "right"
    })
  }
})

App.WorksheetsIndexRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/worksheets_index',{
      into: "teacherapp",
      outlet: "right"
    })
  }
})
