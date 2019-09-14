<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<script src="dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		swal({
			  title: "다른 사람의 댓글이 있어서 삭제할 수 없습니다. ",
			  confirmButtonText: "확인",
			  type : "error"
			});
		history.back(-1);
	</script>
</body>
</html>