package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.QuestionService;
import vo.Customer;
import vo.Emp;

@WebServlet("/question/modifyQuestion")
public class ModifyQuestionController extends HttpServlet {
	private QuestionService questionService;
	
	// 고객센터 문의글 수정
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// VIEW -> /WEB-INF/view/question/modifyQuestion.jsp
	// 로그인 후에만 진입가능
	HttpSession session = request.getSession(); 
	
	// 로그인 값 체크
	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	Emp loginEmp = (Emp)session.getAttribute("loginEmp");
	if(loginCustomer == null && loginEmp == null) {
		response.sendRedirect(request.getContextPath()+"/login");
		return;
	}
	
	// 매개변수, request 값세팅
	request.setCharacterEncoding("UTF-8"); // request 한글코딩	
	int questionCode = Integer.parseInt(request.getParameter("questionCode"));
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
