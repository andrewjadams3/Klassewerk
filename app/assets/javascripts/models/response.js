App.Response = DS.Model.extend({
  worksheet: DS.belongsTo('worksheet', {async:true}),
  student: DS.belongsTo('student'),
  answers: DS.attr(),
  submitted: DS.attr('boolean'),

  formattedAnswers: function() {
    var i, field
    var answers = this.get('answers')
    var worksheet = this.get('worksheet')
    // var fields = worksheet.inputFields
  
    var formatted = answers
    for(i=0; i<answers.length; i++) {
      // field = worksheet.inputFields[i]

      console.log(worksheet.name)

      formatted[i].worksheetName = worksheet.name

      // formatted[i].formatStyle = "left: " + field.x + 
      //                      "px; top: " + field.y + 
      //                      "px; height: " + field.height + 
      //                      "px; width: " + field.width + "px;"
    }
    return formatted
  }.property('answers', 'worksheet.name')
})

App.Response.FIXTURES = [{
  id: 1,
  worksheet: 1,
  student: 1,
  answers: [],
  submitted: false
},{
  id: 2,
  worksheet: 1,
  student: 2,
  answers: [],
  submitted: true
}]