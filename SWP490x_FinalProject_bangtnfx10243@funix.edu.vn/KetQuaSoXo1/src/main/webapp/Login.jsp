<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
body {
	background-image:
		url('${pageContext.request.contextPath}/Image/banner1.jpg');
}
</style>
<title>Login KQSX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/css/styleLogin.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Classy Login form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!--header start here-->
	<div class="header">
		<div class="header-main">
			<h1>Login KQSX</h1>
			<% String mess =(String) request.getAttribute("mess") ;
			   if(mess != null){
			%>		
			<p><%=mess %></p>
			<%} %>
			<div class="header-bottom">
				<div class="header-right w3agile">

					<div class="header-left-bottom agileinfo">

						<form action="${pageContext.request.contextPath}/ControllerLogin" method="post">
							<input type="email"  name="user" placeholder="UserName"							
								required > <input type="password" placeholder="PassWord"
								name="password" 
								required >
							<div class="remember">
								<span class="checkbox1"> <label class="checkbox"><input
										type="checkbox" name="a" value="a" checked><i> </i>Remember
										me</label>
								</span>
								<div class="forgot">
									<h6>
										<a href="${pageContext.request.contextPath}/forgotPass.jsp">Forgot Password?</a>
									</h6>
								</div>
								<div class="clear"></div>
							</div>

							<input type="submit" value="Login">
						</form>
						<div class="header-left-top">
							<div class="sign-up"></div>

						</div>
						<div class="forgot">
							<h6>
								<a href="${pageContext.request.contextPath}/register.jsp">Register</a>
							</h6>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<!--header end here-->
	<div class="copyright">
		<p>Ngàn lần nhứ ý – Vạn sự như mơ</p>
	</div>
	<!--footer end here-->
</body>
</html>