package kr.or.ddit.property.servlet09;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.property.service.PropertyService;
import kr.or.ddit.property.service.PropertyServiceImpl;
import kr.or.ddit.vo.PropertyVO;

/*1. model2로 변경
2. 레이어드 전체구조 사용
3. 최종 븅서 layout.jsp에 있는 페이지 모듈화 구조 활용*/
@WebServlet("/12/jdbcDesc.do")
public class JdbcDescControllerServlet extends HttpServlet{
	PropertyService service = new PropertyServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<PropertyVO> propList = service.retrieveProperties();
		req.setAttribute("propList", propList);
		String contentPage="/WEB-INF/views/12/jdpcDesc.jsp";
		req.setAttribute("contentPage", contentPage);
		String view="/WEB-INF/views/layout.jsp";
		req.getRequestDispatcher(view).forward(req, resp);
	}
}
