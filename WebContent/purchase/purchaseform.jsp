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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" type="text/css" href="css/pstyle.css?ver=8" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
 new WOW().init();
</script>
<script>
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("jusoPopup.eun","pop","width=570,height=500, left=500, top=300, scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	PurchaseDAO dao = new PurchaseDAO();
	PurchaseVO vo = dao.getBoard(no);
	String id = vo.getId();
	MemberDAO mdao = new MemberDAO();
	MemberVO mvo = mdao.getMember(id);
	
	String sessionid = (String)session.getAttribute("id");
	MemberVO gvo = mdao.getMember(sessionid);
	System.out.println("***"+vo.getPrice());
	String price = vo.getPrice().trim();
	System.out.println("@@@"+price);
	price = price.replace(",","");
	System.out.println("///"+price);
%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
$('#price').click(function (e){
	var count = $('#buy').val();
	var total = count*<%=price %>;
	alert(total);
	$('#price').val(total);	
})
})
</script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">공동구매</li>
				<li class="active">구매 신청서</li>
			</ol>
		</div>
	</div>
<br><br><br><br>
<div id="eunwrap">
	<div id="grid">
		<div class="euncolumn column1">
			<div class="step" id="step1">
				<div class="number">
					<span>1</span>
				</div>
				<div class="title">
					<h2>상품 정보</h2>
				</div>
				<div class="modify">
					<i class="fa fa-plus-circle"></i>
				</div>
			</div>
			<div class="content" id="email">
				<form class="go-right">
					<div>
					<p>상품명</p>
			        	<font size="1pt"><input type="text" name="product" value="<%=vo.getTitle() %>" id="product" data-trigger="change"  data-required="true"/><label for="last_name"></label></font>
			        </div>
			        <span><p>수량</p>
		        	<font size="1pt"><input type="number" name="buy" id="buy" min="1" max="<%= vo.getQuantity()- vo.getNowquan() %>" placeholder="구매 수량" data-trigger="change" data-required="true" data-error-message="수량을 확인 하세요"/></font></span>
		        	<span><p>금액</p>
					<font size="1pt"><input type="text" name="price" id="price" value=""  placeholder="금액" data-trigger="change"  data-required="true" data-error-message="금액을 확인 하세요"/></font></span>		        
				</form>
			</div>
		</div>
		<div class="euncolumn column2">
			<div class="step" id="step2">
				<div class="number">
					<span>2</span>
				</div>
				<div class="title">
					<h2>판매자 정보</h2>
				</div>
			</div>
			<div class="content" id="address">
				<form class="go-right">
					<div>
						<font size="1pt"><input type="text" name="name" value="<%=vo.getWriter() %>" id="first_name" data-trigger="change"  data-required="true" /><label for="last_name">이름</label></font>
	        			<input type="hidden" name="fid" value="<%=vo.getBank() %>" required="">
	        		</div>
					<div>
						<font size="1pt"><input type="text" name="tel" value="<%=mvo.getPhone() %>" data-trigger="change"  data-required="true" /><label for="last_name">전화번호</label></font>
					</div>
					<div>
						<font size="1pt"><input type="text" name="bank" value="<%=vo.getBank() %>" data-trigger="change"  data-required="true" /><label for="telephone">입금은행</label></font>
					</div>
					<div>
						<font size="1pt"><input type="text" name="account" value="<%=vo.getAccountno() %>" data-trigger="change"  data-required="true"/><label for="Address">계좌번호</label></font>
					</div>
				</form>
			</div>
	 	</div>
	 	<div class="euncolumn column3">
			<div class="step" id="step3">
				<div class="number">
					<span>3</span>
				</div>
				<div class="title">
					<h2>구매자 정보</h2>
				</div>
				<div class="modify">
					<i class="fa fa-plus-circle"></i>
				</div>
			</div>
			<div class="content" id="q">
			<form class="go-right" id="form" name="form" method="post">
	        		<div>	
	        			<input type="hidden" name="gid" value="<%=sessionid %>" required="">
	        			<font size="1pt"><input type="text" name="gname" value="<%=gvo.getName() %>" ><label for="last_name">이름</label></font>
	        		</div>
					<div>
						<font size="1pt"><input type="text" name="gtel" value="<%=gvo.getPhone() %>" data-trigger="change"  data-required="true" /><label for="last_name">전화번호</label></font>
					</div>
					<div>
						<font size="1pt"><input type="text" id="zipNo" name="zipNo" value="<%=gvo.getZipNo() %>" data-trigger="change"  data-required="true" /><label for="telephone">우편번호</label></font>
					</div>
						<font size="1pt"><button class="login" id="juso" onclick="goPopup();">주소검색</button></font>
					<div>
						<font size="1pt"><input type="text" name="address1"  id="roadAddrPart1" value="<%=gvo.getAddress1() %>" data-trigger="change"  data-required="true"/><label for="Address">주소</label></font>
					</div>
					<div>
						<font size="1pt"><input type="text" name="addrdetail" id="addrDetail" value="<%= gvo.getAddrdetail() %>" data-trigger="change"  data-required="true"/><label for="Address">상세주소</label></font>
					</div>
					<input type="hidden" name="product" value="<%=vo.getTitle() %>">
					<input type="hidden" name="buy" id="buy" value="<%=vo.getNowquan() %>">
					<input type="hidden" name="price" id="price" value="">
					<input type="hidden" name="name" value="<%=vo.getWriter() %>">
					<input type="hidden" name="fid" value="<%=vo.getBank() %>" required="">
					<input type="hidden" name="tel" value="<%=mvo.getPhone() %>">
					<input type="hidden" name="bank" value="<%=vo.getBank() %>">
					<input type="hidden" name="account" value="<%=vo.getAccountno() %>">
			</form>
			<br>
				<input type="submit" value="제출"/>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>