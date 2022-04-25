package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.User;

/**
 * Servlet implementation class controllerChangePassword
 */
@WebServlet("/controllerChangePassword")
public class controllerChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controllerChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		String email = request.getParameter("user");
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");

		User user = new User();
		try {
			int check = user.checkEmail(email);
			if (check == 1) {
				String oldPass1 = user.md5(oldPass);
				check = user.checkPas(email, oldPass1);
				if (check == 1) {
					String bieuThuc = "^[a-z0-9]{6,20}$";
					if	(newPass.matches(bieuThuc)) {
						String newPass1 = user.md5(newPass);
						user.themPass(newPass1, email);
					}
					else{
						request.setAttribute("mess", "Mật khẩu không đúng .Vui lòng nhập lại !!!");
						request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
						return;
					}
				} else {
					request.setAttribute("mess", "Mật khẩu không đúng .Vui lòng nhập lại !!!");
					request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
					return;
				}
			} else {
				request.setAttribute("mess", "Không tồn tại tài khoản này .Vui lòng nhập lại !!!");
				request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
				return;
			}
		} catch (SQLException | NoSuchAlgorithmException e) {
			request.setAttribute("mess", "Hệ Thống Gặp Lỗi .Vui Lòng Sử Dụng Sau !!1");
			request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
