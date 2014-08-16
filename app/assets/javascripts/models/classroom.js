App.Classroom = DS.Model.extend({
  title: DS.attr('string'),
  code: DS.attr('string'),
  teacher: DS.belongsTo('teacher'),
  gradingPeriod: DS.belongsTo('gradingPeriod')
})

App.Classroom.FIXTURES = [{
  id: 1,
  teacher: 1,
  code: 'Y9BMJ3',
  title: 'English',
  gradingPeriod: 1
}]
