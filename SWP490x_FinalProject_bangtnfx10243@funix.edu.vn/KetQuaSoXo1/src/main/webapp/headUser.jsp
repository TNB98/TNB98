<%@page import="java.util.Timer"%>
<%@page import="javax.xml.crypto.Data"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>KQSX</title>

<!-- Custom fonts for this template -->
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
	href="${pageContext.request.contextPath}/css/Style.css">

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
</head>

<body>
	<div class="container-fluid">
		<a href="#a" class="scroll active"><i class="fas fa-angle-up"
			style="margin-top: 12px"></i></a>
		<div class=" row justify-content-between" id="a" style="margin: 30px;">
			<div class="col-8 col-md-6 col-lg-3"
				style="text-align: center; float: left;">
				<a Href="#"><img alt=""
					src="${pageContext.request.contextPath}/Image/logo.png"></a>
			</div>
			<div class="col-4 col-md-6 col-lg-3">
				<%
				HttpSession session1 = request.getSession();
				String a = (String) session1.getAttribute("loginUser");
				if (a != null) {
				%>
				<div class="dropdown" style="margin: 20px;">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						style="float: right;" id="dropdownMenuButton1"
						data-bs-toggle="dropdown" aria-expanded="false">ND</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><p class="dropdown-item"><%=a%></p></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/changePassword.jsp">Đổi
								Mật Khẩu</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/history.jsp">Lịch Sử</a></li>
						<li>
							<form
								action="${pageContext.request.contextPath}/controllerLogOut"
								method="get">
								<input type="hidden" name="dx" value="1"> <input
									class="dropdown-item" type="submit"
									value="Đăng
										Xuất">
							</form>
						</li>

					</ul>
					<%
					} else {
					%>
					<a href="${pageContext.request.contextPath}/Login.jsp"
						style="background-image: linear-gradient(0deg, #f4ba2e 0%, #fea036 100%); margin: 5px 25px 5px 0; border-style: solid; border-width: 1px; border-color: #fea036; border-radius: 5px; -webkit-box-shadow: 0px 3px 2px 0px rgb(32 29 30/ 25%); box-shadow: 0px 3px 2px 0px rgb(32 29 30/ 25%); padding: 5px 15px; font-size: 16px; line-height: 26px; color: #ffffff; display: inline-block; cursor: pointer; width: auto; height: auto;">Đăng
						Nhập</a><a href="${pageContext.request.contextPath}/register.jsp"
						style="background-image: linear-gradient(7deg, #ec1379 0%, #6c0092 100%); margin: 5px 0; border: 1px solid #6c0092; border-radius: 5px; -webkit-box-shadow: 0px 3px 2px 0px rgb(32 29 30/ 25%); box-shadow: 0px 3px 2px 0px rgb(32 29 30/ 25%); padding: 5px 10px; font-size: 16px; line-height: 26px; color: #ffffff; display: inline-block; cursor: pointer; width: auto; height: auto;">Đăng
						Ký</a>
					<%
					}
					%>
				</div>

			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
			<div class="container-fluid">
				<a class="navbar-brand" style="margin-left: 10%;"
					href="${pageContext.request.contextPath}/home.jsp">Trang Chủ</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/mienBac.jsp">Miền
								Bắc</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/mienTrung.jsp">Miền
								Trung</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/mienNam.jsp">Miền
								Nam</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/seach.jsp">Tìm kiếm</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/kqsxNhieuNhat.jsp">KQSX Nhiều Nhất</a></li>
					</ul>
				</div>
			</div>
		</nav>

	</div>