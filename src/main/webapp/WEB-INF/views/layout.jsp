<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/includee/preScript.jsp" />
</head>
<body data-context-path="<%=request.getContextPath()%>">
<%
	String contentPage= (String)request.getAttribute("contentPage");
%>
<jsp:include page="<%=contentPage %>"/>
<jsp:include page="/WEB-INF/includee/postScript.jsp" />
</body>
</html>