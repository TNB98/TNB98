<%@page import="PRJO.ketquasoxo"%>
<%@page import="Dao.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="Head.jsp"></c:import>

<%
String mess = (String) request.getAttribute("mess");
if (mess != null) {
%>
$(document).ready(function() { $("#thongbaoxoa").show();
$("#oke").click(function() { $("#thongbaoxoa").toggle(); }); });
<%
}
%>

<div class="mess" id="thongbaoxoa">
	<div class="thongbao">
		<p><%=request.getAttribute("mess")%></p>
		<button id="oke">Oke</button>

	</div>
</div>



<%
Database data = new Database();
ketquasoxo[] kq = data.soxo();
String msx1 = (String) request.getParameter("msx");
int msx = 0;
if (msx1 != null) {
	msx = Integer.parseInt(msx1);
}
int j = 0;
for (int i = 0; i < kq.length; i++) {
	if (msx == kq[i].getMasoxo()) {
		j = i;
	}
}
%>

<div class="main">
	<form action="${pageContext.request.contextPath}/test" method="post">
		<input type="hidden" name="add" value="1"> <input
			type="hidden" name="capnhat" value="1"> <input type="hidden"
			name="Masoxo" value="<%=kq[j].getMasoxo()%>">
		<div class="input-group mb-3">
			<input type="hidden" name="add" value="1"> <label
				for="exampleDataList" class="form-label">Vùng</label> <input
				class="form-control vung" list="datalistOptions"
				id="exampleDataList" style="margin-bottom: 15px;" name="vung" value="<%=kq[j].getVung()%>">
			<datalist id="datalistOptions">
				<option value="Miền Bắc">
				<option value="Miền Trung">
				<option value="Miền Nam">
			</datalist>
		</div>
		<label for="exampleDataList" class="form-label">Thành Phố</label> <input
			class="form-control tp" list="thanhpho" id="exampleDataList" value="<%=kq[j].getThanhpho()%>"
			style="margin-bottom: 15px;" name="tp">
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
		<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Ngay</span> <input
						type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số" name="ngay"
						value="<%=kq[j].getNgay()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Đặc Biệt</span>
			<input type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số" name="gdb"
						value="<%=kq[j].getGiaidb()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Nhất</span> <input
						name="g1" type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số"
						value="<%=kq[j].getGiai1()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Nhì</span> <input
						name="g2" type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số"
						value="<%=kq[j].getGiai2()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Ba</span> <input
						name="g3" type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số"
						value="<%=kq[j].getGiai3()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Bốn</span> <input
						name="g4" type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số"
						value="<%=kq[j].getGiai4()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Năm</span> <input
						name="g5" type="text" class="form-control giai"
						aria-describedby="basic-addon1" placeholder="5-6 Số"
						value="<%=kq[j].getGiai5()%>">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Sáu</span> <input
						value="<%=kq[j].getGiai6()%>" name="g6" type="text"
						class="form-control giai" aria-describedby="basic-addon1"
						placeholder="5-6 Số">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">Giải Bảy</span> <input
						value="<%=kq[j].getGiai7()%>" name="g7" type="text"
						class="form-control giai" aria-describedby="basic-addon1"
						placeholder="5-6 Số">
		</div>
		<div class="d-grid gap-2 d-md-flex col-1 mx-auto">
			<input class="btn btn-primary" type="submit" value="Cập Nhật"> <input
						class="btn btn-primary" type="reset" value="Nhập Lại">
				<button class="btn btn-primary">
						<a href="${pageContext.request.contextPath}/manage.jsp">Hủy</a>
					</button>
		</div>
	
			</form>

</div>


</body>
</html>