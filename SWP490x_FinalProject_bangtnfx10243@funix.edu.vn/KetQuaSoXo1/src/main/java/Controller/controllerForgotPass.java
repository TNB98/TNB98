package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Database;
import Dao.User;

/**
 * Servlet implementation class controllerForgotPass
 */
@WebServlet("/controllerForgotPass")
public class controllerForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controllerForgotPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String email = request.getParameter("user");
		
		PrintWriter out = response.getWriter();
		User user = new User();
		try {
			int check = user.checkEmail(email);
			if(check == 1) {
				user.sendMess(email);
				request.setAttribute("mess", "Đã Gửi Mật Khẩu Mới Vào Email của Bạn !!!");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			else {
				request.setAttribute("mess", "Không Tồn Tại Tài Khoản Này .	Vui Lòng Nhập Lại !!!");
				request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
				return ;
			}
		} catch (SQLException | NoSuchAlgorithmException | MessagingException e) {
			request.setAttribute("mess", "Hệ Thống Gặp Lỗi .Vui Lòng Sử Dụng Sau !!!");
			request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
			return ;
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
