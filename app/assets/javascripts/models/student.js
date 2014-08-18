var idSame = function(w_id, responseWorksheet) {
  return function(responseWorksheet) {
        return responseWorksheet.get(id) == w_id
  }
}

App.Student = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  username: DS.attr('string'),
  responses: DS.hasMany('response', {async:true}),
  teacher: DS.belongsTo('teacher'),

  incompleteWorksheets: function() {
    var worksheets = this.get('teacher.worksheets');
    var responses = this.get('responses');
    var r_length = responses.get('length');

    return worksheets.reject(function(worksheet) {
      var w_id = worksheet.get('id')

      return responses.any(function(responseWorksheet) {
        return(responseWorksheet.get('worksheetId') == w_id)
      })

    })

  }.property('responses.@each.worksheetId', 'teacher.worksheets.@each.id', 'responses.length', 'teacher.worksheets.length')
})
