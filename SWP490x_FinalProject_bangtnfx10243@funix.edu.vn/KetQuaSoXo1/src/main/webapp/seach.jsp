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

<form action="${pageContext.request.contextPath}/controllerSeach"
	method="get">
	<div
		style="font-size: 18px; margin-top: 15px; margin-bottom: 15px; line-height: 28px; color: #5949b3; overflow-x: hidden; font-family:"Comfortaa",cursive;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="check-box">
						<h4 class="title">1.Chon Vùng</h4>
						<div class="form-area">
							<input class="form-control tp" list="thanhpho"
								id="exampleDataList" style="margin-bottom: 15px;" name="tp"
								placeholder="Thành Phố">
							<datalist id="thanhpho">
								<option value="HCM">
								<option value="Đồng Tháp">
								<option value="Cà Mau">
								<option value="Bến Tre">
								<option value="Vũng Tàu">
								<option value="Bạc Liêu">
								<option value="Đòng Nai">
								<option value="Cần Thơ">
								<option value="Sóc Trăng">
								<option value="Tây Ninh">
								<option value="An Giang">
								<option value="Bình Thuận">
								<option value="Vĩnh Long">
								<option value="Bình Dương">
								<option value="Trà Vinh">
								<option value="Long An">
								<option value="Bình Phước">
								<option value="Hậu Giang">
								<option value="Tiền Giang">
								<option value="Kiên Giang">
								<option value="Đà Lạt">
								<option value="Hà Nội">
								<option value="Quảng Bình">
								<option value="Bắc Ninh">
								<option value="Hải Phòng">
								<option value="Nam Định">
								<option value="Thái Bình">
								<option value="Bình Định">
								<option value="Quảng Bình">
								<option value="Quảng Trị">
								<option value="Phú Yên">
								<option value="Đak Lắc">
								<option value="Quảng Nam">
								<option value="Gia Lai">
								<option value="Ninh Thuận">
								<option value="Đắc Nông">
								<option value="Quảng Ngãi">
								<option value="Kon Tum">
								<option value="Huế">
								<option value="Đà Nẵng">
								<option value="Khánh Hòa">
							</datalist>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="check-box">
						<h4 class="title">1.Chọn Ngày</h4>
						<div class="form-area">
							<input type="date" class="form-control" placeholder="Ngày"
								name="ngay">
							<%
							Cookie cookie = null;
							Cookie[] cookies = null;
							// Get an array of Cookies associated with this domain
							cookies = request.getCookies();
							if (cookies != null) {
								for (int i = 0; i < cookies.length; i++) {
									if ((cookies[i].getName()).equals("loginUser")) {
							%>
							<input type="hidden" name="user"
								value="<%=cookies[i].getValue()%>">
							<%
							}
							}
							}
							%>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="check-box">
						<h4 class="title">1.Chọn Số</h4>
						<div class="form-area">
							<input type="number" class="form-control" min="0" max="1000000"
								name="mtk">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-center ">
		<div class="btn-toolbar mx-auto justify-content-center "
			role="toolbar" aria-label="Toolbar with button groups">
			<input class="btn btn-primary" type="submit" value="Tìm Kiếm">
		</div>
	</div>
</form>
<div style="margin: 1% 15%">
	<%
	String[] a = (String[]) request.getAttribute("kq");
	%>

	<%
	if (a != null) {
		for (int i = 0; i < a.length; i++) {
	%>
	<p>
		Bạn đã trúng
		<%=a[i]%></p>
	<%
	}
	}
	%>
</div>
<div style="margin: 1% 15%;">
	<%
	String mess = (String) request.getAttribute("mess");
	if (mess != null) {
	%>
	<%=mess%>
	<%
	}
	%>
</div>
<div style="margin: 1% 10%;">
	<%
	kqsx kq = new kqsx();
	ketquasoxo[] kqsx;
	String msx = (String) request.getAttribute("msx");
	if (msx != null) {
		kqsx = kq.soxo(msx);
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
	}
	%>
</div>


<footer class="  footer" style="position: fixed; bottom: 1px;">
	<div class="container">
		<div style="text-align: center;">
			<p style="color: white;">Copyright &copy; Your Website 2022</p>
		</div>
	</div>
</footer>
</body>
</html>