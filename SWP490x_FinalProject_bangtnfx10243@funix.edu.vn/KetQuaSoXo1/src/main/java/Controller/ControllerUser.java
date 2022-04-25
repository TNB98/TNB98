package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Database;
import Dao.User;
import PRJO.nguoidung;

/**
 * Servlet implementation class ControllerUser
 */
@WebServlet("/ControllerUser")
public class ControllerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Database data = new Database();

		String cn1 = request.getParameter("cn1");
		String cn2 = request.getParameter("cn2");
		String cn3 = request.getParameter("cn3");
		String cn4 = request.getParameter("cn4");
		String cn5 = request.getParameter("cn5");
		String[] email = new String[5];
		int j = 0;
		if (cn1 != null) {
			email[j] = cn1;
			j++;
		}
		if (cn2 != null) {
			email[j] = cn2;
			j++;
		}
		if (cn3 != null) {
			email[j] = cn3;
			j++;
		}
		if (cn4 != null) {
			email[j] = cn4;
			j++;
		}
		if (cn5 != null) {
			email[j] = cn5;
			j++;
		}
		try {
			if (j != 0) {
				for (int i = 0; i < j; i++) {
					data.sendMess(email[i]);
				}
				request.setAttribute("mess", "Bạn cập nhật mật khẩu thành công");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
			}

		} catch (UnsupportedEncodingException | MessagingException | SQLException e) {
			request.setAttribute("mess", "Bạn không thể cập nhật mật khẩu");
			request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
			return;
		} catch (NoSuchAlgorithmException e) {
			request.setAttribute("mess", "Bạn không thể cập nhật mật khẩu MD5");
			request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
			return;
		}

		String mnd1 = request.getParameter("1");
		String mnd2 = request.getParameter("2");
		String mnd3 = request.getParameter("3");
		String mnd4 = request.getParameter("4");
		String mnd5 = request.getParameter("5");
		String ten1 = request.getParameter("ten1");
		String ten2 = request.getParameter("ten2");
		String ten3 = request.getParameter("ten3");
		String ten4 = request.getParameter("ten4");
		String ten5 = request.getParameter("ten5");

		int a[] = new int[5];
		int i = 0;
		if (mnd1 != null) {
			if (ten1.equals("Admin")) {
				request.setAttribute("mess", "Bạn khong the xoa admin");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
				return;
			}
			a[i] = Integer.parseInt(mnd1);
			out.println(a[i]);
			i++;
		}
		if (mnd2 != null) {
			if (ten2.equals("Admin")) {
				request.setAttribute("mess", "Bạn không thể xóa Admin");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
				return;
			}
			a[i] = Integer.parseInt(mnd2);
			out.println(a[i]);
			i++;
		}
		if (mnd3 != null) {
			if (ten3.equals("Admin")) {
				request.setAttribute("mess", "Bạn không thể xóa Admin");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
				return;
			}
			a[i] = Integer.parseInt(mnd3);
			out.println(a[i]);
			i++;
		}
		if (mnd4 != null) {
			if (ten4.equals("Admin")) {
				request.setAttribute("mess", "Bạn không thể xóa Admin");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
				return;
			}
			a[i] = Integer.parseInt(mnd4);
			out.println(a[i]);
			i++;
		}
		if (mnd5 != null) {
			if (ten5.equals("Admin")) {
				request.setAttribute("mess", "Bạn không thể xóa Admin");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
				return;
			}
			a[i] = Integer.parseInt(mnd5);
			out.println(a[i]);
			i++;
		}
		try {
			if (i != 0) {
				data.xoanhieuUser(a);
				request.setAttribute("mess", "Bạn đã xoá thành công");
				request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("mess", "Bạn đã xóa thất bại");
			request.getRequestDispatcher("/ManageUser.jsp").forward(request, response);
		}

	}

	private boolean isInteger(String seach) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String trangthai = request.getParameter("tt");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String hvt = request.getParameter("hvt");
		String sdt = request.getParameter("sdt");
		String ngay = request.getParameter("ngay");
		String diachi = request.getParameter("diachi");
		String gioitinh = request.getParameter("gioitinh");
		String mnd = request.getParameter("mnd");
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String solan =request.getParameter("solan");
        int solan1 = Integer.parseInt(solan);
		if (trangthai == null) {
			trangthai = "User";
		}
		User user = new User();
		try {
			if (update != null) {
				try {
					user.capnhat(mnd, trangthai, email, pass, hvt, sdt, ngay, diachi, gioitinh,solan1);
				} catch (NoSuchAlgorithmException e) {
					request.setAttribute("mess", "Cập nhật bị lỗi .Vui lòng cập nhật lại sau !!!");
					request.setAttribute("mnd", mnd);
					request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
					return;
				}
				request.setAttribute("mess", "Cập nhật thành công");
				request.getRequestDispatcher("ManageUser.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			request.setAttribute("mess", "Cập nhật bị lỗi .Vui lòng cập nhật lại sau !!!");
			request.setAttribute("mnd", mnd);
			request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
			return;
		}
		try {
			if (add != null) {
				if (email.length() == 0 || hvt.length() == 0 || sdt.length() == 0) {
					request.setAttribute("mess", "Chưa nhập một hoặc nhiều thông tin sau Email,hvt,sdt,pass ");
					request.setAttribute("mnd", mnd);
					request.getRequestDispatcher("AddUser.jsp").forward(request, response);
				}
				String bieuThuc = "^[a-z0-9]{6,20}$";
				if (!pass.matches(bieuThuc)) {
					request.setAttribute("mess", "Mật khẩu không đúng(Phải có chữ thường , số và nhiều hơn 6) ");
					request.setAttribute("mnd", mnd);
					request.getRequestDispatcher("AddUser.jsp").forward(request, response);
				}
				user.them(trangthai, email, pass, hvt, sdt, ngay, diachi, gioitinh);
				request.setAttribute("mess", "Đăng ký thành công");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("mess", "Đăng ký thất bại");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (NoSuchAlgorithmException e) {
			request.setAttribute("mess", "Hệ thống bị lỗi");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}

	}

}
