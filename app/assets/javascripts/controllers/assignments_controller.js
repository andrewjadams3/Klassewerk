// var AssignmentsController = Ember.ArrayController.extend({
//   assignments: model.get('')
// })

Ember.ArrayController.reopen({
  sortAscending: false,
  sortProperties: ['numericId']
})