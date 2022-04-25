<%@page import="PRJO.nguoidung"%>
<%@page import="Dao.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="PRJO.ketquasoxo"%>
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
		$(".mess").show();
		$("#oke").click(function() {
			$(".mess").toggle();
		});
	});
<%}%>
	
</script>

<div class="mess" id="thongbaoxoa">
	<div class="thongbao">
		<p><%=request.getAttribute("mess")%></p>
		<button id="oke">Oke</button>

	</div>
</div>



<%
String mnd = request.getParameter("mnd");
User user = new User();
nguoidung[] nd;
nd = user.thongTinUpdate(mnd);
%>

<div class="main">
	<form action="${pageContext.request.contextPath}/ControllerUser"
		method="post">
		<%
		if (nd[0].getTrangthai().equals("Admin")) {
		%>
		<div class="form-check form-switch">
		<input type="hidden" name="tt" value="Admin">
			<input class="form-check-input" type="checkbox" role="switch" value="Admin" name="tt"
				id="flexSwitchCheckCheckedDisabled" checked disabled> <label
				class="form-check-label" for="flexSwitchCheckCheckedDisabled">Admin</label>
		</div>
		<%
		} else {
		%>
		<div class="form-check form-switch">

			<input name="tt" value="Admin" class="form-check-input"
				type="checkbox" role="switch" id="flexSwitchCheckDefault"> <label
				class="form-check-label" for="flexSwitchCheckDefault">Admin</label>
		</div>
		<%
		}
		%>
		<input type="hidden" value="<%=nd[0].getManguoidung()%>" name="mnd">
		<input type="hidden" value="1" name="update">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Tài Khoản</span> <input
				 type="email" class="form-control giai"
				aria-describedby="basic-addon1" placeholder="Email" name="email"
				value="<%=nd[0].getEmail()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Mật Khẩu</span> <input
				type="password" class="form-control giai"
				aria-describedby="basic-addon1" name="pass"
				value="<%=nd[0].getMk()%>" disabled>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Họ Và Tên</span> <input
				type="text" class="form-control giai"
				aria-describedby="basic-addon1" name="hvt"
				value="<%=nd[0].getHovaten()%>">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Số Điện Thoại</span>
			<input type="text" class="form-control giai"
				aria-describedby="basic-addon1" name="sdt"
				value="<%=nd[0].getSdt()%>">
		</div>

		<div class="input-group mb-3 ">
			<span class="input-group-text" id="basic-addon1">Ngày Sinh</span> <input
				class="form-control nhapdate ngay" type="date"
				aria-describedby="basic-addon1" name="ngay"
				value="<%=nd[0].getNgaysinh()%>">
		</div>

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Địa Chỉ</span> <input
				type="text" class="form-control giai"
				aria-describedby="basic-addon1" placeholder="Địa Chỉ" name="diachi"
				value="<%=nd[0].getDiachi()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giới Tính</span> <input
				type="text" class="form-control giai"
				aria-describedby="basic-addon1" name="gioitinh"
				value="<%=nd[0].getGioitinh()%>" list="gioitinh" />
			<datalist id="gioitinh">
				<option value="Nam" />
				<option value="Nữ" />
			</datalist>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Số lần đăng nhập sai</span> <input
				type="text" class="form-control giai"
				aria-describedby="basic-addon1" " name="solan"
				value="<%=nd[0].getSolan()%>">
		</div>

		<div class="d-grid gap-2 d-md-flex  mx-auto">
			<input class="btn btn-primary" type="submit" value="Update">
			<input class="btn btn-primary" type="reset" value="Reset">
			<button class="btn btn-primary">
				<a href="${pageContext.request.contextPath}/ManageUser.jsp">Huy</a>
			</button>
		</div>
		
	</form>

</div>


</body>
</html>