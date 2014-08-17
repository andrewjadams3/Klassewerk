App.Classroom = DS.Model.extend({
  title: DS.attr('string'),
  code: DS.attr('string'),
  teacher: DS.belongsTo('teacher'),
  gradingPeriod: DS.belongsTo('gradingPeriod'),
  assignments: DS.hasMany('assignment', {async: true})
})
