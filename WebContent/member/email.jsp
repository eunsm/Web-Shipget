<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증</title>
<style>
	div,input{
		font-family:"a시네마M";
	}
</style>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<script src="dist/sweetalert.min.js"></script>
<script>
	function check()
	{
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value)
		{
			 swal({
	    		  title: "인증번호를 입력해주세요",
	    		  confirmButtonText: "확인",
	    		  type : "warning"
	    		  }); 
			return false;
		}
		if(form.authnum.value!=authNum)
		{
			swal({
	    		  title: "틀린 인증번호 입니다. 인증번호를 다시 입력해주세요",
	    		  confirmButtonText: "확인",
	    		  type : "error"
	    		  }); 
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum)
		{
			swal({
	    		  title: "인증완료",
	    		  confirmButtonText: "확인",
	    		  type : "success"
	    		  }); 
			opener.document.form.check.value="인증완료";
			opener.document.form.emailChk.value="Y";
			window.open("about:blank","_self").close();
		}
	}
</script>
</head>
<body>
<div class="login-page">
		<div class="container"> 
			<h4 class="w3ls-title w3ls-title1">인증번호 7자리를 입력하세요</h4>
			<br>  
			<div class="login-body">
				<form method="post" name="authenform" onsubmit="return check();">
					<input type="text" class="user" name="authnum" placeholder="인증번호" required="">
					<input type="submit" value="확인">
				</form>
			</div>  
		</div>
	</div>
</body>
</html>