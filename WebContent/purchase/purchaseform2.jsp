<%@page import="kr.co.eun.vo.MemberVO"%>
<%@page import="kr.co.eun.dao.MemberDAO"%>
<%@page import="kr.co.eun.vo.PurchaseVO"%>
<%@page import="kr.co.eun.dao.PurchaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css?ver=2" rel="stylesheet" type="text/css" media="all" />
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css=?ver=1" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link href="css/loginstyle.css?ver=1" rel="stylesheet" type="text/css" media="all" /> 
<script>
 new WOW().init();
</script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	PurchaseDAO dao = new PurchaseDAO();
	PurchaseVO vo = dao.getBoard(no);
	String id = vo.getId();
	MemberDAO mdao = new MemberDAO();
	MemberVO mvo = mdao.getMember(id);
	
	String sessionid = (String)session.getAttribute("id");
	MemberVO gvo = mdao.getMember(sessionid);
%>
<script type="text/javascript">
	$(document).ready(function(){
		var count = $('#buy').val();
		var total = count*<%=vo.getPrice() %>;
		alert(total);
		$('#price').val(total);
	})
	
	$(function() {
	    $('#price').keyup(function (e){
	    	var count = $('#buy').val();
			var total = count*<%=vo.getPrice() %>;
			alert(total);
			$('#price').val(total);	
	    })
	 })
</script>
	구매 신청서
			<form action="loginproc.eun" method="post">
				
				상품 정보
					<input type="text" class="user" name="title" value="<%=vo.getTitle() %>" required="">
					구매 수량 : <input type="number" name="buy" id="buy" min="1" max="<%=vo.getNowquan() %>">
					금액 : <input type="text" id="price" name="price" />
			
				판매자 정보
					이름 : <input type="text" class="user" name="name" value="<%=vo.getWriter() %>" required="">
					전화번호 : <input type="text" class="user" name="tel" value="<%=mvo.getPhone()%>" required="">
					<input type="hidden" name="fid" class="user" value="<%=vo.getId() %>" required="">
					입금 은행 : <input type="text" class="user" name="name" value="<%=vo.getWriter() %>" required="">
					계좌번호 : <input type="text" class="user" name="name" value="<%=vo.getWriter() %>" required="">
			
				구매자 정보
					아이디 : <input type="text" class="user" name="gid" placeholder="아이디" value="<%=sessionid %>" required="">
					이름 : <input type="text" class="user" name="gname" value="<%=gvo.getName() %>" required="">
					전화번호 : <input type="text" class="user" name="gtel" value="<%=gvo.getName() %>" required="">
					우편번호 : <input type="text" class="user" name="zip" value="<%=gvo.getZipNo()%>" required="">
					주소 : <input type="text" class="user" name="address1" value="<%=gvo.getAddress1() %>" required="">
					상세주소 : <input type="text" class="user" name="detail" value="<%=gvo.getAddrdetail()%> <%=gvo.getAddress2() %>" required="">
			
				<input type="submit" value="구매하기">   
			</form>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>