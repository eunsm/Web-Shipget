<%@page import="kr.co.eun.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=5" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<link href="css/loginstyle.css?ver=1" rel="stylesheet" type="text/css" media="all" /> 
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<script src="dist/sweetalert.min.js"></script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<%
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		String id = dao.findid(name, phone, email);
		if(id==null)
		{
%>
	<div class="login-page" style="margin-top : 5%; margin-bottom: 5%;">
		<div class="container">   
			<div class="login-body">
				일치하는 정보가 없습니다.
			<h6><a href="finidw.eun">되돌아가기 »</a> </h6> 
			<h6> 아직 회원이 아니라면 <a href="signup.eun">회원가입하러 가기 »</a> </h6> 
			</div>  
		</div>
	</div>
<%
		}
		else
		{
%>
	<div class="login-page" style="margin-top : 5%; margin-bottom: 5%;">
		<div class="container">   
			<div class="login-body">
				아이디는 <%= id %> 입니다. 
			<h6><a href="findpw.eun">비밀번호 찾으러 가기 »</a> </h6> 
			<h6><a href="login.eun">로그인 하러 가기 »</a> </h6> 
			</div>  
		</div>
	</div>
<%
		}
%>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>