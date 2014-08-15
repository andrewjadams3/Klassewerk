App.TeacherIndexRoute = Ember.Route.extend({
  model: function() {
    console.log(this.store.find('teacher', 1))
    return (this.store.find('teacher', 1))
  }
})