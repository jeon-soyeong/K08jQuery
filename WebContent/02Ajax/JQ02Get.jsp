<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ02Get.jsp</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>

/*
 $.get()
 	: HTTP Get방식을 통해 서버로부터 데이터를 받을 때
 	사용하는 메소드
 	
 	사용법
 		$.get(url, param, success(data));
 		- url : 정보를 요청할 경로
 		- param : 서버로 전송할 파라미터로 json형태로 기술
 		- success(data) : 요청이 성공했을 때 실행되는 콜백(callback)메소드.
 		콜백메소드가 호출될 때 전달되는 파라미터를 통해 성공 
 		혹은 실패여부를 판단할 수 있다.
 		※ 서버로 요청시 전송할 값(파라미터)이 없는 경우에는 생략가능함.
 		콜백메소드(성공시 파라미터 전달됨 == 여기서 data)
 */
$(function(){
	$('#btnXml').click(function() {
		$.get(
			'./common/02NameCard.xml',
			function(data) {
				console.log(data);
				$(data).find("명함").each(function() {
					var html = "<div>이름:" + 
							$(this).find("성명").attr("이름")
						+"</div>";
					html += "<div>주소:" + 
							$(this).find("주소").text()
						+"</div>";
					html += "<div>직위:" + 
							$(this).find("직위").text()
						+"</div>";
					html += "<div>이메일:" + 
							$(this).find("e-mail").text()
						+"</div>";
					html += "<div>핸드폰:" + 
							$(this).find("Mobile").text()
						+"</div>";
					html += "<div>전화번호:" + 
							$(this).find("TEL").text()
						+"</div>";
					html += "<div>카피라이트:" + 
							$(this).find("copyright").text()
						+"</div>";
						
						$('#xmlDisplay').html(html);	
				});
			}
		);
	});
});
function locationGo(link) {
	window.open(link,'','width=500,height=500');
}
</script>
</head>
<body>
	<div>	
	<h2>$.get() 메소드 사용하기</h2>
	
	<h3>xml파일 읽어오기</h3>
	<button onclick="locationGo('./common/02NameCard.xml');">
		NameCard.xml바로가기
	</button>
	
	<button id="btnXml">
		XML데이터 읽어오기
	</button>
	
	<div class="displayDiv" id="xmlDisplay">
		XML데이터 정보를 디스플레이합니다.
	</div>
	
	
	<h3>jsp파일에서 읽어오기</h3>
	<button onclick="locationGo('common/02PrintToday.jsp?msg=안녕하세요&varStr=jQuery조아효');">
		PrintToday.jsp바로가기
	</button>
	<button id="btnJSP">
		JSP결과 읽어오기
	</button>
	<div class="disDisplay" id="jspDisplay">
		JSP결과를 디스플레이 합니다.
	</div>	
</div>
	
</body>
</html>