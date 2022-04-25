package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Database;
import Dao.User;
import Dao.history;

/**
 * Servlet implementation class controllerSeach
 */
@WebServlet("/controllerSeach")
public class controllerSeach extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controllerSeach() {
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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("loginUser");
		
		String thanhpho = request.getParameter("tp");
		String ngay = request.getParameter("ngay");
		String matimkiem = request.getParameter("mtk");
		Database data = new Database();
		Connection conn = data.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select count(Masoxo) from [dbo].[KetQuaSoXo] where thanhpho like N'%"
					+ thanhpho + "%' and Ngay = '" + ngay + "'");
			rs.next();
			int check = rs.getInt(1);
			if (check == 0) {
				request.setAttribute("mess", "Thành Phố Không Quay Thưởng Vào Ngày : " + ngay);
				request.getRequestDispatcher("seach.jsp").forward(request, response);
				return;
			} else {
				ResultSet rs1 = stmt.executeQuery("select Masoxo from [dbo].[KetQuaSoXo] where thanhpho like N'%"
						+ thanhpho + "%' and Ngay = '" + ngay + "'");
				rs1.next();
				String msx = rs1.getString(1);
				history h = new history();
				String[] a = new String[8];
				int i = 0;
				String b = h.check(msx, matimkiem, "giaidacbiet");
				if (b.equals("1")) {
					a[i] = "giải đặc biệt";
					i++;
				}
				b = h.check(msx, matimkiem, "giainhat");
				if (b.equals("1")) {
					a[i] = "giải nhất";
					i++;
				}
				b = h.check(msx, matimkiem, "giainhi");
				if (b.equals("1")) {
					a[i] = "giải nhì";
					i++;
				}
				b = h.check(msx, matimkiem, "giaiba");
				if (b.equals("1")) {
					a[i] = "giải ba";
					i++;
				}
				b = h.check(msx, matimkiem, "giaibon");
				if (b.equals("1")) {
					a[i] = "giaibon";
					i++;
				}
				b = h.check(msx, matimkiem, "giainam");
				if (b.equals("1")) {
					a[i] = "giải năm";
					i++;
				}
				b = h.check(msx, matimkiem, "giaisau");
				if (b.equals("1")) {
					a[i] = "giải sáu";
					i++;
				}
				b = h.check(msx, matimkiem, "giaibay");
				if (b.equals("1")) {
					a[i] = "giai bảy";
					i++;
				}
				String[] c = new String[i];
				for (int j = 0; j < i; j++) {
					c[j] = a[j];
				}
				request.setAttribute("kq", c);
				request.setAttribute("msx", msx);
				long millis = System.currentTimeMillis();
				java.sql.Date date = new java.sql.Date(millis);
				if (email != null) {
					User use = new User();
					String mnd = use.mannguoidung(email);
					PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO  LichSuTimKiem values (?,?,?,?,?,?)");
					stmt1.setString(1, mnd);
					stmt1.setString(2, msx);
					stmt1.setString(3, date.toString());
					stmt1.setString(4, ngay);
					stmt1.setString(5, thanhpho);
					stmt1.setString(6, matimkiem);
					stmt1.execute();
				}
				request.getRequestDispatcher("seach.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
