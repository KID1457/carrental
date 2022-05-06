<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.cuc.dao.imp.BusinessStoreDAO"%>
<%@page import="com.cuc.dao.IBusinessStoreDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'StoreInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>

	<jsp:include page="Header.jsp" />

	<div class="about_banner">
		<img src="<%=basePath%>member/yizuche/382064484.jpeg" width="100%"
			height="60%">
	</div>
	<center>
		<div
			style="border: 5px solid #FE5714; width: 1050px; height: 500px; margin: 50px 0 0 30px; font-size: 14px;">
			<div
				style="font-size: 30px; margin-left: 100px; margin-top: -35px; padding: 5px 20px; background: #FFFFFF; line-height: 50px; position: absolute; z-index: 13;">
				Business shop</div>
			<div style="margin-top: 30px;">
				<%
						IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
						ArrayList<String[]> storeList = storeDAO.searchAllBusinessStore();
						for (int i = 0; i < storeList.size(); i++) {
							String[] store = storeList.get(i);
					%>
				<div
					style="line-height: 25px; font-size: 14px; text-align: left; margin-top: -5px; padding: 10px 20px">
					<table>
						<tr>
							<td width="130px;"><img
								src="<%=basePath%>uploadFiles/<%=store[4]%>" width="100px;"
								height="100px;"></td>
							<td><strong>Name of store：</strong><%=store[3]%><br> <strong>Phone：</strong><%=store[5]%><br>
								<strong>Address：</strong><%=store[6]%> <%=store[7]%> <%=store[8]%><br>&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;<%=store[9]%></td>
						</tr>
					</table>

				</div>
				<%
						}
					%>
			</div>

		</div>

		<div style="clear: both;">
			<p>Copyright© 2020</p>
		</div>
	</center>

</body>
</html>
