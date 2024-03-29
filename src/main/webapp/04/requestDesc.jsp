<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/requestDesc.jsp</title>
</head>
<body>
<h4>Http Request(요청) => HttpServletRequest</h4>
<a href="?param1=asd&param2=23">A태그를 통한 GET 요청</a>
<form method="post">
	<input type="text" name="param1"/>
	<input type="text" name="param2"/>
	<button type="submit">POST 전송</button>
</form>
<pre>
	web : 역할이 다른 client / server 가 content로 표현되는 메시지를 교환하는 공간.
	client -> server : request packging (편지지 + 편지봉투)
	1. Request Line (수신자) : URL(URI)-명사(자원에 대한 식별자), request Method-동사(행위정보,CRUD...)
		<%=request.getRequestURI() %>, <%=request.getMethod() %>
		1) GET(default method, Read) : from 을 형성하지 않은 일반 요청의 메소드
		2) POST(Create) : 클라이언트가 서버로 새로운 자원을 등록하기 위해 전송.
		3) PUT(Update) : 서버의 자원의 모든 속성을 수정하기 위한 요청.
		4) PATCH(Update) : 서버의 차원의 선택적 속성을 수정하기 위한 요청
		5) DELETE : 서버의 자원 삭제 
		6) OPTION : pre-fligth 요청에 사용되는 메서드
		7) HEAD : 차후 응답 전송시 body가 없는 line+header 의 응답이 전송됨.
		8) TRACE : 서버를 디버깅할 목적의 요청 메소드
	2. Request Header : 클라이언트와 현재 오쳥에 대한 부가정보(meta data);
		String value=getHeader(String name)
		Enumeration&lt;String&gt; getHeaderNames
		
		Accept-* ex) Accept(response content type), Accept-Encoding(response archive format), 
						Accept-Language(response language + country format - Locale)
		Content-* : post메소드로 body의 content 에 대한 메타데이터.
				ex) Content-Type(request content type : MIME), Content-Length(request content length)
		User-Agent : 사용자 OS, 랜더링 엔진, 브라우저의 종류
		<%=request.getHeader("Accept") %>
	3. Request Body ㅣ content type, Message Body, only POST 요청에서만 형성
		content length :<%=request.getContentLength() %>
		content type :<%=request.getContentType() %>
		<%=request.getQueryString() %>
	
	client 가 서버에게 보내는 의도적인 컨텐츠
	1. request parameter
		1) post request : body 를 통해 전송. = req.getParameter()
		2) get request : line 을 통해 url의 query string 형태로 전송. req.getQueryString()
	2. multipart request : body 를 통해 전송, body를 여러개 part로 분리하여 전송. -req.getPart(),req.getParts()
	3. request payload : body 를 통해 전송, JSON / XML. - req.getInputStream()
</pre>
<table border=1>
	<thead>
		<th>헤더이름</th>
		<th>헤더값</th>
	</thead>
	<tbody>
		<%
		
			Enumeration<String> headerNames = request.getHeaderNames();
			while(headerNames.hasMoreElements()){
			String name=headerNames.nextElement();
			String value=request.getHeader(name);
			out.print(String.format("<tr><th>%s</th><td>%s</td></tr>",name,value));
			}
		%>
	</tbody>
</table>
</body>
</html>