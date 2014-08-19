App.TodoRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/todo', {
      into: 'studentapp',
      outlet: 'left'
    })
  },
  model: function() {
    return this.store.find('student')
  }
})

App.TodoIndexRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/todo_index', {
      into: 'studentapp',
      outlet: 'right'
    })
  },
})

App.CreateResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render({
      into: 'studentapp',
      outlet: 'right'
    })
  },
  model: function(params) {
    return this.store.find('worksheet', params.id)
  }
})
