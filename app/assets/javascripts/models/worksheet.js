App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  inputFields: DS.hasMany('inputField', {embedded: 'always'})
});

App.InputField = DS.Model.extend({
  x: DS.attr('number'),
  y: DS.attr('number'),
  height: DS.attr('number'),
  width: DS.attr('number'),
})
