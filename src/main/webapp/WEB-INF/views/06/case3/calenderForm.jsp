<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.stream.Stream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath() %>/resorces/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resorces/js/app/06/case3/calenderForm2.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resorces/css/calender.css">
</head>
<body>
<%
	Locale locale = (Locale)request.getAttribute("locale");
	YearMonth thisMonth=(YearMonth)request.getAttribute("thisMonth");
%>
<form id="calForm" method="post" enctype="application/x-www-form-urlencoded">
	<input type="number" name="year" placeholder="년도" data-init-value="<%=thisMonth.getYear() %>">
	<select name="month" data-init-value="<%=thisMonth.getMonthValue()%>">
		<option value>월</option>	
		<%=
				request.getAttribute("monthOption")
		%>
	</select>
	<select name="locale" data-init-value="<%=locale.toLanguageTag()%>">
		<option value>로케일</option>
		<%=
				request.getAttribute("localeOption")
		%>
	</select>
</form>
<div id="calArea">
</div>
<!-- 달력이 처리되는 과정 -->
<!-- :calForm이 전송 (submit 이벤트)되면서 파라미터가 서버로 전달됨. -->
<!-- form의 submit 이벤트는 default 이벤트 중단 -->
</body>
</html>