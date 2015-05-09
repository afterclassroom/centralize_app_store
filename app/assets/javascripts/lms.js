    $(document).on('click', '#close-preview', function(){
      $('.image-preview').popover('hide');
      // Hover befor close the preview
      $('.image-preview').hover(
        function () {
         $('.image-preview').popover('show');
       },
       function () {
         $('.image-preview').popover('hide');
       }
       );
    });

    $(function() {
    // Create the close button
    var closebtn = $('<button/>', {
      type:"button",
      text: 'x',
      id: 'close-preview',
      style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
      trigger:'manual',
      html:true,
      title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
      content: "There's no image",
      placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
      $('.image-preview').attr("data-content","").popover('hide');
      $('.image-preview-filename').val("");
      $('.image-preview-clear').hide();
      $('.image-preview-input input:file').val("");
      $(".image-preview-input-title").text("Browse");
    });
    // Create the preview image
    $(".image-preview-input input:file").change(function (){
      var img = $('<img/>', {
        id: 'dynamic',
        width:250,
        height:200
      });
      var file = this.files[0];
      var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
          $(".image-preview-input-title").text("Change");
          $(".image-preview-clear").show();
          $(".image-preview-filename").val(file.name);
          img.attr('src', e.target.result);
          $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }
        reader.readAsDataURL(file);
      });
  });

// $(document).ready(function() {
//   $('#applyForm')
//   .formValidation({
//     framework: 'bootstrap',
//     icon: {
//       valid: 'glyphicon glyphicon-ok',
//       invalid: 'glyphicon glyphicon-remove',
//       validating: 'glyphicon glyphicon-refresh'
//     },
//     fields: {
//       fullName: {
//         validators: {
//           notEmpty: {
//             message: 'The full name is required'
//           }
//         }
//       },
//       address: {
//         validators: {
//           notEmpty: {
//             message: 'The school address is required'
//           }
//         }
//       },
//       principleName: {
//         validators: {
//           notEmpty: {
//             message: 'The principle name is required'
//           }
//         }
//       },
//       mobilePhone: {
//         validators: {
//           notEmpty: {
//             message: 'The mobile phone number is required'
//           },
//           digits: {
//             message: 'The mobile phone number is not valid'
//           }
//         }
//       },
//       email: {
//         validators: {
//           notEmpty: {
//             message: 'The email address is required'
//           },
//           emailAddress: {
//             message: 'The email address is not valid'
//           }
//         }
//       },
//       domain: {
//         validators: {
//           notEmpty: {
//             message: 'The domain address is required'
//           },
//           emailAddress: {
//             message: 'The domain address is not valid'
//           }
//         }
//       },
//       fileType: {
//         validators: {
//           notEmpty: {
//             message: 'Please choose a file type'
//           }
//         }
//       },
//       fileName: {
//         validators: {
//           notEmpty: {
//             message: 'Please choose a file to upload'
//           },
//           file: {
//             extension: 'jpeg,jpg,png',
//             type: 'image/jpeg,image/jpg,image/png',
//             maxSize: 2 * 1024 * 1024,
//             message: 'The file must be in image format and must not exceed 2MB in size'
//           }
//         }
//       }
//     }
//   })

// });