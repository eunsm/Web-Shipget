<%@page import="java.util.List"%>
<%@page import="kr.co.eun.vo.DreplyVO"%>
<%@page import="kr.co.eun.vo.MemberVO"%>
<%@page import="kr.co.eun.dao.MemberDAO"%>
<%@page import="kr.co.eun.vo.DemandVO"%>
<%@page import="kr.co.eun.dao.DemandDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 보기</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css?ver=2" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link rel="stylesheet" href="css/readstyle.css?ver=1"/>
<link rel="stylesheet" href="css/rly.css"/>
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="dist/sweetalert.min.js"></script>
<script>
function check()
{
	var like = $('#heart').text();
	var no = $('#no').val();
	
 	if($("#likechk").val()=="Y")
	{
		swal({
			  title: "이미 누르셨습니다.",
			  confirmButtonText: "확인",
			  type : "warning"
			}); 
		return;
	}

		  $.ajax({
		     type : 'POST',  
		     data:"like="+ like+"&no="+no,
		     dataType : 'text',
		     url : 'uplike.eun',  
		     success : function(rData, textStatus, xhr) {
		      var chkRst = rData;
		       $("#heart").text(chkRst);
		       $("#likechk").val('Y');
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

/* function reply()
{
	var reply = $('#eucontent').val();
	var writer = $('#rewriter').text();
	var pno = $('#no').val();
	jQuery.ajaxSettings.traditional = true;

		  $.ajax({
		     type : 'POST',  
		     data:"pno="+pno+"&content="+ reply+"&writer="+writer,
		     dataType : 'text',
		     url : 'reply.eun',  
		     success : function(rData, textStatus, xhr) {
		      var chkRst = rData;
		     /*  var data = chkRst.split(",");
		       $("#w").text(data[0]);
		       $("#c").text(data[1]);
		       $("#d").text(data[2]); */
	/* 	     },
		     error : function(xhr, status, e) {  
		    	 swal({
		    		  title: e,
		    		  confirmButtonText: "확인",
		    		  type : "error"
		    		});
		     }
		  });   */
//}
</script>
<script>
	$(function() {
	    $('#eucontent').keyup(function (e){
	        var content = $(this).val();
	        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	        $('#eucounter').html(content.length + '/300');
	    });
	    $('#eucontent').keyup();
	});
</script>
<script>
 new WOW().init();
</script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String nowPage = "1";
	if (request.getParameter("nowPage") != null)
	{
		nowPage = request.getParameter("nowPage");
	}
	String type=request.getParameter("type");
	String listpage = type+".eun";
	String id = (String)session.getAttribute("id"); 
	
	DemandDAO dao = new DemandDAO();
	DemandVO vo =  dao.getBoard(no);
	dao.upCount(no);
%>
<script>
	function list2()
	{
		document.listFrm.action ="<%=listpage %>";
		document.listFrm.submit();
	}
	function update()
	{
		document.updateFrm.action = "update.eun";
		document.updateFrm.submit();
	}
	function delete2()
	{
		swal({
			  title: "삭제하시겠습니까?",
			  text: "한번 지운글을 되돌릴 수 없습니다.",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "삭제",
			  cancelButtonText: "아니요",
			  closeOnConfirm: false
			},
			function(){
				document.deleteFrm.action = "delete.eun";
				document.deleteFrm.submit();
			  swal("삭제 되었습니다", "", "success");
			});
	}
	
	function replydelete(no)
	{
		var reno = no;
		swal({
			  title: "삭제하시겠습니까?",
			  text: "한번 지운글을 되돌릴 수 없습니다.",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "삭제",
			  cancelButtonText: "아니요",
			  closeOnConfirm: false
			},
			function(){
				document.rlydelFrm.reno.value=reno;
				document.rlydelFrm.action = "replydelete.eun";
				document.rlydelFrm.submit();
			  swal("삭제 되었습니다", "", "success");
			});
	}
</script>
<input type="hidden" value="<%= no %>" id="no"/>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">수요조사</li>
			</ol>
		</div>
	</div>
	<%
		int b = dao.getCount("Beauty");
		int bm = dao.getCount("Book&Music");
		int e = dao.getCount("Electronic equipment");
		int f = dao.getCount("Fashion");
		int g = dao.getCount("Game&Toy");
		int l = dao.getCount("Living");
		int etc = dao.getCount("ETC");
	%>
	<div class="products">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="categories animated wow slideInUp" data-wow-delay=".2s">
					<h3>Categories</h3>
					<ul class="cate">
						<li><a href="Beauty.eun">Beauty</a><span>(<%= b %>)</span></li>
						<li><a href="Book&Music.eun">Book &amp; Music</a><span>(<%= bm %>)</span></li> 
						<li><a href="Electronic equipment.eun">Electronic equipment</a><span>(<%= e %>)</span></li> 
						<li><a href="Fashion.eun">Fashion</a><span>(<%= f %>)</span></li>
						<li><a href="Game&Toy.eun">Game &amp; Toy</a><span>(<%= g %>)</span></li>
						<li><a href="Living.eun">Living</a><span>(<%= l %>)</span></li>
						<li><a href="ETC.eun">ETC</a><span>(<%= etc %>)</span></li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 products-right">
				<div class="products-right-grid">
					<table class="table" width="100%"> 
					<tr> 
						<td><font color="#000">작성자</font></td> 
						<td><font color="#000"><%= vo.getWriter() %><font color="#000"></td> 
					</tr>
					<tr> 
						<td><font color="#000">분야</font></td> 
						<td><font color="#000"><%= vo.getType() %><font color="#000"></td> 
					</tr>
					<tr> 
						<td><font color="#000">제목</font></td> 
						<td><font color="#000"><%= vo.getTitle() %><font color="#000"></td> 
					</tr>
					<tr> 
						<td><font color="#000">내용</font></td> 
						<td>
							<pre><%= vo.getContent() %></pre>
						</td> 
					</tr>
					<tr>
						<td></td>
						<td>
							<table>
								<tr>
									<td>
										<% String flag = dao.getLike(id, no);%>
										<div class="heart-shape" onclick="check()"></div>
										<input type="hidden" id="likechk" value="<%= flag %>">					
									</td>
									<td><label id="heart"><%= vo.getLikes() %></label></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><font color="#F06464">마음에 드신다면 하트를 눌러주세요</font></td>
					</tr>
					<tr> 
						<td></td>
						<td><input type="button" value="목록으로" onclick="list2()"/> 
						<% 
							if(id.equals(vo.getId()))
							{
						%>
						<input type="button" id="save" value="수정" onclick="update()"/> <input type="button" value="삭제" onclick="delete2()"/>
						<%
							}
						%>
						</td> 
					</tr> 
				</table>
			<form action = "replyproc.eun" method="post" name="rlyfrm">
				<table class="table" width="100%" style="border-spacing: 0px;">
					 <tr>
					 	<td colspan="2"><font color="#000">댓글</font></td>
					 </tr>
					 <%

						MemberDAO mdao =  new MemberDAO();
						MemberVO mvo = mdao.getMember(id);
						
					 %>
					 <tr>
					 	<td id="rewriter"><%=mvo.getName() %><input type="hidden" name="writer" value="<%=mvo.getName() %>"></td>
					 </tr>
					 <tr>
					 	<td>
					 	<input type="hidden" name="pno" value="<%=no%>">
						 	<div class="euwrap">
							 	<textarea id="eucontent" name="content" maxlength="300"></textarea>
							 	<span id="eucounter">###</span>
							 </div>
							 <input type="hidden" name="id" value="<%=id %>"> 
							 <input type="hidden" name="no" value="<%=no %>"> 
							 <input type="hidden" name="nowPage" value="<%=nowPage%>">
							 <input type="hidden" name="type" value="<%=type%>"> 
						 </td>
					 	<td><input type="submit" id="rebtn" value="확인"/></td>
					 </tr>
				</table>
			</form>
			<!-- <a id="start"></a> -->
				<table id="start" class="table" width="100%">
				<%
					List<DreplyVO> replylist = dao.getreplyList(no);
					for(DreplyVO reply:replylist){
						
						String regdate = reply.getRegdate();
						regdate = regdate.substring(0,10);
				%>
					<tr>
						<td><font color="#000"><%=reply.getWriter() %></font></td>
						<td width="50%"><font color="#000"><%= reply.getContent() %></font></td>
						<td>
							<font color="#000"><%= regdate %></font>
							<% 
								if(id.equals(reply.getId()))
								{
							%>
							<a href="javascript:replydelete('<%=reply.getNo() %>')" style="text-decoration: none; color: red;">X</a>
							<%  }  %>
						</td>
					</tr>
				<%			
					}
				%>
				</table>
				<div id="end"></div>
				<!-- <a id="end"></a> -->
				</div>
			</div>
		</div>
	</div>
	<form name="listFrm" method="get">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="updateFrm" method="get">
			<input type="hidden" name="no" value="<%=no %>"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<%-- <input type="hidden" name="type" value="<%=type%>"> --%>
	</form>
	<form name="deleteFrm" method="get">
			<input type="hidden" name="no" value="<%=no %>"> 
			<input type="hidden" name="type" value="<%=type%>"> 
	</form>
	<form name="rlydelFrm" method="get">
			<input type="hidden" name="reno"> 
			<input type="hidden" name="no" value="<%=no %>"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="type" value="<%=type%>"> 
	</form>
<script src="js/bootstrap.js"></script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>