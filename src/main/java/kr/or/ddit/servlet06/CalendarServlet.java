package kr.or.ddit.servlet06;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.FormatStyle;
import java.time.format.TextStyle;
import java.time.temporal.WeekFields;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.CalenderVO;

/**
 * Model2 + MVC servlet (Model+Controller : request 처리자)
 *  1. 요청을 받고, 
 *  2.요청을 분석하고 검증 
 *  3. Model 생성 
 *  4. Model을 전달 및 공유 
 *  5. view layer 선택 
 *  6. 제어의 이동(controller ->
 * view) jsp
 * 
 */
@WebServlet("/case3/calendar.do")
public class CalendarServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Locale locale = req.getLocale();
		YearMonth thisMonth = YearMonth.now();

		String monthOption = Stream.of(Month.values()).map(m -> String.format("<option value='%d'>%s</option>",
				m.getValue(), m.getDisplayName(TextStyle.FULL, locale))).collect(Collectors.joining("\n"));
		String localeOption = Arrays.stream(Locale.getAvailableLocales())
				.map(l -> String.format("<option value='%s'>%s</option>", l.toLanguageTag(), l.getDisplayName(l)))
				.collect(Collectors.joining("\n"));

		req.setAttribute("locale", locale);
		req.setAttribute("thisMonth", thisMonth);
		req.setAttribute("monthOption", monthOption);
		req.setAttribute("localeOption", localeOption);
		String view="/WEB-INF/views/06/case3/calenderForm.jsp";
		req.getRequestDispatcher(view).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Locale locale = Optional.ofNullable(req.getParameter("locale")).filter(lp -> !lp.trim().isEmpty())
				.map(lp -> Locale.forLanguageTag(lp)).orElse(Locale.getDefault());

		ZoneId zone = ZoneId.systemDefault();

		ZonedDateTime current = ZonedDateTime.now(zone);
		FormatStyle fullStyle = FormatStyle.FULL;

		int targetYear = Optional.ofNullable(req.getParameter("year")).map(yp -> new Integer(yp))
				.orElse(YearMonth.from(current).getYear());
		YearMonth thisMonth = Optional.ofNullable(req.getParameter("month"))
				.map(mp -> YearMonth.of(targetYear, Integer.parseInt(mp))).orElse(YearMonth.from(current));

		YearMonth beforeMonth = thisMonth.minusMonths(1);
		YearMonth nextMonth = thisMonth.plusMonths(1);

		WeekFields weekFields = WeekFields.of(locale);
		DayOfWeek firstDow = weekFields.getFirstDayOfWeek();

		LocalDate firstDate = thisMonth.atDay(1);
		int firstDayDOW = firstDate.get(weekFields.dayOfWeek());
		int offset = firstDayDOW - 1;
		CalenderVO calVO=new CalenderVO();
		calVO.setBeforeMonth(beforeMonth);
		calVO.setCurrent(current);
		calVO.setFirstDate(firstDate);
		calVO.setFirstDOW(firstDow);
		calVO.setFormatStyle(fullStyle);
		calVO.setLocale(locale);
		calVO.setNextMonth(nextMonth);
		calVO.setOffset(offset);
		calVO.setThisMonth(thisMonth);
		
		req.setAttribute("calender",calVO);
		String view="/WEB-INF/views/06/case3/calender.jsp";
		req.getRequestDispatcher(view).forward(req, resp);
	}
}
