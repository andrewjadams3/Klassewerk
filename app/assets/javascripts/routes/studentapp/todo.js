App.TodoRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/todo', {
      into: 'studentapp',
      outlet: 'left'
    })
  },

  model: function() { 
    return this.store.find('worksheet')
  }
})

App.TodoIndexRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('worksheet')
  }
})

App.CreateResponseRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/create_response', {
      into: 'studentapp', 
      outlet: 'right'
    })
  },
  model: function(params) {
    return this.store.find('worksheet', params.id)
  }
})