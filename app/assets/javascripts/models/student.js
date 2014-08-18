App.Student = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  username: DS.attr('string'),
  responses: DS.hasMany('response'),
  teacher: DS.belongsTo('teacher')
})
