<%@page import="Dao.history"%>
<%@page import="PRJO.lichsutimkiem"%>
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
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<button class="btn btn-primary me-md-2">
		<a href="${pageContext.request.contextPath}/addHistory.jsp">Thêm</a>
	</button>
	<button class="btn btn-primary me-md-2" id="remove">Xóa</button>
</div>

<div class="row">
	<form action="${pageContext.request.contextPath}/controllerHistory"
		method="get">
		<div class="d-grid gap-2 d-md-block">
			<input value="Apply" type="button" class="remove btn btn-primary"
				id="aply" style="display: none;">
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


		<div class="bang">
			<table class="table table-bordered">
				<tr>
					<th class="remove">Remove</th>
					<th>Edit</th>
					<th>Mã tìm kiếm</th>
					<th>Mã người dùng</th>
					<th>Mã sổ số</th>
					<th>Thành phố</th>
					<th>Ngày tìm kiếm</th>
					<th>Ngày kqsx</th>
					<th>Số tìm kiếm</th>

				</tr>
				<tr style="display: none;">
					<td>
						<form action="${pageContext.request.contextPath}/UpdateUser.jsp">
							<input type="hidden" name="mtk">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/UpdateUser.jsp">Cập
									Nhật</a>
							</button>
						</form>
					</td>
				</tr>
				<!--  lay danh sách từ database.java! -->

				<%
				lichsutimkiem[] lstk;
				history history = new history();
				int sohang = 0;
				lstk = history.lichsutk();
				sohang = lstk.length;
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
					<!-- Chọn button cập nhật hoặc xóa -->

					<td class="remove"><input value="<%=lstk[i].getMatimkiem()%>"
						name="<%=j%>" type="checkbox"></td>

					<!-- Chọn button cập nhật hoặc xóa -->
					<td>

						<form
							action="${pageContext.request.contextPath}/updateHistory.jsp">
							<input type="hidden" value="<%=lstk[i].getMatimkiem()%>"
								name="mtk">
							<button type="submit" class="btn btn-info">
								<a href="${pageContext.request.contextPath}/updateHistory.jsp">Cập
									Nhật</a>
							</button>
						</form>

					</td>
					<td><%=lstk[i].getMatimkiem()%></td>
					<td><%=lstk[i].getManguoidung()%></td>
					<td><%=lstk[i].getMasoxo()%></td>
					<td><%=lstk[i].getThanhpho()%></td>
					<td><%=lstk[i].getNgaytimkiem()%></td>
					<td><%=lstk[i].getNgaykqsx()%></td>
					<td><%=lstk[i].getSotimkiem()%></td>

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
			<form action="${pageContext.request.contextPath}/manageHistory.jsp">
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
		<div class="copyright text-center my-auto row" style="width: 100%;">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>