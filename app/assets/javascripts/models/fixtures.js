App.WORKSHEETS = [{
  id: 1,
  url: '/http://winterrowd-math.wikispaces.com/file/view/wkst_proportions_pg_1.png',
  input_fields: [{
    x: 50,
    y: 50,
    height: 50,
    width: 50
  },{
    x: 150,
    y: 50,
    height: 50,
    width: 50
  }]
}]

App.ENROLLMENTS = [{
  id: 1,
  student: 1,
  classroom: 1
}]

App.ASSIGNMENTS = [{
  id: 1,
  classroom: 1,
  worksheet: 1,
  due_date: new Date('2015'),
  assigned_date: new Date('2015')
},{
  id: 2,
  classroom: 1,
  worksheet: 1,
  due_date: new Date('2015'),
  assigned_date: new Date('2013')
},{
  id: 3
  classroom: 1,
  worksheet: 1,
  due_date: new Date('2013'),
  assigned_date: new Date('2013')
}]

App.GRADING_PERIODS = [{
  id: 1,
  start_date: new Date('2012'),
  end_date: new Date('2016')
}]

App.SCHOOLS = [{
  id: 1,
  code: '1234',
  location: 'Chicago',
  name: 'DBC',
  mascot: 'Salamanders'
}]

App.STUDENTS = [{
  id: 1,
  first_name: 'Steve',
  last_name: 'Steve',
  username: 'steve',
  school: 1
},{
  id: 2,
  first_name: 'Bob',
  last_name: 'Bob',
  username: 'bob',
  school: 1
}]

App.TEACHERS = [{
  id: 1,
  first_name: 'Bill',
  last_name: 'Bill',
  email: 'bill@bill.com',
  school: 1
}]
