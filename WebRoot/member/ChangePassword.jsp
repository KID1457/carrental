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
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response
				.getWriter()
				.write(
						"<script language =javascript>window.open('login.jsp','_top')</script>");

		return;
	}
%>

<html>
<head>

<script type="text/javascript"
	src="<%=basePath%>member/script/jquery-1.7.2.min.js"></script>
<link href="<%=basePath%>member/css/xiniu.css" rel="stylesheet"
	type="text/css">
<title>update pwd</title>
<SCRIPT LANGUAGE="JavaScript">
	function validate(myform) {
		if (myform.password.value.length == 0) {
			alert("Please fill in the password！");
			myform.password.focus();
			return false;
		}
		if (myform.password.value!=<%=member.getMemberPassword()%> ) {
			alert("Incorrect old password！");
			myform.password.focus();
			return false;
		}
		if (myform.tbPassword.value.length == 0) {
			alert("Please fill in the new password！");
			myform.tbPassword.focus();
			return false;
		}
		if (myform.againstPassword.value.length == 0) {
			alert("Please fill in the password again！");
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
	<div
		style="border: #CCC 1px solid; height: 500px; width: 99%; margin-top: 10px;">
		<div style="background-color: #CCC; height: 45px; line-height: 45px;">
			<h3 style="color: #575757; margin-left: 15px; font-size: 18px">
				<strong>change password</strong>
			</h3>
		</div>
		<div style="color: #404040; font-weight: bold;">
			<form name="form1" method="post"
				action="<%=basePath%>servlet/MemberServlet?method=updatePassword&id=<%=member.getMemberId()%>"
				id="form1" onSubmit="return validate(this);">
				<div id="pnBefore" class="t_zc_tc_a_tizhuce_a">
					<div class="t_zc_tc_a_tizhuce_bg">
						<div class="ywz_zhuce_bao"
							style="height: 580px; padding: 40px 0 0 0 !important; border-right: none !important; margin-bottom: 0px;">
							<div class="ywz_zhuce_youjian">old password：</div>
							<div class="ywz_zhuce_kuangzi">
								<input name="password" type="password" id="password"
									class="ywz_zhuce_kuangwenzi1">
							</div>
							<div class="ywz_zhucexiaobo">
								<div class="ywz_zhuce_youjian">new password：</div>
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
								<div class="ywz_zhuce_yongyu1">
									<span id="pwd_tip" style="color: #898989"><font
										style="color: #F00">*</font>6-16 bits, consisting of letters
										(case sensitive), numbers and symbols</span> <span id="pwd_err"
										style="color: #f00; display: none;">6-16 bits,
										consisting of letters (case sensitive), numbers and symbols</span>
								</div>
							</div>
							<div class="ywz_zhuce_youjian">confirm password：</div>
							<div class="ywz_zhuce_kuangzi">
								<input name="againstPassword" type="password"
									id="againstPassword" class="ywz_zhuce_kuangwenzi1">
								<div style="clear: both; padding-top: 30px">
									<input type="submit" name="submit" value=" "
										class="button_blue">
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript"
					src="<%=basePath%>member/script/pwd.js"></script>
			</form>
		</div>

	</div>
	</div>

</body>
</html>