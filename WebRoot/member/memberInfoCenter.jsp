<%@page import="com.cuc.model.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response.sendRedirect(request.getContextPath() + "/member/"
				+ "login.jsp");
		return;
	}
%>

<html>
<head>
<frameset rows='58,*' framespacing='0' border='0' bordercolor='#000000'
	frameborder='0'>
	<frame src='<%=basePath%>member/Header.jsp' name='menu' scrolling=no>
	<frame src='<%=basePath%>member/memberInfo.jsp' name='content'>
</frameset>
</html>