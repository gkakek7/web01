<%@page import="kr.or.ddit.servlet05.BrowserType"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String agent=request.getHeader("User-Agent");
    agent=agent.toUpperCase();
    String messagePattern="<h4>당신의 브라우저는 %s입니다.</h4>";
//     String browserName=null;
//     if(agent.contains("EDG")){
//     	browserName="엣지";
//     }else if(agent.contains("WHALE")){
//     	browserName="웨일";
//     }else if(agent.contains("CHROM")){
//     	browserName="크롬";
//     }else if(agent.contains("SAFARI")){
//     	browserName="사파리";
//     } else{
//     	browserName="기타등등";
//     }
//     Map<String,String> browserType=new LinkedHashMap<>();
//     browserType.put("EDG","웨일");
//     browserType.put("WHALE","엣지");
//     browserType.put("CHROM","크롬");
//     browserType.put("SAFARI","사파리");
//     browserType.put("OTHER","기타등등");
    
//     browserName=browserType.get("OTHER");
//     for(Entry<String,String> entry: browserType.entrySet()){
//     	if(agent.contains(entry.getKey())){
//     		browserName=entry.getValue();
//     		break;
//     	}
//     }

// 	browserName=BrowserType.OTHER.name();
// 	for(BrowserType tmp:BrowserType.values()){
// 		if(agent.contains(tmp.name())){
// 			browserName=tmp.getBrowserName();
// 			break;
// 		}
// 	}
String browserName=BrowserType.findBrowserName(request.getHeader("USER-AGENT"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=String.format(messagePattern,browserName) %>
<h4><%=BrowserType.findBrowserType(agent) %></h4>
</body>
</html>