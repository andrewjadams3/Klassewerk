App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
  inputFields: DS.attr(),
  responses: DS.hasMany('response', {async:true}),
  teacher: DS.belongsTo('teacher', {async:true}),

  completed: function() {
    return (this.get('responses.length') > 0)
  }.property('responses.length'),

  styles: function() {
    var i, styles = [], field;
    var inputFields = this.get('inputFields')

    for(i=0; i<inputFields.length; i++) {
      field = inputFields[i];

      styles[i] = {style: "left: " + field.x +
                  "; top: " + field.y +
                  "; height: " + field.height +
                  "; width: " + field.width}
    }

    return styles
  }.property('inputFields')

});


App.Worksheet.FIXTURES =
[
  {
    id: 1,
    name: "Proportions Worksheet",
    url: 'http://winterrowd-math.wikispaces.com/file/view/wkst_proportions_pg_1.png',
    inputFields: [
      {
        "question": "1",
        "content": "Hello everyone",
        "position": {
            "left": "239px",
            "top": "52px",
            "width": "154px",
            "height": "59px"
        }
      },
      {
        "question": "2",
        "content": "Ima bear",
        "position": {
            "left": "438px",
            "top": "322px",
            "width": "100px",
            "height": "48px"
        }
    },
    {
        "question": "3",
        "content": "What",
        "position": {
            "left": "164px",
            "top": "344px",
            "width": "100px",
            "height": "48px"
        }
    }
  ],
  answerKey: [
    {
        "question": "1",
        "content": "Hello everyone",
        "position": {
            "left": "239px",
            "top": "52px",
            "width": "154px",
            "height": "59px"
        }
    },
    {
        "question": "2",
        "content": "Ima bear",
        "position": {
            "left": "438px",
            "top": "322px",
            "width": "100px",
            "height": "48px"
        }
    },
    {
        "question": "3",
        "content": "What",
        "position": {
            "left": "164px",
            "top": "344px",
            "width": "100px",
            "height": "48px"
        }
    }
  ]
},
{
  id: 2,
  name: "Multiplication Worksheet",
  url: 'http://www.math-salamanders.com/image-files/math-worksheets-3rd-grade-multiplication-2-3-4-5-10-times-tables-3.gif',
  inputFields: [
    {
        "question": "1",
        "content": "Hello everyone",
        "position": {
            "left": "239px",
            "top": "52px",
            "width": "154px",
            "height": "59px"
        }
    },
    {
        "question": "2",
        "content": "Ima bear",
        "position": {
            "left": "438px",
            "top": "322px",
            "width": "100px",
            "height": "48px"
        }
    },
    {
        "question": "3",
        "content": "What",
        "position": {
            "left": "164px",
            "top": "344px",
            "width": "100px",
            "height": "48px"
        }
    }
  ],
  answerKey: [
    {
        "question": "1",
        "content": "Hello everyone",
        "position": {
            "left": "239px",
            "top": "52px",
            "width": "154px",
            "height": "59px"
        }
    },
    {
        "question": "2",
        "content": "Ima bear",
        "position": {
            "left": "438px",
            "top": "322px",
            "width": "100px",
            "height": "48px"
        }
    },
    {
        "question": "3",
        "content": "What",
        "position": {
            "left": "164px",
            "top": "344px",
            "width": "100px",
            "height": "48px"
        }
    }
  ]
}];
