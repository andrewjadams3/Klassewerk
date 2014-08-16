App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  input_fields: DS.attr('sting'),
  answer_key: DS.attr('string')
});


App.Worksheet.FIXTURES = [{
  id: 1,
  url: '/http://winterrowd-math.wikispaces.com/file/view/wkst_proportions_pg_1.png',
  input_fields: '[{
    "x": "50",
    "y": "50",
    "height": "50",
    "width": "50"
  },{
    "x": "150",
    "y": "50",
    "height": "50",
    "width": "50"
  }]',
  answer_key: '[{
    "x": "50",
    "y": "50",
    "height": "50",
    "width": "50"
  },{
    "x": "150",
    "y": "50",
    "height": "50",
    "width": "50"
  }]'
}]
