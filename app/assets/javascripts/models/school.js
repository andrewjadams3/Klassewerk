App.School = DS.Model.extend({
  code: DS.attr('string'),
  location: DS.attr('string'),
  name: DS.attr('string'),
  mascot: DS.attr('string')
})

App.School.FIXTURES = [{
  id: 1,
  code: '1234',
  location: 'Chicago',
  name: 'DBC',
  mascot: 'Salamanders'
}]