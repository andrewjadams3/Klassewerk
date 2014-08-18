App.Response = DS.Model.extend({
  worksheet: DS.belongsTo('worksheet', {async:true}),
  student: DS.belongsTo('student'),
  answers: DS.attr(),
  submitted: DS.attr('boolean'),

  worksheetId: function() {
    return this.get('worksheet.id')
  }.property('worksheet.id'),

  fields: function() {
    var styles = this.get('worksheet.styles')
    var answers = this.get('answers')
    var i;
    var array = []

    if(styles) {
      for(i=0; i<answers.length; i++) {
        if(styles[i] && answers[i]) {
          array[i] = {style: styles[i].style, answer: answers[i].content}
        }
      }
    }

    return array
  }.property('worksheet.styles', 'answers')
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