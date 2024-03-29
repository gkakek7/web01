<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="container-fluid"></main>
<h4>웰컴 페이지</h4>
<%
	Object authId=session.getAttribute("authId");
	if(authId==null){
		%>
		<a href="<%=request.getContextPath() %>/login/loginForm.jsp">로그인</a>
		<%
	}else{
		%>
		<%=authId %>
		<form method="post" id="logoutForm" action="<%=request.getContextPath() %>/login/logOut.do"></form>
		<a href="javascript:;" data-log-out="#logoutForm">로그아웃</a>
		<%
	}
%>
</main>
<script src="<%=request.getContextPath() %>/resorces/js/app/index.js">\</script>
