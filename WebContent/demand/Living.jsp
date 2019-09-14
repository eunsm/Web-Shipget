<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.eun.vo.DemandVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.eun.dao.DemandDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Living</title>
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
<script src="dist/sweetalert.min.js"></script>
<script>
 new WOW().init();
</script>
<style type="text/css">
	#the{
	 color : #000;
	}
</style>
</head>
<body>
<jsp:include page="../include/top.jsp"/>

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
<%
	}

	int totalRecord = 0; 
	int numPerPage = 15; 
	int pagePerBlock = 5; 
	int totalPage = 0; 
	int totalBlock = 0; 
	int nowPage = 1; 
	int nowBlock = 1; 
	
	int start = 0; 
	int end = 15; 
	
	int listSize = 0; 
	
	int pageStart = 0; 
	int pageEnd = 0; 
	
	
	if (request.getParameter("nowPage") != null) 
	{
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	
	DemandDAO dao = new DemandDAO();
	totalRecord = dao.getCount("Living");
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

%>
<script type="text/javascript">
function read(no) {
	  document.readFrm.no.value = no;
	  document.readFrm.action = "read.eun";
	  document.readFrm.submit();
	 }

function write() {
	  document.writeFrm.action = "write.eun";
	  document.writeFrm.submit();
	 }

function block(value) {
	  document.readFrm.nowPage.value = <%=pagePerBlock%>*(value - 1) + 1;
	  document.readFrm.submit();
	 }
</script>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">수요조사</li>
			</ol>
		</div>
	</div>
	<%
		int bm = dao.getCount("Book&Music");
		int e = dao.getCount("Electronic equipment");
		int f = dao.getCount("Fashion");
		int g = dao.getCount("Game&Toy");
		int b = dao.getCount("Beauty");
		int etc = dao.getCount("ETC");
	%>
	<div class="products">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="categories animated wow slideInUp" data-wow-delay=".2s">
					<h3>Categories</h3>
					<ul class="cate">
						<li><a href="Beauty.eun">Beauty</a> <span>(<%= b %>)</span></li>
						<li><a href="Book&Music.eun">Book &amp; Music</a><span>(<%= bm %>)</span></li> 
						<li><a href="Electronic equipment.eun">Electronic equipment</a><span>(<%= e %>)</span></li> 
						<li><a href="Fashion.eun">Fashion</a><span>(<%= f %>)</span></li>
						<li><a href="Game&Toy.eun">Game &amp; Toy</a><span>(<%= g %>)</span></li>
						<li><a href="Living.eun"><font color="#F06464">Living</font></a><span>(<%=totalRecord %>)</span></li>
						<li><a href="ETC.eun">ETC</a><span>(<%= etc %>)</span></li>
					</ul>
				</div>
			</div>
			<%
				List<DemandVO> list = dao.getList(start, end, "Living");
			%>
			<div class="col-md-8 products-right">
				<div class="products-right-grid">
				<!-- <div class="products-right-grids-position animated wow slideInUp" data-wow-delay=".1s"> -->
				&nbsp; <font size="5pt">Living</font>
					<table class="table table-hover" cellspacing="0" width="100%">
						<thead id="the">
							<tr>
								<th><font color="#000">번호</font></th>
								<th><font color="#000">제목</font></th>
								<th><font color="#000">작성자</font></th>
								<th><font color="#000">작성일</font></th>
								<th><font color="#000">조회수</font></th>
							</tr>
						</thead>
						<tbody>
						<%
							int listsize = list.size();
							if(list.isEmpty())
							{
						%>
								<tr><td colspan="5" align="center">등록된 게시물이 없습니다.</td></tr>
						<%
							}
							for(int i=0;i<numPerPage;i++)
							{
								if(i==listsize)
									break;
								DemandVO vo = list.get(i);
								String title = vo.getTitle();
								String writer = vo.getWriter();
								String regdate = vo.getRegdate();
								int count = vo.getCount();
								
								Date date = new Date();
				    			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				    			String year = (String)simpleDate.format(date);
				    			String yea = regdate.substring(0,10);
						%>
							<tr onclick="javascript:read('<%=vo.getNo()%>')">
							 <td><%= totalRecord-((nowPage-1))*numPerPage -i %></td>
							 <td>
							 	<%= title %>
							 	<%
							 		if(year.equals(yea)) {
							 	%>
							 		<img src="images/icon_new2.gif" />
							 	<%
							 		}
							 	%> 
							 </td>
							 <td><%= writer %></td>
							 <td><%= yea %></td>
							 <td><%= count %></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
				<!-- </div> -->
					<a class="btn btn-default" href="javascript:write()">글쓰기</a>
					<nav class="numbering animated wow slideInRight" data-wow-delay=".2s">
				  	<ul class="pagination paging">
				  	<%
				    	pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
			         	pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage; 
			         
				         //하단 페이지 끝번호
				        if(totalPage != 0)
						{
							if(nowBlock > 1)
							{
				  	%>
						<li>
						  <a href="javascript:block('<%= nowBlock - 1 %>')" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						  </a>
						</li>
						<%  } %>
						<%
							for(; pageStart <= pageEnd; pageStart++)
							{ 
						%>
						<li class="active"><a href="javascript:pageing('<%= pageStart %>')">
						<%
							if(pageStart == nowPage)
							{
						%><font color="#0000">
						<%
							}
						%>
						<%= pageStart %>
						<%
							if(pageStart == nowPage)
							{
						%></font>
						<%  } %>
						<span class="sr-only">(current)</span></a></li>
						<%  } %><!-- end of for  -->
						<%
							if(totalBlock > nowBlock)
							{
						%>
						<li>
						  <a href="javascript:block('<%= nowBlock+1%>')" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						  </a>
						</li>
						<%
							}
						  } 
						%>
				  </ul>
				</nav>
				</div>
			</div>
		</div>
	</div>
	
	
		<form name="readFrm" method="get">
			<input type="hidden" name="no"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="type" value="Living">
		</form>
		
		<form name="writeFrm" method="get">
			<input type="hidden" name="type" value="Living">
		</form>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>