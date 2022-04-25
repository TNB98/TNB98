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
<div style="margin: 1% 10%">
	<%
	long millis = System.currentTimeMillis();
	java.sql.Date date = new java.sql.Date(millis);
	kqsx kq = new kqsx();
	ketquasoxo[] kqsx;
	String hang = request.getParameter("hang");
	int hang1 = 5;
	if (hang != null) {
		hang1 = Integer.parseInt(hang);
	}

	kqsx = kq.trangchu(date, "T", hang1);
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
		<form action="${pageContext.request.contextPath}/mienTrung.jsp">
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