<%@page import="PRJO.nguoidung"%>
<%@page import="Dao.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="PRJO.ketquasoxo"%>
<%@page import="Dao.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/Style.css">
<meta charset="ISO-8859-1">
<script src="${pageContext.request.contextPath}/js/js1.js"></script>
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<title>Register</title>
</head>
<body>
	<script>
		<c:import url="headUser.jsp"></c:import>
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
	if (mnd == null) {
		mnd = (String) request.getAttribute("mnd");
	}
	User user = new User();
	nguoidung[] nd;
	nd = user.thongTinUpdate(mnd);
	%>

	<div class="main">
		<form action="${pageContext.request.contextPath}/ControllerUser"
			method="post">
			<input type="hidden" value="1" name="add"> <input
				class="form-check-input" type="hidden" name="tt" value="User">

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Tài Khoản</span> <input
					type="email" class="form-control giai"
					aria-describedby="basic-addon1" name="email">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Mật Khẩu</span> <input
					type="password" class="form-control giai"
					aria-describedby="basic-addon1" name="pass"%>">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Họ Và Tên</span> <input
					type="text" class="form-control giai"
					aria-describedby="basic-addon1" name="hvt"">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Số Điện
					Thoại</span> <input type="text" class="form-control giai"
					aria-describedby="basic-addon1" name="sdt"">
			</div>

			<div class="input-group mb-3 ">
				<span class="input-group-text" id="basic-addon1">Ngày Sinh</span> <input
					class="form-control nhapdate ngay" type="date"
					aria-describedby="basic-addon1" name="ngay">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Địa Chỉ</span> <input
					type="text" class="form-control giai"
					aria-describedby="basic-addon1" name="diachi">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">Giới Tính</span> <input
					type="text" class="form-control giai"
					aria-describedby="basic-addon1" name="gioitinh" list="gioitinh" />
				<datalist id="gioitinh">
					<option value="Nam" />
					<option value="Nữ" />
				</datalist>
			</div>

			<div class="d-grid gap-2 d-md-flex  mx-auto">
				<input class="btn btn-primary" type="submit" value="Đăng Ký">
				<input class="btn btn-primary" type="reset" value="Xóa Hết">
				<button class="btn btn-primary">
					<a href="${pageContext.request.contextPath}/ManageUser.jsp">Hủy</a>
				</button>
			</div>

		</form>

	</div>


</body>
</html>