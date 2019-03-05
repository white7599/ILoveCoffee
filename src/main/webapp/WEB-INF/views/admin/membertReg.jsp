<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css?ver=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>


<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <!-- Contact -->
  <div class="w3-container" id="contact" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>상품등록</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>Do you want us to style your home? Fill out the form and fill me in with the details :) We love meeting new people!</p>
    <form action="/action_page.php" target="_blank">
    	<div class="w3-section">
    	 <textarea name="content" id="editor" cols="300" rows="10">This is some sample content.</textarea>
    	</div>
      <div class="w3-section">      	
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="Name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="Email" required>
      </div>
      <div class="w3-section">
        <label>Message</label>
        <input class="w3-input w3-border" type="text" name="Message" required>
      </div>
      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">Send Message</button>
    </form>  
  </div>
<!-- End page content -->
</div>

     
	<script>
	       CKEDITOR.replace( 'editor1' );
	</script>

<!-- <script>
              ClassicEditor
                       .create( document.querySelector( '#editor' ) )
                       .then( editor => {
                               console.log( editor );
                       } )
                       .catch( error => {
                               console.error( error );
                       } ); 
       </script> -->
   

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>
