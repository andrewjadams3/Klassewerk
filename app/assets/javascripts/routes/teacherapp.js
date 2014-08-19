App.TeacherappRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render({
      into: 'application'
    })
  }
})

App.TeacherappIndexRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/index_left', {
      into: 'teacherapp',
      outlet: 'left'
    })
    this.render('teacherapp/index_right', {
      into: 'teacherapp',
      outlet: 'right'
    })
  }
})