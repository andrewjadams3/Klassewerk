App.Assignment = DS.Model.extend({
  classroom: DS.belongsTo('classroom', {async: true}),
  worksheet: DS.belongsTo('worksheet'),
  dueDate: DS.attr('date'),
  assignedDate: DS.attr('date')
})

App.Assignment.FIXTURES = [{
  id: 1,
  classroom: 1,
  worksheet: 1,
  dueDate: new Date('2015'),
  assignedDate: new Date('2015')
},{
  id: 2,
  classroom: 1,
  worksheet: 1,
  dueDate: new Date('2015'),
  assignedDate: new Date('2013')
},{
  id: 3,
  classroom: 2,
  worksheet: 1,
  dueDate: new Date('2013'),
  assignedDate: new Date('2013')
}]
