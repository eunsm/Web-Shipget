<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
<style>
	.emailcheck
	{
		border: none;
		border-bottom:0px;
		border-left : 0px;
		border-top:0px;
		border-right:0px;
		margin-top:2%;
		font-size: 1em;
		color:#f44336;
	}
</style>
<link href="css/loginstyle.css?ver=8" rel="stylesheet" type="text/css" media="all" /> 
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="dist/sweetalert.min.js"></script>
<script>
	function popup()
	{
			 var email = document.getElementById("email").value; 
			document.getElementById("frmemail").value= email;
			window.open('', 'POP','width=500, height=400, left=500, top=300');
			var check=document.form2;
			check.action='email.eun';
			check.target='POP';
			check.submit();
	}
	
	function idcheck()
	{
		var prmId = $('#id').val();
		  
		  if($("#id").val() == '')
		  {
			  swal({
    		  title: "아이디를 입력해주세요",
    		  confirmButtonText: "확인",
    		  type : "warning"
    		  }); 
			  return;
		  }
		  
			  $.ajax({
			     type : 'POST',  
			     data:"prmId="+ prmId,
			     dataType : 'text',
			     url : 'idcheck.eun',  
			     success : function(rData, textStatus, xhr) {
			      var chkRst = rData;
			      if(chkRst == 0){
			    	  swal({
			    		  title: "사용가능한 아이디 입니다.",
			    		  confirmButtonText: "확인",
			    		  type : "success"
			    		});
			       $("#idChk").val('Y');
			       $("#idcheck").val('사용가능한 아이디');
			      }else{
			    	  swal({
			    		  title: "중복된 아이디 입니다.",
			    		  confirmButtonText: "확인",
			    		  type : "error"
			    		});
			       $("#idChk").val('N');
			       $("#id").val('');
			      }
			     },
			     error : function(xhr, status, e) {  
			    	 swal({
			    		  title: e,
			    		  confirmButtonText: "확인",
			    		  type : "error"
			    		});
			     }
			  });  
	}
	
</script>
<script>
function insertChk(frm)
{	  
	  /* if(!chkVal('id','아이디'))return false; */
	  if($("#idChk").val() == 'N')
	  {
		  swal({
		  title: "아이디 중복검사 해주세요",
		  confirmButtonText: "확인",
		  type : "warning"
		}); 
		return false;
	  }
	  if($("#emailChk").val() == 'N')
	  {
		  swal({
		  title: "이메일 인증을 해주세요",
		  confirmButtonText: "확인",
		  type : "warning"
		}); 
		return false;
	  }
	  
	  if(frm.pw.value!=frm.pwcheck.value)
      {
		  swal({
			  title: "비밀번호가 맞지 않습니다.",
			  confirmButtonText: "확인",
			  type : "warning"
			}); 
         obj.password.value="";
         obj.repassword.value="";
         obj.password.focus();
         return false;
      }
	  return true;
}
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
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">회 원 가 입</h3>  
			<div class="login-body">
				<form name="form" method="post" action="signproc.eun" id="form" onsubmit="return insertChk(this);">
					<input type="text" class="user" id="id" name="id" placeholder="아이디" required="">
					<label class="checkbox" onclick="idcheck()">아이디 중복 검사</label>
					<input type="hidden" id="idChk" value="N" />
					<input class="emailcheck" id="idcheck" readonly="readonly"/>
					<input type="password" name="pw" class="lock" placeholder="비밀번호" required="">
					<input type="password" name="pwcheck" class="lock" placeholder="비밀번호 확인" required="">
					<input type="text" class="user" name="name" placeholder="이름" required="">
					<input type="text" class="user" name="phone" placeholder="연락처 예)010-1234-5678" required="">
					<table >
						<colgroup>
							<col style="width:20%"><col>
						</colgroup>
						<tbody>
							<tr>
								<td>
								    <input type="hidden" id="confmKey" name="confmKey" value=""  >
									<input type="text" id="zipNo" name="zipNo" class="user" readonly style="width:73%" placeholder="우편번호">
									<input type="button" id="juso" value="주소검색" onclick="goPopup();">
								</td>
							</tr>
							<tr>
								<td><input type="text" id="roadAddrPart1" name="address1" readonly placeholder="도로명주소"></td>
							</tr>
							<tr>
									<td>
										<input type="text" id="addrDetail" name="addrdetail" class="user" value="" placeholder="상세주소">
										<input type="text" id="roadAddrPart2" name="address2" value=""  readonly placeholder="참고항목">
									</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" id="emailChk" name="emailChk" value="N" />
					<input type="email" class="user" id="email" name="email" placeholder="이메일" required="">
					<label class="checkbox" onclick="popup();">이메일 인증</label>
					<input class="emailcheck" name="check" readonly="readonly"/>
					<input type="submit" value="회원가입">
				</form>
			</div>  
			<h6>이미 회원이라면 <a href="login.eun">로그인 하러 가기 »</a> </h6>
		</div>
	</div>
	<form method="post" name="form2">
		<input type="hidden" name="email" id="frmemail"/>
	</form>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>