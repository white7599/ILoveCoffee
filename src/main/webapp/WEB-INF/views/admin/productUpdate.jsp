<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html lang="ko">
<title>I Love Coffee!!</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=2">
<link rel="stylesheet" href="/css/admin.css?ver=2"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
	<div class="w3-container" id="contact" style="margin-top: 50px">
		<h1 class="w3-xxlarge w3-text-red">
			<b>상품수정</b>
		</h1>
		<hr style="width: 50px; border: 5px solid red" class="w3-round">

		<form method="post" enctype="multipart/form-data">
			<table class="list-table">
				<tr>
					<th class="list-th w3-sand">상품 분류</th><c:set var="product_type" value="${product.type_idx}" />
					<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="type_idx">
							<c:forEach var="productTypeList" items="${productTypeList }" varStatus="status">
								<option value="${productTypeList.idx}"
									<c:if test="${productTypeList.idx eq product_type}">selected</c:if>>${productTypeList.type}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">진열여부</th>
					<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="view_check">
							<option value="Y" <c:if test="${product.view_check eq 'Y'}">selected</c:if>> 진열</option>
							<option value="N" <c:if test="${product.view_check eq 'N'}">selected</c:if>> 숨김</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">상품명</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="text" name="name"  value="${product.name}" required></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">영문상품명</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="text" name="eng_name" value="${product.eng_name}" required></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이미지</th>
					<td class="list-td-left list-td-bottom">&nbsp;
						<input type="file" name="uploadfile" placeholder="파일 선택"/><br><br>
						&nbsp;&nbsp;<img src="<spring:url value='/uploadImage/${product.image_file}'/>" height="80px"/>&nbsp;<span class="span-red">${product.image_file}</span>
						<input type="hidden" name="image_file" value="${product.image_file}" size="80" readonly>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">원산지</th>
					<td class="list-td-left">&nbsp;<input type="text" name="origin" class="w3-input-small w3-border" value="${product.origin}"/></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">가격</th>
					<td class="list-td-left">&nbsp;<input type="text" name="price" class="w3-input-small w3-border" value="${product.price}"/> 원</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">무게</th>
					<td class="list-td-left">&nbsp;<input type="text" name="weight" class="w3-input-small w3-border" value="${product.weight}"/> g</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">설명1</th>
					<td class="list-td-left">&nbsp;<textarea name="desc1" id="desc1" class="text-box">${product.desc1}</textarea></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">설명2</th>
					<td class="list-td-left">&nbsp;<textarea name="desc2" id="desc1" class="text-box">${product.desc2}</textarea></td>
				</tr>
			</table>
			
			<div class="w3-section text-align"><button type="submit" class="w3-btn w3-red w3-round">저장</button>&nbsp;
				<a href="/admin/productView${cri.makeQuery()}&idx=${product.idx}" class="w3-btn w3-green w3-round">이전페이지(View)</a></div>
		</form>
	</div>
	<!-- End page content -->
</div>


<script type="text/javascript" src="/js/admin.js"></script>

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
		
	});
</script>

</body>
</html>
