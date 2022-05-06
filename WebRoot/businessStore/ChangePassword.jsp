<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.cuc.model.BusinessStore"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	BusinessStore store = (BusinessStore) session.getAttribute("store");
	if (store == null) {
		response
				.getWriter()
				.write(
						"<script language =javascript>window.open('../member/welcome.jsp','_top')</script>");

		return;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript"
	src="<%=basePath%>member/script/jquery-1.7.2.min.js"></script>
<link href="<%=basePath%>member/css/xiniu.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/common.css">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/main.css">
<SCRIPT LANGUAGE="JavaScript">
	function validate(myform) {
		if (myform.password.value.length == 0) {
			alert("Please fill in the password！");
			myform.password.focus();
			return false;
		}
		if (myform.password.value!=<%=store.getStorePassword()%> ) {
			alert("Incorrect password！");
			myform.password.focus();
			return false;
		}
		if (myform.tbPassword.value.length == 0) {
			alert("Please fill in the new password！");
			myform.tbPassword.focus();
			return false;
		}
		if (myform.againstPassword.value.length == 0) {
			alert("Please fill in the new password again！");
			myform.againstPassword.focus();
			return false;
		}
		if (myform.tbPassword.value != myform.againstPassword.value) {
			alert("Two different passwords！");
			myform.tbPassword.focus();
			return false;
		}
		return true;
	}
</SCRIPT>
</head>

<body>
	<div class="container">
		<div id="forms" class="mt10">
			<div class="box">
				<div class="box_border">
					<div class="box_top">
						<b class="pl15">Change password</b>
					</div>
					<center>
						<form
							action="<%=basePath%>servlet/StoreServlet?method=changePassword&id=<%=store.getStoreId()%>"
							method="post" id="form1" onSubmit="return validate(this);">
							<table style="margin-top: 30px;" border="0">
								<tr>
									<td style="width: 200px;">
										<div class="ywz_zhuce_youjian">Old Password：</div>
									</td>
									<td style="width: 200px;">
										<div class="ywz_zhuce_kuangzi">
											<input name="password" type="password" id="password"
												class="ywz_zhuce_kuangwenzi1">
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 200px;">
										<div class="ywz_zhuce_youjian">New Password：</div>
									</td>
									<td>
										<div class="ywz_zhuce_xiaoxiaobao">
											<div class="ywz_zhuce_kuangzi">
												<input name="tbPassword" type="password" id="tbPassword"
													class="ywz_zhuce_kuangwenzi1">
											</div>
											<div class="ywz_zhuce_huixian" id="pwdLevel_1"></div>
											<div class="ywz_zhuce_huixian" id="pwdLevel_2"></div>
											<div class="ywz_zhuce_huixian" id="pwdLevel_3"></div>
											<div class="ywz_zhuce_hongxianwenzi">weak</div>
											<div class="ywz_zhuce_hongxianwenzi">medium</div>
											<div class="ywz_zhuce_hongxianwenzi">medium</div>
										</div>
									</td>
									<td>
										<div class="ywz_zhuce_yongyu1">
											<span id="pwd_tip" style="color: #898989"><font
												style="color: #F00">*</font> 6-16 length,Consists of letters
												(case sensitive), numbers, symbols</span> <span id="pwd_err"
												style="color: #f00; display: none;">Consists of
												letters (case sensitive), numbers, symbols</span>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="ywz_zhuce_youjian">confirm password：</div>
									</td>
									<td>
										<div class="ywz_zhuce_kuangzi">
											<input name="againstPassword" type="password"
												id="againstPassword" class="ywz_zhuce_kuangwenzi1">

										</div>
									</td>
								</tr>
							</table>
							<div
								style="clear: both; padding-top: 30px; padding-bottom: 50px;">
								<input type="submit" name="submit" value=" " class="button_blue">
							</div>
						</form>
						<script type="text/javascript"
							src="<%=basePath%>member/script/pwd.js"></script>

					</center>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
