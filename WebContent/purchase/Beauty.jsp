<%@page import="kr.co.eun.vo.PurchaseVO"%>
<%@page import="kr.co.eun.dao.PurchaseDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Beauty</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css?ver=2" rel="stylesheet" type="text/css" media="all" />
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css=?ver=7" rel="stylesheet" type="text/css" media="all" />

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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>

<%-- <%
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
		</script> --%>
<%
	//}

	int totalRecord = 0; 
	int numPerPage = 9; 
	int pagePerBlock = 5; 
	int totalPage = 0; 
	int totalBlock = 0; 
	int nowPage = 1; 
	int nowBlock = 1; 
	
	int start = 0; 
	int end = 9; 
	
	int listSize = 0; 
	
	int pageStart = 0; 
	int pageEnd = 0; 
	
	
	if (request.getParameter("nowPage") != null) 
	{
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage) - numPerPage+1;
	end = start + numPerPage-1;
	
	PurchaseDAO dao = new PurchaseDAO();
	totalRecord = dao.getCount("pBeauty");
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

%>
<script type="text/javascript">
function read(no) {
	  document.readFrm.no.value = no;
	  document.readFrm.action = "pread.eun";
	  document.readFrm.submit();
	 }

function write() {
	  document.writeFrm.action = "pwrite.eun";
	  document.writeFrm.submit();
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
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">공동구매</li>
			</ol>
		</div>
	</div>
	<%
		int bm = dao.getCount("pBook&Music");
		int e = dao.getCount("pElectronic equipment");
		int f = dao.getCount("pFashion");
		int g = dao.getCount("pGame&Toy");
		int l = dao.getCount("pLiving");
		int etc = dao.getCount("pETC");
	%>
	<div class="products">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="categories animated wow slideInUp" data-wow-delay=".2s">
					<h3>Categories</h3>
					<ul class="cate">
						<li><a href="Beauty.eun"><font color="#F06464">Beauty</font></a> <span>(<%=totalRecord %>)</span></li>
						<li><a href="Book&Music.eun">Book &amp; Music</a> <span>(<%= bm %>)</span></li>
						<li><a href="Electronic equipment.eun">Electronic equipment</a> <span>(<%= e %>)</span></li>
						<li><a href="Fashion.eun">Fashion</a><span>(<%= f %>)</span></li>
						<li><a href="Game&Toy.eun">Game &amp; Toy</a><span>(<%= g %>)</span></li>
						<li><a href="Living.eun">Living</a><span>(<%= l %>)</span></li>
						<li><a href="ETC.eun">ETC</a><span>(<%= etc %>)</span></li>
					</ul>
				</div>
			</div>
			<%
				List<PurchaseVO> list = dao.getList(start, end, "pBeauty");
			%>
			<div class="col-md-8 products-right">
				<div class="products-right-grid">
				&nbsp; <font size="5pt">Beauty</font>
				<div class="products-right-grids-bottom">
				<%
					int listsize = list.size();
					if(list.isEmpty())
					{
				%>
					<font size="2.5pt" style="text-align: center;">등록된 게시물이 없습니다.</font>
				<%
					}
					for(int i=0;i<numPerPage;i++)
					{
						if(i==listsize)
							break;
						PurchaseVO vo = list.get(i);
						String title = vo.getTitle();
						String writer = vo.getWriter();
						String file = vo.getFiles();
						System.out.println(file);
						String price = vo.getPrice();
						int quantity = vo.getQuantity();
						int nowquan = vo.getNowquan();
						int diff = quantity-nowquan;
						/* int diff=0; */
						String regdate = vo.getRegdate();
						String enddate = vo.getEnddate().substring(0,10);
						
						Date date = new Date();
		    			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
		    			String year = (String)simpleDate.format(date);
		    			String yea = regdate.substring(0,10);
		    			
		    			Date dateend = simpleDate.parse(enddate);
		    			Date today = simpleDate.parse(year);
		    			long diffday = dateend.getTime()-today.getTime();
		    			long diffdays = diffday/(24*60*60*1000);
		    			//long diffdays = -1;
				%>
					<div class="col-md-4 products-right-grids-bottom-grid">
						<span>
						<%
							if(diff<=2 && diff>0)
							{
						%>
								<img src="images/diff.png">
						<%
							}
							if(diffdays<2 && diffdays>0)
							{
						%>
								<font size="2pt" style="font-weight: bold;"><%=diffdays %>일 남았습니다.</font>
						<%
							}
							else if(diffdays==0)
							{
						%>
								<font size="2pt" style="font-weight: bold;">오늘 마감 입니다.</font>
						<%
							}
						%>
						</span>
						<div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
							<div class="new-collections-grid1-image">
								<a href="javascript:read('<%=vo.getNo()%>')" class="product-image"><img src="<%=file %>" name="img" id="img" alt=" " class="img-responsive"/></a>
								<div class="new-collections-grid1-image-pos products-right-grids-pos">
									<a href="javascript:read('<%=vo.getNo()%>')">
											<%
												if(diffdays<0)
												{
											%>
													<font size="5pt" style="font-weight: bolder; color: RED;">&nbsp;&nbsp;&nbsp;마 감</font>
											<%
												}
												else if(diff==0)
												{
											%>
													<font size="5pt" style="font-weight: bolder; color: RED;text-align: left;">SOLD OUT</font>
											<%
												}
												else
												{
											%>
													<font size="4pt" style="font-weight: bold; text-align: center;"><%=diff %>개 남았습니다</font>
											<%
												}
											%>
										</a>
								</div>
							</div>
							<h4><a href="javascript:read('<%=vo.getNo()%>')"><%=title %>
								<%
							 		if(year.equals(yea)) {
							 	%>
							 		<img src="images/icon_new2.gif" />
							 	<%
							 		}
							 	%> 
							</a></h4>
							<p><%= writer %></p>
							<div class="simpleCart_shelfItem products-right-grid1-add-cart">
								<span class="item_price"><%=price %>원</span>
							</div>
						</div>
						
					</div>
				<%
					}
				%>
					<div class="clearfix"> </div>
				</div>
				<!-- </div> -->
				<p></p>
				<br>
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
			<input type="hidden" name="type" value="Beauty">
		</form>
		
		<form name="writeFrm" method="get">
			<input type="hidden" name="type" value="Beauty">
		</form>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<jsp:include page="../include/footer.jsp"/>
<script>imgSize("img");</script>
</body>
</html>