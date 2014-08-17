App.Worksheet = DS.Model.extend({
  name: DS.attr('string'),
  url: DS.attr('string'),
<<<<<<< HEAD
  inputFields: DS.attr(),
  answerKey: DS.attr()
});


App.Worksheet.FIXTURES = [{
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
}]
=======
  inputFields: DS.attr()
});
>>>>>>> master
