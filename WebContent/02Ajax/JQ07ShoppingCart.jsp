<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ07ShoppingCart.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	$('#goodsOptionId1').change(function() {
		//alert("옵션선택함");
		
		$.ajax({
			url : "./common/07GoodsSelect1.jsp",
			type : "get",
			data : {
				//select에서 선택된 값을 JSON으로 조립해서 파라미터 구성
				goodsOptionName : $('#goodsOptionId1').val()
			},
			dataType : "html", //콜백데이터의 타입
			contentType : "text/html;charset:utf-8",
			success : function(d) {
				//console.log("성공" +_d);
				
				//1. hidden으로 생성된 totalPrice의 값을 가져온다.
				var totalPrice = parseInt($('#totalPrice').val());
				
				//2. 옵션의 value를 가져온다.
				var goodsOption = $('#goodsOptionId1').val();
				
				//3. 선택한 옵션을 판단하여 금액추가
				if(goodsOption == 'op01') totalPrice += 5000;
				else if(goodsOption == 'op02') totalPrice += 7000;
				else if(goodsOption == 'op03') totalPrice += 10000;
				
				//4. 계산된 금액을 폼에 입력해준다.
				$('#totalPrice').val(totalPrice);
				$('#priceDisplay').html("총상품금액" + totalPrice);
				
				//5. 옵션을 처음 선택한다면 기존문자열은 지워주고 옵션을 추가한다.
				if($('#goodsList').html() == "여기에 선택한 옵션이 리스팅됨"){
					$('#goodsList').empty();
				}
				
				//요청이 성공한 경우 옵션항목이 추가된다.
					$('#goodsList').append(d);
			},
			error : function(e) {
				alert("실패" + e.status);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="container">
	<div class="row">
		<h2>장바구니 구현하기</h2>
	</div>
	<div class="row">
		<div class="col-md-6">
			<!-- 상품이미지 -->
			<img src="../images/amazon.png" 
				class="img-thumbnail" />
		</div>
		<div class="col-md-6">
			<!-- 상품가격과 옵션 -->
			<form id="goodsFrm">
			
			<!-- 상품가격+옵션가격 -->
			<input type="hid-den" id="totalPrice" 
				value="70000" 
				style="background-color:#bbbbbb;
					color:red;"/>				
			
			<table class="table table-bordered">
			<colgroup>
				<col width="30%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<td>상품명</td>
				<td>3 in 1 Type-C HDMI 케이블</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><del>100,000원</del> -> 70,000원</td>
			</tr>
			<tr>
				<td>옵션선택</td>
				<td>
					<select id="goodsOptionId1">
						<option value="">선택하삼</option>
						<option value="op01">옵션1(+5000)</option>
						<option value="op02">옵션2(+7000)</option>
						<option value="op03">옵션3(+10,000)</option>
					</select>
				</td>
			</tr>			
			</table>
			</form>			
			<div class="row" id="goodsList">여기에 선택한 옵션이 리스팅됨</div>			
			<div class="row" id="priceDisplay" 
				style="font-size:1.5em; color:red;">
				총상품금액 : 70,000원
			</div>
		</div>
	</div>	
</div>
</body>
</html>