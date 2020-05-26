<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ09GetVSPost.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	$('#Button01').click(function() {
		$.ajax({
			url : "./common/ParamProc.jsp",
			type : "get",
			contentType : "text/html; charset:utf-8;",
			data : {
				method : 'GET',
				price : $('#price').val(),
				name : $('#name').val()
			},
			dataType : "html",
			success : function(d) {
				alert("성공Callback:" + d);
				$('#contents').html(d).css("fontSize", "3em").css("color", "red");
			},
			error : function(e) {
				alert("실패Callback:" + e.status + ":" + e.statustext);
			}
		});
	});
	
	$('#Button02').click(function() {
		$.ajax({
			url : "./common/ParamProc.jsp",
			type : "post",
			contentType : "application/x-www-form-urlencoded; charset:utf-8;",
			data : {
				method : 'POST',
				price : $('#price').val(),
				name : $('#name').val()
			},
			dataType : "html",
			success : function(d) {
				alert("성공Callback:" + d);
				$('#contents').html(d).css("fontSize", "3em").css("color", "blue");
			},
			error : function(e) {
				alert("실패Callback:" + e.status + ":" + e.statustext);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="container">
		
		<h2>$.ajax() 전송방식에 따른 contentType 테스트</h2>
		
		<div class="form-group">
			<label for="email">가격 :</label>
			<input type="text" class="form-control" id="price" value="100000" />
		</div>
		<br />
		<div class="form-group">
			<label for="email">상품명 :</label>
			<input type="text" class="form-control" id="name" value="노트북" />
		</div>
		<br />
		<div class="d-flex justify-content-center">
			<button type="button" id="Button01" class="btn btn-primary text-center">Get으로전송</button>
			&nbsp;&nbsp;
			<button type="button" id="Button02" class="btn btn-dark text-center">Post로전송</button>	
		</div>
		<div class="row">
			<div id="contents">콜백받은 내용은 여기에 출력</div>
		</div>
	</div>
</body>
</html>