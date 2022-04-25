
$(document).ready(function() {
	$("#remove").click(function() {
		$(".remove").toggle();
	});
	$("#aply").click(function() {
		$("#xoa").show();
	});
	$("#huy").click(function() {
		$("#xoa").hide();
	});
});
$(document).ready(function() {
	$("#cn").click(function() {
		$(".capnhat").toggle();
	});
	$("#bcn").click(function() {
		$("#capnhat").show();
	});
	$("#khong").click(function() {
		$("#capnhat").hide();
	});
});
$(document).ready(function() {
	$("#cn").click(function() {
		$(".capnhat").toggle();
	});
	$("#bcn").click(function() {
		$("#capnhat").show();
	});
	$("#khong").click(function() {
		$("#capnhat").hide();
	});
});



function kiemtra() {
	//Kiểm tra nhập thông tin vùng
	var vung = document.getElementsByClassName("vung")[0].value.length;
	if (vung == 0) {
		window.alert("Chưa nhập thông tin vùng");
		return;
	}

	//Kiểm tra ngày tháng năm
	var ngay = document.getElementsByClassName("ngay")[0].value;
	var thang = document.getElementsByClassName("thang")[0].value;
	var nam = document.getElementsByClassName("nam")[0].value;
	if (ngay < 1 || ngay > 31) {
		window.alert("Nhập sai ngày tháng năm ");
		return;
	}
	if (thang < 1 || thang > 12) {
		window.alert("Nhập sai ngày tháng năm ");
		return;
	}
	if (nam < 1990 || ngay > 2030) {
		window.alert("Nhập sai ngày tháng năm ");
		return;
	}

	//Kiểm tra nhập đủ số giải
	for (var i = 0; i < 7; i++) {
		var sogiai = document.getElementsByClassName("giai")[i].value.length;
		if (sogiai != 5 && sogiai != 6) {
			if (i == 0) {
				window.alert("Nhập sai số lượng giải đặc biệt");
				return;
			}
			window.alert("Nhập sai số lượng giải " + i);
			return;
		}
		if (sogiai == 0) {
			if (i == 0) {
				window.alert("Nhập thiếu giải đặc biệt");
				return;
			}
			window.alert("Nhập thiếu giải " + i);
			return;
		}
	}
	window.location = "http://localhost:8080/KetQuaSoXo/manage.jsp";

}