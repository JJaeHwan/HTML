package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.IProdService;
import kr.or.ddit.lprod.service.ProdServiceimple;
import kr.or.ddit.lprod.vo.ProdVO;

@WebServlet("/ProdList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 0. 클라이언트 전송시 데이터를 받는다
				String lgu = request.getParameter("gu");
				
				// 1. service객체를 얻어온다.
				IProdService service = ProdServiceimple.getService();
				
				// 2. service메소드 호출한다 - 결과를 리턴 받는다
				List<ProdVO> list = service.selectByLguList(lgu);
				
				// 3. 결과를 request에 저장한다
				request.setAttribute("list", list);
				
				// 4. view페이지로 이동(forward) = html을 이용하여 출력 하거나 또는 json데이터를 생성 
				RequestDispatcher disp =  request.getRequestDispatcher("view/prodList.jsp");
				disp.forward(request, response);
		
		
	}

}
