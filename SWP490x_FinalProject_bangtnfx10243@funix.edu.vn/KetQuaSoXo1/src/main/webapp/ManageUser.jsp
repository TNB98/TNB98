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
<form method="get"
	action="${pageContext.request.contextPath}/SeachUser.jsp"
	class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	<div class="input-group">
		<input type="text" class="form-control border-0 small"
			placeholder="Search for..." aria-label="Search"
			aria-describedby="basic-addon2" type="search"
			placeholder="Ten va so dien thoai" name="seach" aria-label="Ngày">
		<div class="input-group-append">
			<button class="btn btn-primary" type="submit">
				<a href="${pageContext.request.contextPath}/SeachUser.jsp"><i
					class="fas fa-search fa-sm"></i></a>
			</button>
		</div>
	</div>
</form>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<button class="btn btn-primary me-md-2">
		<a href="${pageContext.request.contextPath}/AddUser.jsp">Thêm</a>
	</button>
	<button class="btn btn-primary me-md-2" id="remove">Xóa</button>
	<button class="btn btn-primary me-md-2" id="cn">Cập Nhật Mật
		Khẩu</button>
</div>

<div class="row">
	<div class="bang">
		<form action="${pageContext.request.contextPath}/ControllerUser"
			method="get">
			<div class="d-grid gap-2 d-md-block">
				<input value="Apply Remove" type="button"
					class="btn btn-primary remove" id="aply" style="display: none;">
			</div>
			<div class="d-grid gap-2 d-md-block">
				<input value="Apply Update" type="button"
					class="btn btn-primary capnhat" id="bcn" style="display: none;">
			</div>
			<div class="mess" id="xoa">
				<div class="thongbao">
					<p>Bạn có muốn xóa không</p>
					<input value="Xóa" type="submit" class="btn btn-primary"> <input
						value="Hủy" type="button" class="btn btn-primary" id="huy">
				</div>
			</div>
			<div class="mess" id="capnhat">
				<div class="thongbao">
					<p>Bạn có muốn cập nhật mất khẩu mới không</p>
					<input value="Cập Nhật" type="submit" class="btn btn-primary">
					<input value="Không" type="button" class="btn btn-primary"
						id="khong">
				</div>
			</div>
			<table class="table table-bordered">
				<tr>
					<th class="capnhat">Cập Nhật Mật Khẩu</th>
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
					<th>Số Lần</th>

				</tr>
				<tr style="display: none;">
					<td>
						<form action="${pageContext.request.contextPath}/UpdateUser.jsp">
							<input type="hidden" name="mnd">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/UpdateUser.jsp">Cập
									Nhật</a>
							</button>
						</form>
					</td>
				</tr>

				<!--  lay danh sách từ database.java! -->

				<%
				nguoidung[] nguoidung;
				Database database = new Database();
				int sohang = 0;
				nguoidung = database.nd();
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

					<!-- Chọn các thành phần để cap nhat -->
					<td class="capnhat"><input
						value="<%=nguoidung[i].getEmail()%>" name="cn<%=j%>"
						type="checkbox"></td>

					<!-- Chọn button cập nhật hoặc xóa -->

					<td class="remove"><input
						value="<%=nguoidung[i].getTrangthai()%>" name="ten<%=j%>"
						type="hidden"><input
						value="<%=nguoidung[i].getManguoidung()%>" name="<%=j%>"
						type="checkbox"></td>

					<!-- Chọn button cập nhật hoặc xóa -->
					<td>

						<form action="${pageContext.request.contextPath}/UpdateUser.jsp">
							<input type="hidden" value="<%=nguoidung[i].getManguoidung()%>"
								name="mnd">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/UpdateUser.jsp"></a>Cập
								Nhật
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
					<td><%=nguoidung[i].getSolan()%></td>

				</tr>
				<%
				}
				%>

			</table>
		</form>
	</div>

	<!-- Phân trang danh sách -->

	<div class="row justify-content-center ">
		<div class="btn-toolbar mx-auto justify-content-center "
			role="toolbar" aria-label="Toolbar with button groups">
			<%
			for (int i = 0; i <= a; i++) {
			%>
			<form action="${pageContext.request.contextPath}/ManageUser.jsp">
				<input type="hidden" value="<%=i%>" name="pt"> <input
					class="btn btn-primary" type="submit" value="<%=i + 1%>">
			</form>
			<%
			}
			%>

		</div>
	</div>
</div>
<footer class="sticky-footer bg-white"
	style="position: fixed; bottom: 0;">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>