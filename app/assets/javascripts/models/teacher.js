App.Teacher = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  email: DS.attr('string'),
  school: DS.belongsTo('school'),
  classrooms: DS.hasMany('classrooms'),
  worksheets: DS.hasMany('worksheets')
})

App.Teacher.FIXTURES = [{
  id: 1,
  firstName: 'Bill',
  lastName: 'Bill',
  email: 'bill@bill.com',
  school: 1
}]