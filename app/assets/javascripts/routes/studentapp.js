App.StudentappRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render({
      into: 'application'
    })
  }
})

App.StudentappIndexRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/index_left', {
      into: 'studentapp',
      outlet: 'left'
    })
    this.render('studentapp/index_right', {
      into: 'studentapp',
      outlet: 'right'
    })
  },
  model: function() {
    return this.store.find('student')
  }
})
