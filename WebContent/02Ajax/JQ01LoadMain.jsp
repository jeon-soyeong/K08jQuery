<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ01LoadMain.jsp</title>
 <script src="../common/jquery/jquery-3.5.1.js"></script>
 <script>
//JS함수 내부에서 jQuery코드를 사용하는 것이 가능하다.
 var loadCode = function() {
	//load() 사용시 파라미터가 필요없는 경우 생략가능하다.
	$('#loadView').load('./common/01LoadSub.jsp');
	alert("문서가 로드되었습니다.");
}
 
$(function(){
	
	//외부의 txt파일을 현재문서로 로드한다.
	$('#loadTxtBtn').click(function() {
		$('#loadTxt').load('./common/01LoadTxt.txt');
		alert('txt문서가 로드되었습니다.');
	});
	
	$('#loadParamBtn').click(function() {
		//체크한 radio버튼의 값을 가져온다.
		var radioVar = $('input[type="radio"][name="params"]:checked').val();
		//위의 값을 이용해서 파라미터를 만든다. 이때 파라미터는 JSON으로 기술한다.
		var params = {"params":radioVar};
		//파라미터를 전달하면서 jsp문서를 로드한다.
		$('#loadParam').load('./common/01LoadParam.jsp', params);
		
		//전달된 파라미터에 따라 다른 결과가 로드된다.
	});
	
	
	
});
</script>
<style>
	div{
		width:300px; height: 100px;
		border:1px solid black; margin-top:50px;
	}
</style>
</head>
<body>
	<div>
	<h2>$.load() 메소드 사용하기</h2>
	
	<h3>jsp파일 로드하기</h3>	
	<div id="loadView">
		여긴 loadView 입니다.
	</div>
	<button onclick="loadCode();">
		Load()테스트1
	</button>
	
	<h3>txt파일 로드하기</h3>	
	<div id="loadTxt">
		여긴 loadTxt 입니다. 텍스트파일의 내용을
		비동기방식으로 로드합니다.
	</div>
	<button id="loadTxtBtn">
		Load()테스트2
	</button>
	
	<h3>파라미터로 구분해서 로드하기</h3>
	<div id="loadParam">
		파라미터 영역입니다.
	</div>
	<label>
		<input type="radio" name="params" value="good"
			checked />좋은파라미터
	</label>
	<label>
		<input type="radio" name="params" value="bad"
			/>나쁜파라미터
	</label>
	<button id="loadParamBtn">
		Load()테스트3
	</button>
	
	<br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br />
</div>	

	
	
</body>
</html>