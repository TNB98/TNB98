<%@page import="PRJO.lichsutimkiem"%>
<%@page import="Dao.history"%>
<%@page import="Dao.User"%>
<%@page import="java.util.Timer"%>
<%@page import="java.util.Date"%>
<%@page import="Dao.kqsx"%>
<%@page import="PRJO.ketquasoxo"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dao.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="PRJO.ketquasoxo"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dao.Database"%>
<c:import url="headUser.jsp"></c:import>
<div class="container-fluid">
	<%
	HttpSession session1 = request.getSession();
	String email = (String) session1.getAttribute("loginUser");
	if (email != null) {
	%><div class="row ">
		<div class="col align-self-center" style="text-align: center;">
			<table class="table">
				<tr>
					<th>#</th>
					<th>Thành Phố</th>
					<th>Ngày Quay KQ</th>
					<th>Ngày Tìm Kiếm</th>
					<th>Số Tìm Kiếm</th>
				</tr>

				<%
				User user = new User();
				String mnd = user.mannguoidung(email);
				history h = new history();
				lichsutimkiem[] ls = h.lstkmnd(mnd);
				for (int i = 0; i < ls.length; i++) {
				%>
				<tr>
					<th><%=i + 1%></th>
					<td><%=ls[i].getThanhpho()%></td>
					<td><%=ls[i].getNgaykqsx()%></td>
					<td><%=ls[i].getNgaytimkiem()%></td>
					<td><%=ls[i].getSotimkiem()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="row ">
		<div class="col align-self-center" style="text-align: center;">
			<p>Lịch sử của bạn trống</p>
		</div>
	</div>
	<%
	}
	%>
</div>
<div class="container-fluid">
	<div class="row footer" style="position: fixed; bottom: 1px;">
		<h6 style="margin: 20px;">Kết Qủa Sổ Xố là trang Web miễn phí
			cung cấp công cụ tra cứu các kết quả sổ xố</h6>
		<h6>Bản quyền bởi Trần Như Bang</h6>
		<h6>Email:bang@gmail.com</h6>
	</div>
</div>
