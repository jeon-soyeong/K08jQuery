<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	페이지 상단에 불필요한 공백을 제거하기 위해 사용하는
	디렉티브로 안드로이드에서 서버와 통신할 때 가끔 공백때문에
	오류가 발생하는 경우가 있으므로 반드시 제거시켜주는 것이
	좋다.
--%>
<%@ page trimDirectiveWhitespaces = "true" %>
<%
request.setCharacterEncoding("UTF-8");

String msg = request.getParameter("msg");
String varStr = request.getParameter("varStr");
String today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

out.println("<h2>메시지:" + msg + "</h2>");
out.println("<h2>varStr:" + varStr + "</h2>");
out.println("<h2>오늘날짜:" + today + "</h2>");
%>
