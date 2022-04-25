package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Login;
import Dao.User;

/**
 * Servlet implementation class ControllerLogin
 */
@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		Login login = new Login();
		try {
			String check = login.check(user, password);
			User user2 = new User();
			if(check == "email") {
				request.setAttribute("mess","Không có tài khoản này !!!" );
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(check == "pass") {	
				
				int check1 = user2.themsolan(user);
				if(check1 == 1) {
					request.setAttribute("mess","Tài Khoản đã bị khóa  !!!" );
				}
				else {
				request.setAttribute("mess","Mật khẩu không chính xác  !!!" );
				}
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			if(check.equals("Admin") ) {
				HttpSession sesion = request.getSession();
				sesion.setAttribute("loginUser",user);
				user2.xoasolan(user);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}
			else{
				HttpSession sesion = request.getSession();
				sesion.setAttribute("loginUser",user);
				user2.xoasolan(user);
				request.getRequestDispatcher("home.jsp").forward(request, response);
				return;
			}
		} catch (SQLException | NoSuchAlgorithmException e) {
			request.setAttribute("mess","Hệ Thống Đăng Nhập Bị Lỗi !!!");
			request.getRequestDispatcher("manage.jsp").forward(request, response);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
