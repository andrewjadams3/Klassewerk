// var AssignmentsController = Ember.ArrayController.extend({
//   assignments: model.get('')
// })

Ember.ArrayController.reopen({
  sortAscending: false,
  sortProperties: ['numericId']
})

App.ApplicationController = Ember.Controller.extend({
  actions: {
    modalDelete: function() {
      $('#deleteModal').hide()
      var model = this.store.find('worksheet', App.modalWorksheetId).then(function(worksheet) {
        worksheet.destroyRecord();
      })

      App.modalWorksheetId = null;
      $('#deleteModal').hide()
      this.transitionTo('worksheets');
    },
    modalCancel: function() {
      App.modalWorksheetId = null;
      $('#deleteModal').hide()
    }
  }
})