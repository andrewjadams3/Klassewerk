App.Student = DS.Model.extend({
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  username: DS.attr('string'),
  school: DS.belongsTo('school'),
  responses: DS.hasMany('response'),
  classrooms: DS.hasMany('classroom')
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