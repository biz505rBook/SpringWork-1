<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/include-css.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-product-header.jspf"%>
	<style>
		th{
			background-color: #ccc;
			text-align: right;
		}
		td{
			background-color: #ddd;
			
		}
		div.btn-box{
			display: flex;
			width:90%;
			margin: 10px auto;
			/*background-color : #fff;*/

			
			justify-content: center;
			align-content: center;
			padding: 10px
		}
		
		button{
			border-radius: 3px;
			outline: none;
			padding: 10px 20px;
			margin-right: 10px;
			
		}
		
		button:hover{
			background-color: #ddd;
			color: black;
			cursor: pointer;
		}
		
		.btn-update{
			background-color: blue;
			color: white;
			
		}
		.btn-delete{
			background-color: orange;
			color: white;
			margin-right: 10px;
		}
	
	</style>
	
	<script>
		
		$(function(){
			$(".btn-update").click(function(){
				document.location.href = "${rootPath}/product/update?id=${PRODUCT_DTO.p_code}"
			})
			
			
			$(".btn-delete").click(function(){
				
				let msg = "상품코드 : ${PRODUCT_DTO.p_code} \n"
				msg += "상품명 : ${PRODUCT_DTO.p_name} \n"
				msg += "삭제할까요?"
				if(confirm(msg)){
					document.location.href = "${rootPath}/product/delete?id=${PRODUCT_DTO.p_code}"
				}
			})
		})
	</script>
	
	<section>
		<table>
			<tr>
				<th>상품코드</th><td>${PRODUCT_DTO.p_code}</td>
				<th>상품명</th><td>${PRODUCT_DTO.p_name}</td>
			</tr>
			
			<tr>
				<th>매입단가</th><td>${PRODUCT_DTO.p_iprice}</td>
				<th>매출단가</th><td>${PRODUCT_DTO.p_oprice}</td>
			</tr>
			
			<tr>
				<th>부가세</th><td colspan="3">${PRODUCT_DTO.p_vat}</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<div class="btn-box">
						<button class="btn-update">수정</button>
						<button class="btn-delete">삭제</button>
					</div>
				</td>
			</tr>
		</table>
	</section>

</body>
</html>