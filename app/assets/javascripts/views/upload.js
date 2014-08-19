App.WorksheetsNewView = Ember.View.extend({
  first_name: "steve",
  templateName: "teacherapp/upload",
  didInsertElement: function() {
    var router = this.get('controller.target.router');

    $('form#file_upload').on('submit', function(e) {
      var files, formData, i
      e.preventDefault();

      files = document.getElementById('file_path').files
      formData = new FormData();

      for (i = 0; i < files.length; i++) {
        var file = files[i];
        console.log(file)
        formData.append('file', file, file.name)
      }

      $('form#file_upload input[type=submit]').replaceWith('<img src="/assets/ajax-loader.gif">')

      $.ajax('/temp/upload', {
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(params) {
          alert(params.id)
          router.transitionTo('worksheet.edit', params.id)
        },
        error: function(response) {
          alert("The file could not be uploaded")
          console.log(response)
        }
      })
    })
  }
});
