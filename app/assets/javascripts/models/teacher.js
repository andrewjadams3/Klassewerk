App.Teacher = DS.Model.extend({
  first_name: DS.attr(),
  last_name: DS.attr(),
  username: DS.attr(),
  email: DS.attr(),
  security_question: DS.attr(),
  security_answer: DS.attr()
})