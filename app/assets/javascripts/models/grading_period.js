App.GradingPeriod = DS.Model.extend({
  startDate: DS.attr('date'),
  endDate: DS.attr('date')
})

App.GRADING_PERIODS = [{
  id: 1,
  startDate: new Date('2012'),
  endDate: new Date('2016')
}]