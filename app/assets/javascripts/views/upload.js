App.WorksheetsNewView = Ember.View.extend({
  first_name: "steve",
  templateName: "teacherapp/upload",

  didInsertElement: function() {
    var self = this
    var router = this.get('controller.target.router');

    $('.image-processing').hide()
    $('.file-input-spinner').hide()

    $('.file-upload-template').on('change', '#file_path', function(e) {
      var files, formData, i
      e.preventDefault();

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
        },
        error: function(response) {
          alert("The file could not be uploaded")
          console.log(response)
          $('.file-input-container').show()
          $('.file-input-spinner').hide()

          // Try to reset the file input
          $('input[type=file]').replaceWith('<input id="file_path" type="file" name="file">')
        }
      })
    })

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
          alert("An error has occurred; Please resend your image")
          $('.image-processing .fa-spin').replaceWith('<input type="submit" class="button small" id="submit-button" value="Submit">')
          $('.image-upload').show()
          $('.image-processing').hide()

          // Try to reset the file input
          $('input[type=file]').replaceWith('<input id="file_path" type="file" name="file">')
        }
      })
    }); // upload finction

        
    var obj = $('.drop_image');

    obj.on('dragover', function(e){
      e.stopPropagation();
      e.preventDefault();
      $(this).css('border', "2px solid #3498db");
      console.log('drag')

    });


    obj.on('drop', function(e){
      e.stopPropagation();
      e.preventDefault();
      $('.drop_image').replaceWith('<i class="fa fa-spinner fa-spin fa-2x"></i>');
       

      var files = e.originalEvent.dataTransfer.files;
      var file = files[0];
      var formData = new FormData();

      formData.append('file', file, file.name)
    
      $.ajax('/upload/upload', {
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(params) {
          $('.thumbnail img').attr('src', "/" + params['filename'])
          $('input[name=filename]').val(params['filename'])
          $('.image-upload').hide()
          $('.image-processing').show()
        },
        error: function(response) {
          alert("The file could not be uploaded")
          console.log(response)
          $('.fa-spin').replaceWith('<div class="drop_image"><center> Drop Files Here </center></div>')
        }
      })



    }); // drop 

   } // action 
});
