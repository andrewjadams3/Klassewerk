App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  inputFields: DS.attr(),
  answerKey: DS.attr()
});


App.Worksheet.FIXTURES = [{
  id: 1,
  name: "Proportions Worksheet",
  url: 'http://winterrowd-math.wikispaces.com/file/view/wkst_proportions_pg_1.png',
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
},
{
  id: 2,
  name: "Multiplication Worksheet",
  url: 'http://www.math-salamanders.com/image-files/math-worksheets-3rd-grade-multiplication-2-3-4-5-10-times-tables-3.gif',
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
