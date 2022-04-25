package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Database;
import Dao.User;
import PRJO.ketquasoxo;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest request;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public test() {
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
		Database data = new Database();

		// Phần trang cho bảng
		String pt1 = request.getParameter("pt");
		if (pt1 != null) {
			request.setAttribute("pt", pt1);
			request.getRequestDispatcher("/manage.jsp").forward(request, response);
		}

		// Phân trang cho bảng lọc theo điều kiện
		String pt = request.getParameter("ptloc");
		if (pt != null) {
			request.setAttribute("pt", pt);
			request.getRequestDispatcher("/loc.jsp").forward(request, response);
		}

		// Xóa nhiều phần tử cùng lúc
		String maxoa1 = request.getParameter("1");
		String maxoa2 = request.getParameter("2");
		String maxoa3 = request.getParameter("3");
		String maxoa4 = request.getParameter("4");
		String maxoa5 = request.getParameter("5");

		int a[] = new int[5];
		int i = 0;
		int masoxo;
		if (maxoa1 != null) {

			masoxo = Integer.parseInt(maxoa1);
			a[i] = masoxo;
			i++;

		}
		if (maxoa2 != null) {
			masoxo = Integer.parseInt(maxoa2);
			a[i] = masoxo;
			i++;
		}
		if (maxoa3 != null) {
			masoxo = Integer.parseInt(maxoa3);
			a[i] = masoxo;
			i++;
		}
		if (maxoa4 != null) {
			masoxo = Integer.parseInt(maxoa4);
			a[i] = masoxo;
			i++;
		}
		if (maxoa5 != null) {
			masoxo = Integer.parseInt(maxoa5);
			a[i] = masoxo;
			i++;
		}

		try {
			data.xoanhieu(a);
			request.setAttribute("mess", "Bạn đã xoá thành công");
			request.getRequestDispatcher("/manage.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("mess", "Bạn đã xóa thất bại");
			request.getRequestDispatcher("/manage.jsp").forward(request, response);
		}

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

		String add = request.getParameter("add");
		if (add != null) {
			String vung = request.getParameter("vung");
			String ngay = request.getParameter("ngay");
			String thang = request.getParameter("thang");
			String nam = request.getParameter("nam");
			String gdb = request.getParameter("gdb");
			String g1 = request.getParameter("g1");
			String g2 = request.getParameter("g2");
			String g3 = request.getParameter("g3");
			String g4 = request.getParameter("g4");
			String g5 = request.getParameter("g5");
			String g6 = request.getParameter("g6");
			String g7 = request.getParameter("g7");
			String thanhpho = request.getParameter("tp");
			// Kiểm tra nhập thông tin nhập
			if (vung.length() == 0) {
				request.setAttribute("mess", "Chưa nhập thông tin vùng");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			// Kiểm tra thông tin ngày tháng năm
			if (thang != null) {
				if (ngay.length() == 0 || thang.length() == 0 || nam.length() == 0) {
					request.setAttribute("mess", "Chưa nhập ngày tháng năm");
					request.getRequestDispatcher("/Add.jsp").forward(request, response);
					return;
				}
			}

			// Kiểm tra nhập đủ số giải
			if (gdb.length() != 5 && gdb.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải đặc biệt ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g1.length() != 5 && g1.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải nhất  ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g2.length() != 5 && g2.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải nhì ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g3.length() != 5 && g3.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải ba ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g4.length() != 5 && g4.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải bốn ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g5.length() != 5 && g5.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải năm ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g6.length() != 5 && g6.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải sáu ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}
			if (g7.length() != 5 && g7.length() != 6) {
				request.setAttribute("mess", "Nhập sai thông tin giải bảy ");
				request.getRequestDispatcher("/Add.jsp").forward(request, response);
				return;
			}

			Database data = new Database();
			ketquasoxo kq = new ketquasoxo();
			// cap nhat
			String test = request.getParameter("capnhat");
			if (test != null) {
				String masoxo = request.getParameter("Masoxo");
				int masoxo1 = Integer.parseInt(masoxo);
				kq.setketquasoxo(masoxo1, 1, ngay, vung, gdb, g1, g2, g3, g4, g5, g6, g7, thanhpho);
				try {
					data.capnhat(kq);
					request.setAttribute("mess", "Cập Nhật Thành Công");
					request.getRequestDispatcher("/manage.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("mess", "Cập Nhật Thất Bại ");
					request.getRequestDispatcher("/update.jsp").forward(request, response);
				}
			} // Thêm vào cơ sở dữ liệu
			else {
				HttpSession session = request.getSession();
				String mql = (String) session.getAttribute("loginUser");
				int mql1 = 6;
				if (mql == null) {
					mql1 = 6;
				} else {
					User user = new User();
					try {
						String mqlnd = user.mannguoidung(mql);
						mql1 = Integer.parseInt(mqlnd);
					} catch (SQLException e) {
						request.setAttribute("mess", "Thêm Thất Bại ");
						request.getRequestDispatcher("/Add.jsp").forward(request, response);
					}
				}
				kq.setketquasoxo(1, mql1, nam + "/" + thang + "/" + ngay, vung, gdb, g1, g2, g3, g4, g5, g6, g7,
						thanhpho);
				try {

					data.themkwsx(kq);
					request.setAttribute("mess", "Thêm Thành Công ");
					request.getRequestDispatcher("/manage.jsp").forward(request, response);
				} catch (SQLException e) {
					request.setAttribute("mess", "Thêm Thất Bại ");
					request.getRequestDispatcher("/Add.jsp").forward(request, response);
				}
			}

		}

		// Cap nhat
		String update = request.getParameter("update");
		if (update != null) {
			String msx = request.getParameter("masoxo");
			request.setAttribute("msx", msx);
			request.getRequestDispatcher("/update.jsp").forward(request, response);
			return;
		}
	}

}
