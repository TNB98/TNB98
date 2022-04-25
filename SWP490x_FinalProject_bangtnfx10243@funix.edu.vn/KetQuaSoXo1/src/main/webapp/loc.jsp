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


<h1>Danh Sách Kết Quả Sổ Xố</h1>
<div class="row">
	<form class="col align-self-start">
		<input class="col-3 timkiem " type="search" placeholder="Ngày"
			aria-label="Ngày">
		<button class="btn btn-outline-success" type="submit">Tìm
			Kiếm</button>
	</form>
</div>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<div class="dropdown">
		<button class="btn btn-primary me-md-2  dropdown-toggle " id="navbarDropdown"
			role="button" data-bs-toggle="dropdown" aria-expanded="false">Vùng</button>
		<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			<li>
				<form action=" ${pageContext.request.contextPath}/loc.jsp"
					method="get">
					<input type="hidden" name="loc" value="B">
					<button type="submit" class="dropdown-item nutloc">Miền
						Bắc</button>
				</form>
			</li>
			<li>
				<form action=" ${pageContext.request.contextPath}/loc.jsp"
					method="get">
					<input type="hidden" name="loc" value="T">
					<button type="submit" class="dropdown-item nutloc">Miền
						Trung</button>
				</form>
			</li>
			<li>
				<form action=" ${pageContext.request.contextPath}/loc.jsp"
					method="get">
					<input type="hidden" name="loc" value="Nam">
					<button type="submit" class="dropdown-item nutloc">Miền
						Nam</button>
				</form>
			</li>
		</ul>
	</div>

	<button class="btn btn-primary me-md-2" id="them">
		<a href="${pageContext.request.contextPath}/Add.jsp">Thêm</a>
	</button>
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
					<th >Vùng</th>
					<th>Ngày</th>
					<th>Giải Đặc Biệt</th>
					<th>Giải nhất</th>
					<th>Giải nhì</th>
					<th>Giải ba</th>
					<th>Giải bốn</th>
					<th>Giải năm</th>
					<th>Giải sáu</th>
					<th>Giải bảy</th>
				</tr>

				<!--  lay danh sách từ database.java! -->

				<%
				ketquasoxo[] kqsx;
				Database database = new Database();
				int sohang = 0;
				String loc = request.getParameter("loc");
				kqsx = database.loc(loc);
				sohang = kqsx.length;
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

					<td class="remove"><input value="<%=kqsx[i].getMasoxo()%>"
						name="<%=j%>" type="checkbox"></td>

					<!-- Chọn button cập nhật hoặc xóa -->
					<td>

						<form action="${pageContext.request.contextPath}/update.jsp">
							<input type="hidden" value="<%=kqsx[i].getMasoxo()%>"
								name="masoxo">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/update.jsp">Cập
									Nhật</a>
							</button>
						</form>

					</td>
					<td><%=kqsx[i].getVung()%></td>
					<td><%=kqsx[i].getNgay()%></td>
					<td><%=kqsx[i].getGiaidb()%></td>
					<td><%=kqsx[i].getGiai1()%></td>
					<td><%=kqsx[i].getGiai2()%></td>
					<td><%=kqsx[i].getGiai3()%></td>
					<td><%=kqsx[i].getGiai4()%></td>
					<td><%=kqsx[i].getGiai5()%></td>
					<td><%=kqsx[i].getGiai6()%></td>
					<td><%=kqsx[i].getGiai7()%></td>
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
			<form action="${pageContext.request.contextPath}/manage.jsp">
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