<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/standard.jsp</title>
</head>
<body>
	<h4>JSP(Java Server Page)</h4>
	<h4>모델 ㅣ <%=request.getAttribute("sampleAttr") %></h4>
	<pre>
		: 서블릿의 하위 스펙으로 동작하는 템플릿 엔진(View layer).
		
		소스 구성 요소(토큰의 종류)
		1. 정적 요소(Front-End) : HTML, CSS, JavaScript.. 정적 텍스트
		2. 동적 요소(Back-End)
			1) scriptlet(스크립트릿) : <% // java code %> 
				<%
					String sample = "TEST";	//지역변수 이면서 블럭변수
				%>
			2) directive(지시자) : <%--@ --%>
				page(required) : jsp 페이지에 대한 구체적인 설정을 표현(속성으로 표현).
				taglib(optional) : 커스텀 태그 로딩
				include(optional) : 정적 include를 통해 2개 이상의 jsp 소스를 하나로 합칠때.
			3) expression(표현식) : <%=sample %>,<%=LocalDate.now() %>
			4) declaration(선언부) :  : 전역 변수나 메소드 선언에 사용.
			<%! 
			private StringBuffer globalBuffer;
			void test(){
				
			}
			%>
			5) comment(주석) : <%-- JSP 주석 --%>,<!--  HTML 주석 -->
				<script type="text/javascript">
					// javascript 주석
				</script>
				<style type="text/css">
/* 					css 주석  */
				</style>
				- client side(Front-End) : HTML, JS, CSS
				- server side(Back-End) : JAVA, JSP
			6) EL(Expression Language,표현언어)
			7) JSTL 
			8) 기본객체(내장객체)
			
			ex) Tomcat
			1. WAS(Web Application Server) : 로직의 실행으로 생성되는 동적 콘텐츠를 서비스하는 어플리케이션 서버.
			   WS(Web Server) : 이미지 파일, 동영상 파일, css, js, html... 등의 정적 자원 서버.
			2. Middle Tier (N-tier 구조에서 사용) : client 와 raw 데이터 서버 사이의 어플리케이션이 운영되는 중간 티어.
			3. Servlet container : 서블릿의 생명주기(Life Sicle) 관리자, 서블릿의 싱글턴 인스턴스를 생성하고, 해당 요청이 발생한 경우,
									그 요청을 처리할 수 있는 callback 메소드를 실행함.
			4. JSP container : 서블릿의 생명주기 관리자, *.jsp 템플릿 파일을 파싱하고, 서블릿 소스를 생성한 후, 해당 서블릿을 컴파일하고,
								해당 서블릿의 싱글턴 인스턴스를 생성하고, 요청 발생시 콜백 메소드를 실행함.
	</pre>
</body>
</html>