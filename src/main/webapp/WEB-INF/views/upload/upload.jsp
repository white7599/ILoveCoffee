<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	<h1>파일 업로드</h1>
	<form action="upload" method="post" enctype="multipart/form-data">
	    <input type="file" name="uploadfile" placeholder="파일 선택" /><br/>
	    <input type="submit" value="업로드">
	</form>
</body>


<script>
var result = '${result}';
$(function(){
	
	if(result == 'fail'){
		 alert('파일 저장 실패');
	} else if(result == ''){
		
	}
	else{
		alert(result + ' 파일 저장 성공');
	}
	
})
</script>

</html>