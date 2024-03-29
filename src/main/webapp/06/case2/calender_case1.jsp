<%@page import="java.util.Arrays"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Optional"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Locale locale=Optional.ofNullable(request.getParameter("locale"))
				.filter(lp->!lp.trim().isEmpty())
				.map(lp->Locale.forLanguageTag(lp))
				.orElse(Locale.getDefault());
	
	ZoneId zone = Optional.ofNullable(request.getParameter("timezone"))
			.filter(lp->!lp.trim().isEmpty())
			.map(zp->ZoneId.of(zp))
			.orElse(ZoneId.systemDefault());
	
	ZonedDateTime current = ZonedDateTime.now(zone);    
	FormatStyle fullStyle=FormatStyle.FULL;
	
	int targetYear=Optional.ofNullable(request.getParameter("year"))
			.map(yp->new Integer(yp))
			.orElse(YearMonth.from(current).getYear());
	
	YearMonth thisMonth=Optional.ofNullable(request.getParameter("month"))
			.map(mp->YearMonth.of(targetYear,Integer.parseInt(mp)))
			.orElse(YearMonth.from(current));
	
	YearMonth beforeMonth=thisMonth.minusMonths(1);
	YearMonth nextMonth=thisMonth.plusMonths(1);
	
	WeekFields weekFields = WeekFields.of(locale);
	DayOfWeek firstDow=weekFields.getFirstDayOfWeek();
	
	LocalDate firstDate = thisMonth.atDay(1);
	int firstDayDOW=firstDate.get(weekFields.dayOfWeek());
	int offset=firstDayDOW-1;
	Set<String> zid = ZoneId.getAvailableZoneIds();
	Iterator<String> it = zid.iterator();
	String txt="";
	while(it.hasNext()) {
		String key =it.next();
		txt+=String.format("<option value='%s'>%s</option>\n",key,key);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td{
		border: 1px solid black;
	}
	table{
		border-collapse: collapse;
	}
	.sunday{
		color: red;
	}
	.saturday{
		color: blue;
	}
	.before,.after{
		color: silver;
	}
</style>
</head>
<body>
<h4><%=current.format(DateTimeFormatter.ofLocalizedDateTime(fullStyle, fullStyle).withLocale(locale)) %></h4>
<h4>
<a class="control-a" href="javascript:;" data-year="<%=beforeMonth.getYear() %>" data-month="<%=beforeMonth.getMonthValue()%>">전달</a>
	<%=thisMonth.format(DateTimeFormatter.ofPattern("yyyy, MMMM",locale)) %>
<a class="control-a" href="javascript:;"  data-year="<%=nextMonth.getYear() %>" data-month="<%=nextMonth.getMonthValue()%>">다음달</a>
</h4>
<form id="calForm" method="post">
	<input type="number" name="year" placeholder="년도">
	<select name="month">
		<option value>월</option>	
		<%=
			Stream.of(Month.values())
				.map(m->String.format("<option value='%d'>%s</option>",m.getValue(),m.getDisplayName(TextStyle.FULL, locale)))
				.collect(Collectors.joining("\n"))
		%>
	</select>
	<select name="locale">
		<option value>로케일</option>
		<%=
			Arrays.stream(Locale.getAvailableLocales())
				.map(l->String.format("<option value='%s'>%s</option>",l.toLanguageTag(),l.getDisplayName(l)))
				.collect(Collectors.joining("\n"))
		%>
	</select>
	
	<select name="timezone">
		<option value>타임존</option>
		<%=txt
		%>
	</select>
	
</form>
<table class>
<%
out.print("<thead>");
for(int col=0;col<7;col++){
	DayOfWeek tmp=firstDow.plus(col);
	out.println(String.format("<th>%s</th>",tmp.getDisplayName(TextStyle.FULL, locale)));
}
out.print("</thead>");
out.println("<tbody>");
LocalDate tmpDate=firstDate.minusDays(offset);
for(int row=1; row<=6;row++){
		out.println("<tr>");
	for(int col=1;col<=7;col++){
		YearMonth tmpMonth =YearMonth.from(tmpDate);
		DayOfWeek tmpWeek=tmpDate.getDayOfWeek();
		int tmpW=tmpWeek.get(weekFields.dayOfWeek());
		
		String clz=tmpMonth.isBefore(thisMonth) ? "before" :
						(tmpMonth.isAfter(thisMonth) ? "after" : "this-month");
		
		clz+=tmpWeek==DayOfWeek.SUNDAY ? " sunday":
			tmpWeek==DayOfWeek.SATURDAY ? " saturday": " weekday";
		
		out.println(String.format("<td class='%2$s'>%1$d</td>",tmpDate.getDayOfMonth(),clz));
		tmpDate=tmpDate.plusDays(1);
	}
		out.println("</tr>");
}
out.println("</tbody>");
%>
</table>
<script>
	calForm.year.value="<%=thisMonth.getYear() %>";
	calForm.month.value="<%=thisMonth.getMonthValue() %>";
	calForm.locale.value="<%=locale.toLanguageTag() %>";
<<<<<<< .mine
	calForm.timezone.value="<%=zone.toString()%>";
	
||||||| .r370578
=======
	calForm.timezone.value="<%=zone.toString()%>";
>>>>>>> .r371142
	calForm.addEventListener("change",(event)=>{
		console.log(event)
		event.target.form.requestSubmit();
	})
	document.querySelectorAll(".control-a").forEach((el,idx)=>{
		el.addEventListener("click",(evnet)=>{
			calForm.year.value = el.dataset.year;
			calForm.month.value = el.dataset.month;
			calForm.requestSubmit();
		})
	});
</script>
</body>
</html>