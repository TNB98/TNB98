<%@page import="PRJO.nguoidung"%>
<%@page import="PRJO.ketquasoxo"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dao.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="Head.jsp"></c:import>
<script>
	
<%String mess = (String) request.getAttribute("mess");
if (mess != null) {%>
	$(document).ready(function() {
		$("#mess").show();
		$("#oke").click(function() {
			$("#mess").toggle();
		});
	});
<%}%>
	
</script>


<div class="mess" id="mess">
	<div class="thongbao">
		<div class="thongbao">
			<p><%=request.getAttribute("mess")%></p>
			<button id="oke" class="btn btn-primary">Oke</button>

		</div>
	</div>
</div>


<h1>Danh Sách Người Dùng</h1>
<div class="row">
	<form class="col align-self-start" method="get" action="${pageContext.request.contextPath}/SeachUser.jsp">
		<input class="col-3 timkiem " type="search" placeholder="Ten va so dien thoai" name="seach"
			aria-label="Ngày">
		<button class="btn btn-outline-success" type="submit"> <a href="${pageContext.request.contextPath}/SeachUser.jsp">Tìm Kiếm</a>
			</button>
	</form>
</div>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<button class="btn btn-primary me-md-2" id="remove">Xóa</button>
</div>

<div class="row">
	<form action="${pageContext.request.contextPath}/test" method="get">
		<div class="d-grid gap-2 d-md-block">
			<input value="Apply" type="button"
				class="remove test btn btn-primary" id="aply">
		</div>
		<div class="mess" id="xoa">
			<div class="thongbao">
				<p>Bạn có muốn xóa không</p>
				<input value="Xóa" type="submit" class="btn btn-primary"> <input
					value="Hủy" type="button" class="btn btn-primary" id="huy">
			</div>
		</div>


		<div class="bang">
			<table class="table table-bordered">
				<tr>
					<th class="remove">Remove</th>
					<th>Edit</th>

					<!-- Lọc danh sách dựa theo tiêu chí vùng -->
					<th>Emai</th>
					<th>Trạng Thái</th>
					<th>Họ Và Tên</th>
					<th>Số Điện Thoại</th>
					<th>Ngày Sinh</th>
					<th>Địa Chỉ</th>
					<th>Giới Tính</th>

				</tr>

				<!--  lay danh sách từ database.java! -->

				<%
				nguoidung[] nguoidung ;
				Database database = new Database();
				int sohang = 0;
				String seach = request.getParameter("seach");
				if(seach == null){
					return;
				}
				nguoidung = database.seach(seach);
				sohang = nguoidung.length;
				int a = sohang / 5;
				String c = request.getParameter("pt");
				int b;
				if (c == null) {
					b = 0;
				} else {
					b = Integer.parseInt(c);
				}
				int d = (b * 5) + 5;
				int n = b * 5;
				if (d > sohang) {
					d = sohang;
				}
				int j = 0;
				for (int i = n; i < d; i++) {
					j++;
				%>

				<tr>

					<!-- Chọn các thành phần để xóa -->

					<td class="remove"><input value="<%=nguoidung[i].getManguoidung()%>"
						name="<%=j%>" type="checkbox"></td>

					<!-- Chọn button cập nhật hoặc xóa -->
					<td>

						<form action="${pageContext.request.contextPath}/UpdateUser.jsp">
							<input type="hidden" value="<%=nguoidung[i].getManguoidung()%>"
								name="mnd">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/UpdateUser.jsp">Cập
									Nhật</a>
							</button>
						</form>

					</td>
					<td><%=nguoidung[i].getEmail()%></td>
					<td><%=nguoidung[i].getTrangthai()%></td>
					<td><%=nguoidung[i].getHovaten()%></td>
					<td><%=nguoidung[i].getSdt()%></td>
					<td><%=nguoidung[i].getNgaysinh()%></td>
					<td><%=nguoidung[i].getDiachi()%></td>
					<td><%=nguoidung[i].getGioitinh()%></td>
					
				</tr>
				<%
				}
				%>

			</table>
		</div>
	</form>
	<!-- Phân trang danh sách -->

	<div class="row justify-content-center ">
		<div class="btn-toolbar mx-auto justify-content-center "
			role="toolbar" aria-label="Toolbar with button groups">
			<%
			for (int i = 0; i <= a; i++) {
			%>
			<form action="${pageContext.request.contextPath}/SeachUser.jsp">
				<input type="hidden" value="<%=i%>" name="pt"> <input
					class="btn btn-primary" type="submit" value="<%=i + 1%>">
			</form>
			<%
			}
			%>

		</div>
	</div>
</div>


<c:import url="footer.jsp"></c:import>