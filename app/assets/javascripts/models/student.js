App.Student = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  username: DS.attr('string'),
  school: DS.belongsTo('school'),
  responses: DS.hasMany('responses'),
  classrooms: DS.hasMany('classrooms')
})

App.Student.FIXTURES = [{
  id: 1,
  firstName: 'Steve',
  lastName: 'Steve',
  username: 'steve',
  school: 1
},{
  id: 2,
  firstName: 'Bob',
  lastName: 'Bob',
  username: 'bob',
  school: 1
}]