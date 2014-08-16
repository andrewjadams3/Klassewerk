App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  inputFields: DS.attr(),
  answerKey: DS.attr()
});


App.Worksheet.FIXTURES = [{
  id: 1,
  name: "worksheet",
  url: '/http://winterrowd-math.wikispaces.com/file/view/wkst_proportions_pg_1.png',
  inputFields: [{
    "x": "50",
    "y": "50",
    "height": "50",
    "width": "50"
  },{
    "x": "150",
    "y": "50",
    "height": "50",
    "width": "50"
  }],
  answerKey: [{
    "x": "50",
    "y": "50",
    "height": "50",
    "width": "50"
  },{
    "x": "150",
    "y": "50",
    "height": "50",
    "width": "50"
  }]
}]
