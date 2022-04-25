package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Database;
import Dao.history;

/**
 * Servlet implementation class controllerHistory
 */
@WebServlet("/controllerHistory")
public class controllerHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controllerHistory() {
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
		PrintWriter out = response.getWriter();
		Database data = new Database();
		history h = new history();
		String mtk1 = request.getParameter("1");
		String mtk2 = request.getParameter("2");
		String mtk3 = request.getParameter("3");
		String mtk4 = request.getParameter("4");
		String mtk5 = request.getParameter("5");
		int i = 0 ;
		String a[] = new String[5]; 
		if(mtk1 != null) {
			a[i] = mtk1;
			i ++;
		}
		if(mtk2 != null) {
			a[i] = mtk2;
			i ++;
		}
		if(mtk3 != null) {
			a[i] = mtk3;
			i ++;
		}
		if(mtk4 != null) {
			a[i] = mtk4;
			i ++;
		}
		if(mtk5 != null) {
			a[i] = mtk5;
			i ++;
		}
		try {
			if (i != 0) {
				h.xoalstk(a);
				request.setAttribute("mess", "Bạn đã xoá thành công");
				request.getRequestDispatcher("/manageHistory.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			request.setAttribute("mess", "Bạn đã xóa thất bại");
			request.getRequestDispatcher("/manageHistory.jsp").forward(request, response);
			return;
		}
        

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Database data = new Database();
		history h = new history();
		
		String update = request.getParameter("update");
		String add = request.getParameter("add");
		String mtk = request.getParameter("mtk");
		String tp = request.getParameter("tp");
		String mnd = request.getParameter("mnd");
		String msx = request.getParameter("msx");
		String ngaytk = request.getParameter("thangtk")+"/"+request.getParameter("ngaytk") + "/" +request.getParameter("namtk");
		String ngaykq = request.getParameter("thangkq")+"/"+request.getParameter("ngaykq") + "/" + request.getParameter("namkq");
		String sotimkiem = request.getParameter("sotimkiem");
		String ngaytkcn = request.getParameter("ngaytkcn");
		String ngaykqcn = request.getParameter("ngaykqcn");
		if(add != null) {
			try {
				h.themlstk(mnd, msx, tp, ngaytk, ngaykq, sotimkiem);
				request.setAttribute("mess", "Thêm lịch sử tìm kiếm thành công");
				request.getRequestDispatcher("manageHistory.jsp").forward(request, response);
				return;
			} catch (SQLException e) {
				request.setAttribute("mess", "Thêm lịch sử tìm kiếm thất bại");
				request.getRequestDispatcher("manageHistory.jsp").forward(request, response);
				return;
			}
			
		}
		if(update != null) {
			try {
				h.capnhatlstk(mtk, mnd, msx, tp, ngaytkcn, ngaykqcn, sotimkiem);
				request.setAttribute("mess", "Cập nhật lịch sử tìm kiếm thành công");
				request.getRequestDispatcher("manageHistory.jsp").forward(request, response);
				return;
			} catch (SQLException e) {
				request.setAttribute("mess", "Cập nhật lịch sử tìm kiếm thất bại");
				request.getRequestDispatcher("manageHistory.jsp").forward(request, response);
				return;
			}
			
		}
	}

}
