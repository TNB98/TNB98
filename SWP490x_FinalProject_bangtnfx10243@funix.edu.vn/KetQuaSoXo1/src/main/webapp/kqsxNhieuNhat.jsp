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
<div class="container">
	<div style="margin: 1% 10%">
		<h4 class="tengiai">Kết Qủa Sổ Xố Trúng Nhiều Nhất</h4>
		<div style="overflow-x: auto;">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
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
					<%
					kqsx kq = new kqsx();
					String[][] kqsx1;
					String[][] kqsx2;
					String[][] kqsx3;
					String[][] kqsx4;
					String[][] kqsx5;
					String[][] kqsx6;
					String[][] kqsx7;
					String[][] kqsx;
					kqsx = kq.kqsxNhieuNhat("giaidacbiet");
					kqsx1 = kq.kqsxNhieuNhat("giainhat");
					kqsx2 = kq.kqsxNhieuNhat("giainhi");
					kqsx3 = kq.kqsxNhieuNhat("giaiba");
					kqsx4 = kq.kqsxNhieuNhat("giaibon");
					kqsx5 = kq.kqsxNhieuNhat("giainam");
					kqsx6 = kq.kqsxNhieuNhat("giaisau");
					kqsx7 = kq.kqsxNhieuNhat("giaibay");
					for (int i = 0; i < 5; i++) {
					%>
					<tr>
						<th><%=0 + i%></th>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx[i][1]%> <br>
								<%=kqsx[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx1[i][1]%><br>
								<%=kqsx1[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx2[i][1]%><br>
								<%=kqsx2[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx3[i][1]%><br>
								<%=kqsx3[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx4[i][1]%><br>
								<%=kqsx4[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx5[i][1]%><br>
								<%=kqsx5[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx6[i][1]%><br>
								<%=kqsx6[i][0]%> lần trúng</span></td>
						<td style="text-align: center;"><span class="nuberkqsx"><%=kqsx7[i][1]%><br>
								<%=kqsx7[i][0]%> lần trúng</span></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<footer class="  footer" style="position: fixed; bottom: 0;">
	<div class="container-fluid">
		<div style="text-align: center;">
			<span>Copyright &copy; Your Website 2022</span>
		</div>
	</div>
</footer>
</body>
</html>