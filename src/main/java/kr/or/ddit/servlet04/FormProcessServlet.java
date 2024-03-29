package kr.or.ddit.servlet04;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/04/formProcess.do")
public class FormProcessServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String[]> pMap = req.getParameterMap();
		Set<String> keySet = pMap.keySet();
		Iterator<String> it = keySet.iterator();
		System.out.println("Iterator");
		Set<Entry<String, String[]>> entrySet = pMap.entrySet();
		System.out.println("===================case1====================");
		for(Entry<String,String[]> e:entrySet) {
			String paramName=e.getKey();
			String[] paramValues=e.getValue();
			System.out.printf("$s : %s\n",paramName,Arrays.toString(paramValues));
		}
		System.out.println("===================case2====================");
		pMap.forEach((k,v)->System.out.printf("$s : %s\n",k,Arrays.toString(v)));
		
		System.out.println("===================case3====================");
		String textParam=req.getParameter("textParam");
		
		int numParam=Optional.ofNullable(req.getParameter("numParam"))
								.map(np->new Integer(np)).orElse(-1);
		System.out.printf("number param : %d\n",numParam);
		LocalDate dateParam = Optional.ofNullable(req.getParameter("dateParam"))
								.map(dp->LocalDate.parse(dp))
								.orElseThrow(()->new RuntimeException("data parameter 누락"));
		System.out.printf("number param : %s\n",dateParam);
		LocalDateTime dateTimeParam = Optional.of(req.getParameter("dateTimeParam"))
					.map(dtp->LocalDateTime.parse(dtp))
					.orElseGet(()->LocalDateTime.now());
		System.out.printf("number param : %1$tY-%1$tM-%1$td %1$th:%1$tm\n",dateTimeParam);
		String checkbox=req.getParameter("checkbox");
		
//		while(it.hasNext()) {
//			String key=it.next();
//			String[] val=pMap.get(key);
//			for(String v:val) {
//				System.out.printf("%s:%s\n",key,v);
//			}
//		}
//		System.out.println("\n\n\nEnumeration");
//		Enumeration<String> atNames = req.getParameterNames();
//		while(atNames.hasMoreElements()) {
//			String key=atNames.nextElement();
//			String[] val=req.getParameterValues(key);
//			for(String v:val) {
//				System.out.printf("%s:%s\n",key,v);
//			}
//		}
		
	}
}
