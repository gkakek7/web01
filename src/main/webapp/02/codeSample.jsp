<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.stream.Stream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String[] array = { "element1", "element2", "element3" };
	%>
	<ul>
		<%
		for (String tmp : array) {
		%>
		<li><%=tmp%></li>
		<%
		}
		%>
	</ul>
	<ul>
		<%
		StringBuffer liTags = new StringBuffer();
		for (String tmp : array) {
			liTags.append(String.format("<li>%s</li>", tmp));
		}
		out.print(liTags);
		%>
		<%--=liTags--%>
	</ul>
	<ul>
		<%=Stream.of(array).map(tmp->String.format("<li>%s</li>", tmp)).collect(Collectors.joining())%>
	</ul>
</body>
</html>