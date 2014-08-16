App.Response = DS.Model.extend({
  worksheet: DS.belongsTo('worksheet'),
  student: DS.belongsTo('student'),
  answers: DS.attr(),
  submitted: DS.attr('boolean')
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