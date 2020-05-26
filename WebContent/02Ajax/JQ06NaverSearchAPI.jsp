<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ06NaverSearchAPI.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	$('#searchBtn').click(function() {
		$.ajax({
			url : "../NaverSearchAPI.do",
			type : "get",
			data : {
				keyword : $('#keyword').val(),
				startNum : $('#startNum option:selected').val()
			},
			dataType : "json",
			success : sucFuncJson,
			error : errFunc
		});
	});
	
	$('#startNum').change(function() {
		$.ajax({
			url : "../NaverSearchAPI.do",
			type : "get",
			data : {
				keyword : $('#keyword').val(),
				startNum : $('#startNum option:selected').val()
			},
			dataType : "json",
			success : sucFuncJson,
			error : errFunc
		});
	});
});

function sucFuncJson(d) {
	//alert("성공"+d);
	var str = "";
	
	$.each(d.items, function(index, item) {
		str += "<ul>";
		str +="	<li>"+(index+1)+"</li>";
		str +="	<li>"+item.title+"</li>";
		str +="	<li>"+item.description+"</li>";
		str +="	<li>"+item.bloggername+"</li>";
		str +="	<li>"+item.bloggerlink+"</li>";
		str +="	<li>"+item.postdate+"</li>";
		str +="	<li><a href='"+item.link+"' ";
		str +="		target='_blank'>바로가기</a></li>";
		str += "</ul>";
	});
	
	$('#searchResult').html(str);
}
function errFunc(e) {
	alert("실패"+e.status)
;}
</script>
<style>
	ul{
		border:2px #cccccc solid;
	}
</style>
</head>
<body>
	
<div class="container">
	<div class="row">
		<a href="../NaverSearchAPI.do?keyword=가산디지털단지역 맛집">
			네이버검색정보JSON바로가기
		</a>
	</div>
	
	<div class="row">
		<form id="searchFrm">			
			한페이지에 20개씩 노출됨 <br />
			
			<select id="startNum">
				<option value="1">1페이지</option>
				<option value="21">2페이지</option>
				<option value="41">3페이지</option>
				<option value="61">4페이지</option>
				<option value="81">5페이지</option>
			</select>
			
			<input type="text" id="keyword" value="검색어" />
			<button type="button" class="btn btn-info"
				id="searchBtn">
				Naver검색API요청하기
			</button>		
		</form>	
	</div>
	
	<div class="row" id="searchResult">
		요기에 정보가 노출됩니다
	</div>	
	
</div>
	
</body>
</html>