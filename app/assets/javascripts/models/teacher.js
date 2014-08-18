App.Teacher = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  email: DS.attr('string'),
  classCode: DS.attr('string'),
  worksheets: DS.hasMany('worksheet', {
    async: true
  })
})

App.Teacher.FIXTURES = [{
  id: 1,
  firstName: 'Bill',
  lastName: 'Bill',
  email: 'bill@bill.com',
  school: 1
}]
