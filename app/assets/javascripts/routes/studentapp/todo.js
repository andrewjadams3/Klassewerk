App.TodoRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('studentapp/todo')
  },
  model: function() {
    return this.store.find('worksheet')
  }
})

// App.CreateResponseRoute = Ember.Route.extend({
//   renderTemplate: function() {
//     this.render('studentapp/create_response')
//   },
//   model: function(params) {
//     return this.store.find('assignment', params.id)
//   }
// })