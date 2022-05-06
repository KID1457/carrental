<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.cuc.dao.IMessageDAO"%>
<%@page import="com.cuc.dao.imp.MessageDAO"%>
<%@page import="com.cuc.model.Member"%>
<%@page import="com.cuc.model.Message"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response
				.getWriter()
				.println(
						"<SCRIPT LANGUAGE='JavaScript'>alert('please login！');javascript:history.back(-1);</SCRIPT>");
		response.sendRedirect("/member/welcome.jsp");

	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="<%=basePath%>member/css/Global.css" rel="stylesheet">
<script type="text/javascript">
	function del() {
		var msg = "delete?";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<style type="text/css">
strong {
	color: #6b6b6b;
}
</style>
</head>

<body>
	<div class="col-main">
		<div class="renter" style="border: solid 1px; border-color: EFEFEF">
			<h2>My experience message</h2>
			<table width="1042" height="33" border="0" style="margin-top: 40px;">
				<tr align="center">
					<td width="178" height="29"><strong>photos</strong></td>
					<td width="580"><strong>content</strong></td>
					<td width="160"><strong>status</strong></td>
					<td width="106"><strong>optionos</strong></td>
				</tr>
			</table>
			<div
				style="border-bottom: solid 2px; border-color: #E7E7EE; width: 1040px; margin-left: 20px; margin-bottom: 10px;">

			</div>
			<%
					ArrayList<Message> msgList = (ArrayList<Message>) request
							.getAttribute("msgList");
					if (msgList.size() != 0 && msgList != null) {
						for (int i = 0; i < msgList.size(); i++) {
							Message msg = msgList.get(i);
				%>
			<table width="1044" border="0">

				<tr>
					<td width="181" height="126" align="center"><input
						type="image"
						src="<%=basePath%>uploadFiles/<%=msg.getMessageImage()%>"
						align="middle" width="120" height="120" /> &nbsp;</td>
					<td width="588"><%=msg.getMessageContent()%> <br /> <br />
						<p>
							<strong>time</strong>:<%=msg.getMessageDate().toString().substring(0, 19)%>
						</p></td>
					<td width="149" align="center">
						<%
								if (msg.getState() == 0) {
							%> <strong>To be audited</strong> <%
								} else if (msg.getState() == 1) {
							%> <strong>Pass</strong> <%
								} else {
							%> <strong>Not pass</strong> <%
								}
							%>
					</td>
					<td width="108" align="center"><a
						href="<%=basePath%>servlet/MemberServlet?method=delMessage&id=<%=msg.getMessageId()%>&imageName=<%=msg.getMessageImage() %>"
						onclick='javascript:return del()'> <input type="image"
							name="imageField" id="imageField"
							src="<%=basePath%>images/delete.jpg" />
					</a></td>

				</tr>
			</table>
			<div
				style="border-bottom: dotted; 1 px; width: 980px; margin-left: 20px; margin-top: 15px; margin-bottom: 15px;"></div>
			<%
					}
					}
				%>
		</div>

	</div>

</body>
</html>
