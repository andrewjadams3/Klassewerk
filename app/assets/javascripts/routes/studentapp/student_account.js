App.StudentAccountRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/account', {
      into: 'studentapp',
      outlet: 'left'
    })
  }
})

App.StudentAccountEditRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/account_edit', {
      into: 'studentapp',
      outlet: 'right'
    })
  },
  model: function() {
    return this.store.find('student')
  }
})
