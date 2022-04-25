<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="${pageContext.request.contextPath}/JS/js.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/Style.css">
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/Style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Thay Đổi Mật Khẩu</h1>
	<form
		action="${pageContext.request.contextPath}/controllerChangePassword"
		method="get">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Tài Khoản</span> <input
				type="email" class="form-control giai"
				aria-describedby="basic-addon1" name="user">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Mật khẩu cũ</span> <input
				type="password" class="form-control giai"
				aria-describedby="basic-addon1" name="oldPass">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Mật khẩu mới</span> <input
				type="password" class="form-control giai"
				aria-describedby="basic-addon1" name="newPass">
		</div>
		<input type="email" name="user"> <input type="password"
			name="oldPass"> <input type="password" name=newPass>
		<div class="d-grid gap-2 d-md-flex  mx-auto">
			<input class="btn btn-primary" type="submit" value="Register"> <input
				class="btn btn-primary" type="reset" value="Reset">
			<button class="btn btn-primary">
				<a href="${pageContext.request.contextPath}/Login.jsp">Thoát</a>
			</button>
		</div>

	</form>

</body>
</html>