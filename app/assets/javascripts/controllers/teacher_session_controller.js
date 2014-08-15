App.TeacherSessionController = Ember.ObjectController.extend({
  content: {},
  actions: {
    authenticate: function() {
      console.log(this.getProperties('username', 'password'))
      var data = {
        username: this.get('username'),
        password: this.get('password')
      }
      var self = this;

      $.get('/auth/teacher', data, function(response) {
        alert(response)
        self.transitionToRoute('teacher')
      }).fail(function() {
        alert("Failure!")
      }, 'json')
    },

    logout: function() {
      $.get('/auth/logout', function(response) {
        transitionTo('/')  
      })
    }
  }
})
