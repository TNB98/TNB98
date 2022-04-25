<%@page import="PRJO.lichsutimkiem"%>
<%@page import="Dao.history"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="Head.jsp"></c:import>
<%
String mess = (String) request.getAttribute("mess");
if (mess != null) {
%>
<Script>
	$(document).ready(function() {
		$("#thongbaoxoa").show();
		$("#oke").click(function() {
			$("#thongbaoxoa").toggle();
		});
	});
</Script>
<%
}
%>

<div class="mess" id="thongbaoxoa">
	<div class="thongbao">
		<p><%=request.getAttribute("mess")%></p>
		<button id="oke">Oke</button>

	</div>
</div>
<div class="main">
	<form action="${pageContext.request.contextPath}/controllerHistory"
		method="post">
		<input name="add" value="1" type="hidden">
		<div class="input-group mb-3">
			<input type="hidden" name="add" value="1"> <span
				class="input-group-text" id="basic-addon1">Thành Phố</span> <input
			class="form-control vung" list="datalistOptions" id="exampleDataList"
			style="margin-bottom: 15px;" name="tp" required>
		<datalist id="datalistOptions">
			<option value="Miền Bắc">
			<option value="Miền Trung">
			<option value="Miền Nam">
		</datalist>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Mã Người Dùng</span>
			<input type="number" class="form-control giai"
				aria-describedby="basic-addon1" placeholder="5-6 Số" name="mnd" required>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Mã sổ số</span>
			<input type="number" class="form-control giai"
				aria-describedby="basic-addon1" placeholder="5-6 Số" name="msx" required>
		</div>
		<div class="input-group mb-3"
			style="margin-bottom: 15px;">
             <span class="input-group-text" id="basic-addon1">Ngày tìm kiếm</span>
			<input class="form-control nhapdate ngay" type="number"
				placeholder="Ngày" min="1" max="31" name="ngaytk" required> <input	class="form-control nhapdate thang " name="thangtk" type="number"
				placeholder="Tháng" min="1" max="12" required> <input
				class="form-control nhapdate nam" type="number" name="namtk"
				placeholder="Năm" min="1990" max="2030" required>
		</div>
		<div class="input-group mb-3"
			style="margin-bottom: 15px;">
             <span class="input-group-text" id="basic-addon1">Ngày KQSX</span>
			<input class="form-control nhapdate ngay" type="number"
				placeholder="Ngày" min="1" max="31" name="ngaykq" required> <input	class="form-control nhapdate thang " name="thangkq" type="number"
				placeholder="Tháng" min="1" max="12"required> <input
				class="form-control nhapdate nam" type="number" name="namkq"
				placeholder="Năm" min="1990" max="2030" required>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Số Tìm Kiếm</span>
			<input type="number" class="form-control giai" max="1000000"
				aria-describedby="basic-addon1" placeholder="5-6 Số" name="sotimkiem" required>
		</div>
		<div class="d-grid gap-2 d-md-flex col-1 mx-auto">
			<input class="btn btn-primary" type="submit" value="Thêm"> <input
				class="btn btn-primary" type="reset" value="Xóa nhập">
			<button class="btn btn-primary">
				<a href="${pageContext.request.contextPath}/manage.jsp">Hủy</a>
			</button>
		</div>
	</form>

</div>


</body>
</html>