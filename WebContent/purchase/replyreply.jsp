<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr id="replyItem<c:out value="${replyreply.reno}"/>"
	style="margin-left:<c:out value="${20*replyreply.redepth}"/>px;">
	<td>
		<table>
			<tr>
				<td><c:out value="${replyreply.rewriter}" /> <c:out
						value="${replyreply.redate}" /></td>
				<%-- <td><c:out value="${replylist.redate}"/></td> --%>
				<td><a href="#"
					onclick="fn_replyReply('<c:out value="${replyreply.reno}"/>')">댓글</a></td>
				<td><a href="#"
					onclick="fn_replyDelete('<c:out value="${replyreply.reno}"/>')">삭제</a></td>
			</tr>
			<tr>
				<td colspan="3" id="reply<c:out value="${replyreply.reno}"/>"><c:out
						value="${replyreply.rememo}" /></td>
			</tr>
		</table>
	</td>
</tr>