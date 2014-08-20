App.WorksheetsNewView = Ember.View.extend({
  first_name: "steve",
  templateName: "teacherapp/upload",

  didInsertElement: function() {
    var self = this
    var router = this.get('controller.target.router');
    var obj = $('.drop_image');

    var uploadFile = function() {
      var files, formData, i

      $('.file-input-container').hide()
      $('.file-input-spinner').show()

      files = document.getElementById('file_path').files
      formData = new FormData();

      for (i = 0; i < files.length; i++) {
        var file = files[i];
        console.log(file)
        formData.append('file', file, file.name)
      }

      $.ajax('/upload/upload', {
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(params) {
          $('.thumbnail img').attr('src', "/" + params['filename'])
          $('input[name=filename]').val(params['filename'])
          $('.file-input-container').show()
          $('.file-input-spinner').hide()
          $('.image-upload').hide()
          $('.image-processing').show()
          $('#submit-button').show()
        },
        error: function(response) {
          $(".file-upload-template").prepend("<div data-alert class='alert-box alert'>Your file could not be uploaded<a class='close'>&times;</a></div>");
          $(document).foundation();

          $('.file-input-container').show()
          $('.file-input-spinner').hide()

          // Try to reset the file input
          $('input[type=file]').replaceWith('<input id="file_path" type="file" name="file">')
        }
      })
    }

    $('.image-processing').hide()
    $('.file-input-spinner').hide()
    $('#submit-button').hide()

    $('.file-upload-template').on('change', '#file_path', function(e) {
      e.stopPropagation();
      e.preventDefault();
      uploadFile();
    })

    obj.on('drop', function(e){
      e.stopPropagation();
      e.preventDefault();
      uploadFile();
    });

    $('.file-upload-template').on('click', '#submit-button', function(e) {
      e.preventDefault();

      $('#submit-button').replaceWith('<i class="fa fa-spinner fa-spin fa-2x"></i>')

      var data = {}
      data['name'] = $('input[name=name]').val()
      data['filename'] = $('input[name=filename]').val()
      data['rotation'] = $('input[name=rotation]:checked').val()

      console.log(data)

      $.ajax('/upload/process', {
        type: "POST",
        data: data,
        dataType: 'json',
        success: function(params) {
          router.transitionTo('worksheet.edit', params.id)
        },
        error: function(response) {
          $(".file-upload-template").prepend("<div data-alert class='alert-box alert'>An error has occurred; Please resend your image<a class='close'>&times;</a></div>");
          $(document).foundation();

          $('.file-upload-template>.fa-spin').replaceWith('<input type="submit" class="button small" id="submit-button" value="Submit">')
          $('.image-upload').show()
          $('.image-processing').hide()
          $('#submit-button').hide()

          // Try to reset the file input
          $('input[type=file]').replaceWith('<input id="file_path" type="file" name="file">')
        }
      })
    }); // upload finction

    obj.on('dragover', function(e){
      e.stopPropagation();
      e.preventDefault();
      $(this).css('border', "2px solid #3498db");
      console.log('drag')
    });

  } // action 
});
