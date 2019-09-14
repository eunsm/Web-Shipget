<%@page import="kr.co.eun.vo.PreplyVO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.eun.vo.PurchaseVO"%>
<%@page import="kr.co.eun.dao.PurchaseDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.eun.vo.DreplyVO"%>
<%@page import="kr.co.eun.vo.MemberVO"%>
<%@page import="kr.co.eun.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(function() {
	    $('#eucontent').keyup(function (e){
	        var content = $(this).val();
	        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	        $('#eucounter').html(content.length + '/300');
	    });
	    $('#eucontent').keyup();
	});
	
	$(function() {
	    $('#eucontent2').keyup(function (e){
	        var content = $(this).val();
	        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	        $('#eucounter2').html(content.length + '/300');
	    });
	    $('#eucontent2').keyup();
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
	//String listpage = type+".eun";
	String id="";
	
	if(session.getAttribute("id") != null)
	{
		id = (String)session.getAttribute("id"); 
	}
	
	PurchaseDAO dao = new PurchaseDAO();
	PurchaseVO vo = dao.getBoard(no);
	String listpage = vo.getType()+".eun";
	int diff = vo.getQuantity()-vo.getNowquan();
	String enddate = vo.getEnddate();
	String enddate2 = vo.getEnddate().substring(0,10)+" "+vo.getEnddate().substring(11);
	
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
	SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy-MM-dd kk:mm",Locale.getDefault()); 
	String year = (String)simpleDate.format(date);
	String year2 = (String)simpleDate2.format(date);
/* 	System.out.println(enddate2);
	System.out.println(year2); */
	
	Date dateyear = simpleDate2.parse(year2);
	Date dateend2 = simpleDate2.parse(enddate2);
	
	Date dateend = simpleDate.parse(enddate);
	Date today = simpleDate.parse(year);
	long diffday = dateend.getTime()-today.getTime();
	long diffdays = diffday/(24*60*60*1000);
	
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
		document.updateFrm.action = "pupdate.eun";
		document.updateFrm.submit();
	}
	function purchase()
	{
		document.updateFrm.action = "purchaseform.eun";
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
				document.deleteFrm.action = "pdelete.eun";
				document.deleteFrm.submit();
			  swal("삭제 되었습니다", "", "success");
			});
	}
	
/* 	function replydelete(no)
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
				document.rlydelFrm.action = "preplydelete.eun";
				document.rlydelFrm.submit();
			  swal("삭제 되었습니다", "", "success");
			});
	} */
</script>
<script type="text/javascript">
$(function() {
	$('#example').popover()
});
</script>
<script>
function hideDiv(id){
    var div = document.getElementById(id);
    div.style.display = "none";
    document.body.appendChild(div);
}

function fn_replyReply(reno){
    var form = document.form3;
    var reply = document.getElementById("reply"+reno);
    var replyDia = document.getElementById("replyDialog");
    /* replyDia.style.display = ""; */
    //replyDia.show();
   /*  if (updateReno) {
        fn_replyUpdateCancel();
    }  */
   // alert("1");
    form.rememo.value = "";
    form.reparent.value=reno;
    reply.appendChild(replyDia);
    //replyDia.show();
    //alert("2");
    //$('#replyreply').show();
    replyDia.style.display = "block";
    //alert("3");
    form.rememo.focus();
} 

