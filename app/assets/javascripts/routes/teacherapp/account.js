App.AccountRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/account', {
      into: 'teacherapp',
      outlet: 'left'
    })
  }
})

App.AccountStudentsRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/account_students', {
      into: 'teacherapp',
      outlet: 'right'
    })
  },
  model: function() {
    return this.store.find('student')
  }
})

App.AccountEditRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/account_edit', {
      into: 'teacherapp',
      outlet: 'right'
    })
  },
  model: function() {
    return this.store.find('teacher')
  }
})
