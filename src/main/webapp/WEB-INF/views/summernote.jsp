<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>


</head>
<body>
<form method="post" onsubmit="postForm()">
제목: <input type="text" name="title">
<textarea name="contents" style="display: ;"></textarea>
  <div id="summernote"></div>
  <script>
    $(document).ready(function() {
    	$('#summernote').summernote({
            height: 300,
            codemirror: { // codemirror options
                theme: 'monokai'
              },
            minHeight: null,
            maxHeight: null,
            focus: true,
            callbacks: {
            	onInit: function() {
            	      console.log('Summernote is launched');
            	    },
              onImageUpload: function(files, editor, welEditable) {
                for (var i = files.length - 1; i >= 0; i--) {
                  sendFile(files[i], this);
                }
              }
            } 
          });
    });
    
    function postForm() {
        $('textarea[name="contents"]').val($('#summernote').summernote('code'));
    }


    function sendFile(file, el) {
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
          data: form_data,
          type: "POST",
          url: 'image',
          cache: false,
          contentType: false,
          enctype: 'multipart/form-data',
          processData: false,
          success: function(url) {  
            $(el).summernote('insertImage', "/uploadImage/"+url);
          //  $('#imageBoard').append('<img src="/uploadImage/'+url+'" />');
          }
        });
      }


  </script>
  <input type="submit" id="btn" value="submit">
<!-- <div id="imageBoard"></div> -->
</form>
</body>
</html>