App.WorksheetRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('worksheet', params.worksheetId)
  },
  renderTemplate: function() {
    this.render({
      into: 'teacherapp',
      outlet: 'right'
    })
  }
})