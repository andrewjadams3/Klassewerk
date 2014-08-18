App.AccountRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('teacherapp/account', {
      into: 'teacherapp',
      outlet: 'left'
    })
  }
})