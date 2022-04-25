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

<script src="${pageContext.request.contextPath}/JS/js.js"></script>
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
	<c:import url="headUser.jsp"></c:import>
	<div class="container-fluid">
		<img alt="baneer"
			src="${pageContext.request.contextPath}/Image/b1.png"
			style="max-width: 100%; height: auto; margin-top: 15px;">
		<div style="margin: 1% 10%;">
			<%
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			kqsx kq = new kqsx();
			ketquasoxo[] kqsx;
			String hang = request.getParameter("hang");
			int hang1 = 5 ;
			if(hang != null){
				hang1 = Integer.parseInt(hang);
			}
			kqsx = kq.trangchu(date, "", hang1);
			for (int i = 0; i < kqsx.length; i++) {
			%>


			<h4 class="tengiai"><%=kqsx[i].getThanhpho()%></h4>
			<h6 class="tengiai"><%=kqsx[i].getNgay()%></h6>
			<div style="overflow-x: auto;">
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center;">GDB</th>
							<th style="text-align: center;">G1</th>
							<th style="text-align: center;">G2</th>
							<th style="text-align: center;">G3</th>
							<th style="text-align: center;">G4</th>
							<th style="text-align: center;">G5</th>
							<th style="text-align: center;">G6</th>
							<th style="text-align: center;">G7</th>
						</tr>
					</thead>
					<tbody>
						<tr>

							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiaidb()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai1()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai2()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai3()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai4()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai5()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai6()%></span></td>
							<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i].getGiai7()%></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
			}
			%>
			<div style="float: right;">
				<form action="${pageContext.request.contextPath}/home.jsp">
					<span>Set</span><input list="set" name="hang" value="5" class="set"
						type="number" min="-1" max="36">
					<datalist id="set">
						<option value="5">
						<option value="15">
						<option value="30">
					</datalist>
					<input class="btn btn-primary" type="submit" value="Reset">
				</form>
			</div>
		</div>

		<c:import url="footer.jsp"></c:import>
</body>
</html>