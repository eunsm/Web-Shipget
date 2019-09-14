<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청내역</title>
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
	
	//DemandDAO dao = new DemandDAO();
	//totalRecord = dao.getCount("Beauty");
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
function block(value) {
	  document.readFrm.nowPage.value = <%=pagePerBlock%>*(value - 1) + 1;
	  document.readFrm.submit();
	 }
function pageing(page)
{
	document.readFrm.nowPage.value = page;
	document.readFrm.submit();
}
</script>

	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.eun"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">마이페이지</li>
				<li class="active">신청내역조회</li>
			</ol>
		</div>
	</div>
<div class="products">
		<div class="container">
			<%
				//List<DemandVO> list = dao.getList(start, end, "Beauty");
			%>
			<div class="col-md-8 products-right">
				<div class="products-right-grid">
				<!-- <div class="products-right-grids-position animated wow slideInUp" data-wow-delay=".1s"> -->
				&nbsp;<!--  <font size="5pt">Beauty</font> -->
					<table class="table table-hover" cellspacing="0" width="100%">
						<thead id="the">
							<tr>
								<th><font color="#000">번호</font></th>
								<th><font color="#000">제품명</font></th>
								<th><font color="#000">구매신청일</font></th>
								<th><font color="#000">입금확인일</font></th>
								<th><font color="#000">처리상태</font></th>
							</tr>
						</thead>
						<tbody>
						<%
							//int listsize = list.size();
							//if(list.isEmpty())
							{
						%>
								<!-- <tr><td colspan="5" align="center">등록된 게시물이 없습니다.</td></tr> -->
						<%
							}
							/*for(int i=0;i<numPerPage;i++)
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
				    			String yea = regdate.substring(0,10);*/
						%>
							<tr>
							 <td>1</td>
							 <td>
							 	랑콤 파운데이션 공동구매
							 <%-- 	<%
							 		if(year.equals(yea)) {
							 	%>
							 		<img src="images/icon_new2.gif" />
							 	<%
							 		}
							 	%>  --%>
							 </td>
							 <td>2017.05.20</td>
							 <td>2017.05.20</td>
							 <td>입금확인</td>
							</tr>
						<%
							//}
						%>
						</tbody>
					</table>
				<!-- </div> -->
					<!-- <a class="btn btn-default" href="javascript:write()">글쓰기</a> -->
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
<jsp:include page="../include/footer.jsp"/>
</body>
</html>