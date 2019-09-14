<%@page import="kr.co.eun.vo.MemberVO"%>
<%@page import="kr.co.eun.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css?ver=2" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

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
<script type="text/javascript" src="<%=request.getContextPath() %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<!-- <script type="text/javascript" src="js/fileupload.js"></script> -->
<script type="text/javascript"> 
	var oEditors = []; 
	$(function(){ 
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef: oEditors, 
			elPlaceHolder: "ir1", //SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "SE2/SmartEditor2Skin.html",	
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true,	
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : true,	
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true,	fOnBeforeUnload : function(){
				} 
			}, 
			fOnAppLoad : function(){ 
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
				oEditors.getById["ir1"].exec("PASTE_HTML", [""]); 
			}, 
			fCreator: "createSEditor2" 
		}); 
		$("#save").click(function(){
	          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#frm").submit();
	    });   
	}); 
</script>
<style type="text/css">
	input[type="text"]{
		margin-bottom: 2%;
		width: 77%;
	}
	input[type="button"],input[type="submit"]{
		border: none;
	    outline: none;
	    cursor: pointer;
	    color: #fff;
	    background: #F06464;
	    width: 5%;
	    padding: .8em 1em;
	    font-size: 1em;
	    margin: 0.5em 0 0;
	    -webkit-transition:.5s all;
		-moz-transition:.5s all;
		-o-transition:.5s all;
		-ms-transition:.5s all;
		transition:.5s all;
	    text-transform: uppercase;
		-webkit-appearance:none;
	}
	input[type="button"]:hover,input[type="submit"]:hover{
		 background: #B7A4EE;
	}
</style>
<script>
/* function check() {
	var form = document.frm;
	
	if (!form.title.value) {
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}

/* 	if (!form.content.value) {
		alert("내용을 적어주세요");
		form.content.focus();
		return;
	}
	 */
	//form.submit();
//}	
</script>
<script src="../src/jquery.ae.image.resize.js"></script>
<%
	String id = (String)session.getAttribute("id");
	System.out.println(id);
	if(id==null)
	{
%>	
		<script>
			swal({
		   		  title: "로그인 해주세요",
		   		  confirmButtonText: "확인",
		   		  type : "warning"
			},
			function(){
			location.href="login.eun";				
		   	}); 
</script>
</head>  
<body>
<jsp:include page="../include/top.jsp"/>
<%
	String id = (String)session.getAttribute("id");
	String type=request.getParameter("type");
	MemberDAO dao =  new MemberDAO();
	MemberVO vo = dao.getMember(id);
%>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">공동구매</li>
			</ol>
		</div>
	</div>
	<div class="products">
		<div class="container">
			<form id="frm" name="frm" action="pwriteproc.eun" method="post" enctype="multipart/form-data" onsubmit="imgSizeConv()"> 
				<table width="100%"> 
					<tr> 
						<td>작성자</td> 
						<td><input type="text" id="name" name="writer" value="<%=vo.getName() %>" readonly="readonly"/>
						<input type="hidden" name="id" value="<%= id %>"/>
						</td> 
					</tr>
					<tr> 
						<td>분야</td> 
						<td>
							<select name="type">
									<option value="p<%=type %>" style="color: red;" selected="selected"><%=type %></option>
									<option value="pBeauty">Beauty</option>
									<option value="pBook&Music">Book &amp; Music</option>
									<option value="pElectronic equipment">Electronic equipment</option>
									<option value="pFashion">Fashion</option>
									<option value="pGame&Toy">Game &amp; Toy</option>
									<option value="pLiving">Living</option>
									<option value="pETC">ETC</option>
							</select>
						</td> 
					</tr> 
					<tr> 
						<td>제목</td> 
						<td><input type="text" id="title" name="title"/></td> 
					</tr>
					<tr> 
						<td>수량</td> 
						<td><input type="number" name="quantity"/>개</td> 
					</tr>
					 <tr> 
						<td>가격</td> 
						<td><input type="text" name="price" placeholder="예)30000" maxlength="15">원</td> 
					</tr>
					<tr> 
						<td>구매진행<br>기간</td> 
						<td><input type="datetime-local" name="enddate"></td> 
					</tr>
					<tr> 
						<td>내용</td> 
						<td> <textarea rows="10" cols="30" id="ir1" name="content" style="width:766px; height:412px; "></textarea> </td> 
					</tr> 
					<tr> 
						<td>입금 은행</td> 
						<td><input type="text" id="bank" name="bank"/></td> 
					</tr>
					<tr> 
						<td>계좌번호</td> 
						<td><input type="text" id="accountno" name="accountno"/></td> 
					</tr>
					<tr>
						<td>대표<br>이미지</td>
						<td><input type="file" name="files" size="35" id="imageid"/></td>
					</tr>
					<tr> 
						<td colspan="2"> <input type="submit" id="save" value="등록"/> <input type="button" value="취소" onclick="history.go(-1)"/> </td> 
					</tr> 
				</table> 
			</form>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>