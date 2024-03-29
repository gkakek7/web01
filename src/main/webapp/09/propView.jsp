<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.property-name:hover {
		cursor:pointer;
		background-color :silver;
		margin-right: 10px;
	}
	.property-value {
		margin-left: 10px;
		background-color: lime;
	}
</style>
</head>
<body data-context-path="<%=request.getContextPath()%>">
<form method="post" id="postForm" action="<%=request.getContextPath()%>/09/property">
	<input type="text" name="propertyName" placeholder="propertyName">
	<input type="text" name="propertyValue" placeholder="propertyValue">
	<button type="submit">신규 등록</button>
</form>
<script type="text/javascript" src="<%=request.getContextPath() %>/resorces/js/app/09/propView.js?<%=System.currentTimeMillis()%>"></script>
</body>
</html>