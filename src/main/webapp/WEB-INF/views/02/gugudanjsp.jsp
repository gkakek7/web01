<%@page import="java.text.MessageFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Stream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	StringBuffer gugudan(int first,int last){
		StringBuffer gugu = new StringBuffer();
		gugu.append("<table>");
		for(int i=first;i<=last;i++){
			gugu.append("<tr>");
			for(int j=1;j<=9;j++){
				gugu.append(MessageFormat.format("<td>{0} * {1} = {2}</td>",i,j,i*j));
			}
			gugu.append("</tr>");
		}
		gugu.append("</table>");
		return gugu;
	}
%>
<%
	int minDan=(Integer)request.getAttribute("minDan");
	int maxDan=(Integer)request.getAttribute("maxDan");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table{
		border-collapse: collapse;
	}
	td{
		border: 1px solid black;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<!-- 2단부터 9단까지의 구구단을 table태그로 출력하시오. -->
<!-- 단, 하나의 tr에서 하나의 단을 출력하는 8*9 table. -->
<form name="gugudanForm">
	<input type="number" name="minDan" min="2" max="13" placeholder="최소단">
	<select name="maxDan">
		<%
		for(int number=2;number<=13;number++){
			out.println(MessageFormat.format("<option value=''{0}''>{0}단</option>",number));
		}
		%>
	</select>
	<button type="submit">구구단줫!</button>
</form>
<table>
<%=gugudan(minDan,maxDan) %>
</table>
<table>
<%
	StringBuffer gugu=new StringBuffer();
	gugu.append("<table>");
	for(int i=minDan;i<=maxDan;i++){
		gugu.append("<tr>");
		for(int j=1;j<=9;j++){
			gugu.append(String.format("<td>%d * %d = %d</td>",i,j,i*j));
		}
		gugu.append("</tr>");
	}
	gugu.append("</table>");
	out.print(gugu);
%>
</table>
<table>
<%
	StringBuffer gugu1=new StringBuffer();
	int[] dan={2,3,4,5,6,7,8,9};
	int[] ddan={1,2,3,4,5,6,7,8,9};
	Arrays.stream(dan).forEach((i)->{
		gugu1.append("<tr>");
		Arrays.stream(ddan).forEach((j)->{
			gugu1.append(String.format("<td>%d * %d = %d</td>",i,j,i*j));
		});
		gugu1.append("</tr>");
	});
	out.print(gugu);
%>
</table>
<script>
	document.gugudanForm.minDan.value = <%=minDan%>;
	document.gugudanForm.maxDan.value = <%=maxDan%>;
</script>
</body>
</html>