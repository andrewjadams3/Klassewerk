App.Teacher = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  email: DS.attr('string'),
  username: DS.attr('string'),
  security_question: DS.attr('string')
})