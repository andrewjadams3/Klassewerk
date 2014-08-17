App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  inputFields: DS.attr()
});