function fn_replyDelete(reno){
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
			$.ajax({
		        url: "preplydelete.eun",
		        type:"post", 
		        data: {"brdno": $("#brdno").val(), "reno": reno},
		        success: function(result){
		            if (result=="OK") {
		                $("#replyItem"+reno).remove();
		                swal("삭제 되었습니다", "", "success");
		            } else{
		            	swal("댓글이 있어서 삭제할 수 없습니다.", "", "error");
		            }
		        }
		    })
		});
}
function fn_formSubmit(){
	 
	$.ajax({
        url: "preplyproc.eun",
        type:"post", 
        data: {"brdno": $("#brdno").val(), "rewriter": $("#rewriter").val(), "id": $("#id").val(), "rememo": $("#eucontent").val()},
        success: function(result){
        	System.out.prinln(reuslt);
            if (result!=="") {
                var tr = $("<tr>");
                tr.attr("id", "replyItem" + result);
                tr.appendTo($("#replyList"));
               /*  div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"}); */
              /*   div.text($("#rewriter").val() + " 방금" ); */
              	
              	$("<td><table><tr id='tr1'></td><td id='td2'></td><td id='td3'></td></tr><tr id='tr2'></tr></table></td>").appendTo(tr);
              	$("#td1").text($("#rewriter").val() + " 방금" );
              
                $("<a>",{
                    text: "삭제",
                    href: "#",
                    click: function (){fn_replyDelete(result)}
                }).appendTo($("#td3"));
                
                var href = $("<a>");
                href.attr("href", "#");
                href.text("댓글");
                href.click(function (){fn_replyReply(result)});
                href.appendTo($("#td2"));
                
                var reply=$("<td colspan='3'>").appendTo($("#tr2"));
                reply.attr("id", "reply" + result);
                reply.html($("#eucontent").val());
               /*  $("#rewriter").val(""); */
                $("#eucontent").val("");
                swal("저장되었습니다.", "", "success");
            } else{
            	swal("서버에 오류가 있어서 저장되지 않았습니다.", "", "error");
            }
        }
    })    
}
function fn_replyReplyCancel(){
    hideDiv("replyDialog");
    $('#eucounter2').html(0+ '/300');
} 
function fn_replyReplySave(){
	var formData = $("#form3").serialize();
    $.ajax({
        url: "preplyreplysave.eun",
        type:"post", 
        data : {"brdno": $("#brdno3").val(), "rewriter": $("#rewriter3").val(), "reparent": $("#reparent3").val(), "id": $("#id3").val(), "rememo": $("#eucontent2").val()},
        success: function(result){
            if (result!=="") {
                var parent = $("#reparent3").val();
                $("#replyItem"+parent).after(result);
                $("#replyDialog").hide();
                swal("저장 되었습니다", "", "success");
            } else{
            	swal("서버에 오류가 있어서 저장되지 않았습니다.", "", "error");
            }
        }
    })        
}
</script>
<input type="hidden" value="<%= no %>" id="no"/>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">공동구매</li>
			</ol>
		</div>
	</div>
	<%
		int b = dao.getCount("pBeauty");
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
						<li><a href="pBeauty.eun">Beauty</a><span>(<%= b %>)</span></li>
						<li><a href="pBook&Music.eun">Book &amp; Music</a><span>(<%= bm %>)</span></li> 
						<li><a href="pElectronic equipment.eun">Electronic equipment</a><span>(<%= e %>)</span></li> 
						<li><a href="pFashion.eun">Fashion</a><span>(<%= f %>)</span></li>
						<li><a href="pGame&Toy.eun">Game &amp; Toy</a><span>(<%= g %>)</span></li>
						<li><a href="pLiving.eun">Living</a><span>(<%= l %>)</span></li>
						<li><a href="pETC.eun">ETC</a><span>(<%= etc %>)</span></li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 products-right">
				<div class="products-right-grid">
					<table class="table" width="100%"> 
					<tr> 
						<td><font color="#000">작성자</font></td> 
						<td>
							<font color="#000">
								<a tabindex="0" style="color:black; text-decoration: none;" id="example" role="button" data-toggle="popover" data-trigger="focus" title="판매이력" data-content="샤넬 립스틱 . 블러셔"><%= vo.getWriter() %></a>
							</font>
						</td> 
					</tr>
					<tr> 
						<td><font color="#000">분야</font></td> 
						<td><font color="#000"><%= type %></font></td> 
					</tr>
					<tr> 
						<td><font color="#000">제목</font></td> 
						<td><font color="#000"><%= vo.getTitle() %></font></td> 
					</tr>
					<tr> 
						<td><font color="#000">남은 수량</font></td> 
						<td><font color="#000"><%= diff %></font></td> 
					</tr>
					<tr> 
						<td><font color="#000">가격</font></td> 
						<td><font color="#000"><%= vo.getPrice() %>원</font></td> 
					</tr>
					<tr> 
						<td><font color="#000">구매<br>마감일</font></td> 
						<td>
							<%
								if(diffdays<0)
								{
							%>
									<font style="text-decoration: line-through;"><%= enddate2 %></font>
							<%
								}else
								{
							%>
									<font color="#000"><%= enddate2 %></font>	
							<%
								}
							%>
							<%
								if(diffdays>0)
								{
							%>
							 		(<%=diffdays %>일 남음)
							<%
								}
								else if(diffdays==0)
								{
							%>
									(오늘까지 입니다.)
							<%
								}
								else
								{
							%>
									(기간이 만료되었습니다.)
							<%
								}
							%>
						</td> 
					</tr>
					<tr>
						<td></td>
						<td colspan="2">현재까지 <%=vo.getNowquan()%>개를 구매했습니다.</td>
					</tr>
					<tr> 
						<td><font color="#000">내용</font></td> 
						<td>
							<pre><%= vo.getContent() %></pre>
						</td> 
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
							else
							{
								System.out.println(!dateyear.after(dateend2));
								System.out.println(diff);
								if(!dateyear.after(dateend2)&&diff>0)
								{
						%>	
								<input type="button" value="구매신청서" onclick="purchase()"/> 
						<%
								}
							}					
						%>
						</td> 
					</tr> 
				</table>
			<form method="post" name="rlyfrm" onsubmit="fn_formSubmit()">
				<table class="table" width="100%" style="border-spacing: 0px;">
					 <tr>
					 	<td colspan="2"><font color="#000">댓글</font></td>
					 </tr>
					 <%
						//MemberDAO mdao =  new MemberDAO();
						//MemberVO mvo = mdao.getMember(id);
						String brdno = no+"";
						List<PreplyVO> replylist = dao.getreplyList(brdno);
					 %>
					 <%-- <tr>
					 	<td><%=mvo.getName() %><input type="hidden" id="rewriter" name="rewriter" value="<%=mvo.getName() %>"></td>
					 </tr> --%>
					 <tr>
					 	<td>
					 	<input type="hidden" name="brdno" id="brdno" value="<%=brdno%>">
						 	<div class="euwrap">
							 	<textarea id="eucontent" name="rememo" maxlength="300"></textarea>
							 	<span id="eucounter">###</span>
							 </div>
							 <input type="hidden" name="id"  id="id" value="<%=id %>"> 
							 <input type="hidden" name="no" value="<%=no %>"> 
							 <input type="hidden" name="nowPage" value="<%=nowPage%>">
							 <input type="hidden" name="type" value="<%=type%>"> 
						 </td>
					 	<td><input type="submit" id="rebtn" value="확인"/></td>
					 	<!-- <td><input type="submit" id="rebtn" value="확인" onclick="fn_replyReplySave()"/></td> -->
					 </tr>
				</table>
			</form>
			<table id="replyList" class="table" width="100%">
				<%-- <c:forEach var="replylist" items="${replylist}" varStatus="status"> --%>
				<%
					for(PreplyVO reply:replylist){
						int depth = Integer.parseInt(reply.getRedepth())*20; 
						System.out.println(depth);
				%>
					<tr id="replyItem<%=reply.getReno()%>">
						<td>
							<table style="margin-left:<%=depth %>px;">
								<tr>
									<td><%=reply.getRewriter() %> <%=reply.getRedate() %></td>
									<%-- <td><c:out value="${replylist.redate}"/></td> --%>
									<td><a href="javascript:fn_replyReply('<%=reply.getReno() %>')" id="replyreply">댓글</a></td>
									<td><a href="javascript:fn_replyDelete('<%=reply.getReno() %>')">삭제</a></td>
								</tr>
								<tr>
									<td colspan="3" id="reply<%=reply.getReno() %>"><%=reply.getRememo() %></td>
								</tr>
							</table>
						</td>
					</tr>
				<%
					}
				%>
				<%-- </c:forEach> --%>
			</table>
			<div id="replyDialog" style="display: none;">
				<form method="post" name="form3">
				<table class="table" width="100%" style="border-spacing: 0px;">
					 <tr>
					 	<td><font color="#000">댓글</font></td>
					 </tr>
					 <%-- <tr>
					 	<td id="rewriter"><%=mvo.getName() %><input type="hidden" id="rewriter3" name="rewriter" value="<%=mvo.getName() %>"></td>
					 </tr>
 --%>					 <tr>
					 	<td>
						 	<input type="hidden" name="brdno" id="brdno3" value="<%=brdno%>">
						 	<input type="hidden" name="reparent" id="reparent3"/>
						 	<input type="hidden" name="reno" id="reno3"/>
						 	<div class="euwrap">
							 	<textarea id="eucontent2" name="rememo" maxlength="300"></textarea>
							 	<span id="eucounter2">###</span>
							 </div>
							 <input type="hidden" name="id" id="id3" value="<%=id %>"> 
							 <input type="hidden" name="no" value="<%=no %>"> 
							 <input type="hidden" name="nowPage" value="<%=nowPage%>">
							 <input type="hidden" name="type" value="<%=type%>"> 
						 </td>
					 	<td><input type="submit" id="rebtn" value="확인" onclick="fn_replyReplySave()"/> <input type="reset" id="rebtn" value="취소" onclick="fn_replyReplyCancel()"/></td>
					 </tr>
				</table>
			</form>
			</div>
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
	<form name="purchaseFrm" method="get">
		<input type="hidden" name="no" value="<%=no %>"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="type" value="<%=type%>">
	</form>
<script src="js/bootstrap.js"></script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>