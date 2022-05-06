<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<title>login</title>
<script type="text/javascript" src="./script/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="./script/login.js"></script>
<link href="./css/login2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function validate(myform) {
	
		if ($("#u").val().length == 0) {
			alert("Account number cannot be empty！");
			$("#u").focus();
			return false;
		}

		if ($("#u").val().length < 1 || $("#no").val().length > 16) {
			alert("Wrong account length and format！");
			$("#no").focus();
			return false;
		}
		

		if ($("#p").val().length == 0) {
			alert("Password cannot be empty！");
			$("#p").focus();
			return false;
		}

		if ($("#p").val().length < 1 || $("#p").val().length > 16) {
			alert("Wrong password length and format！");
			$("#p").focus();
			return false;
		}

		if ($("#codeNum").val().length == 0) {
			alert("Verification code cannot be empty！");
			$("#codeNum").focus();
			return false;
		}


		return true;
	}
	
	
	function isSameNo(){
	
	
		if($("#user").val().length!=0){
		
			var url="<%=basePath%>servlet/MemberServlet?method=isSameNo";
			
				 $.post(url,{"no":$("#user").val()},function(result){
					 if(result=="-1"){
						  $("#userCue").html("<font color=\"red\"><b>√available！</b></font>");
					  }else{
					 	 $("#userCue").html("<font color=\"red\"><b>×Has been registered！</b></font>");
					  }
				  });
		}
	}


</script>
</head>
<body style="zoom: 1;">
	<SCRIPT LANGUAGE="JavaScript">
	function changeCode() {  
	       var img=document.getElementById("checkCode"); 
	       img.src="<%=basePath%>member/imgcode.jsp?date=" + new Date();
		}
	</SCRIPT>
	<h1>
		CarRentalOnline<sup>2022</sup>
	</h1>
	<div class="login" style="margin-top: 50px;">
		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn" id="switch_qlogin" href="javascript:void(0);"
					tabindex="7">quick logon</a> <a class="switch_btn_focus"
					id="switch_login" href="javascript:void(0);" tabindex="8">quick
					registration</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 70px; left: 154px;"></div>
			</div>
		</div>
		<div class="web_qr_login" id="web_qr_login"
			style="display: none; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">
				<div class="login-box">
					<div class="login_form">
						<form action="<%=basePath%>servlet/LoginServlet" name="loginform"
							accept-charset="utf-8" id="login_form" class="loginForm"
							method="post" onsubmit="return validate(this) ">
							<input type="hidden" name="did" value="0"> <input
								type="hidden" name="to" value="log">
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">name：</label>
								<div class="inputOuter" id="uArea">
									<input type="text" id="u" name="username" class="inputstyle">

								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">pwd：</label>
								<div class="inputOuter" id="pArea">
									<input type="password" id="p" name="password"
										class="inputstyle">
								</div>
							</div>
							<div class="codeArea" id="codeArea">
								<label class="input-tips" for="p">code：</label>
								<div class="inputOuter" id="pArea">
									<input type="text" id="codeNum" name="codeNum"
										class="inputstyle"> <img id="checkCode"
										style="float: right; margin-right: -70px; margin-top: -30px"
										src="<%=basePath%>member/imgcode.jsp" onclick="changeCode();"
										title="Click the picture to refresh the verification code" />
								</div>
							</div>
							<div class="shenFenArea" id="shenFenArea">
								<label style="margin-top: -13px; margin-left: 15px"
									class="input-tips" for="u">type：：</label>
								<div style="margin-top: 20px" id="uArea">
									<label> <input type="radio" name="identity" value="1"
										id="RadioGroup1_0" checked="checked" /> Member
									</label> <label> <input type="radio" name="identity" value="2"
										id="RadioGroup1_1" /> Business
									</label> <label> <input type="radio" name="identity" value="3"
										id="RadioGroup1_1" /> Admin
									</label>
								</div>

							</div>
							<div style="padding-left: 50px; margin-top: 20px;">
								<input type="submit" name="subLogin" value="Login"
									style="width: 150px;" class="button_blue">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="qlogin" id="qlogin" style="display: block;">
			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="<%=basePath%>servlet/MemberServlet?method=register"
					method="post">
					<input type="hidden" name="to" value="reg"> <input
						type="hidden" name="did" value="0">
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">pay attention to the format</div>
						<li><label for="user" class="input-tips2">username：</label>
							<div class="inputOuter2">
								<input type="text" id="user" name="userNo" maxlength="16"
									class="inputstyle2" onblur="isSameNo()">
							</div></li>
						<li><label for="passwd" class="input-tips2">password：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd" name="passwd" maxlength="16"
									class="inputstyle2">
							</div></li>
						<li><label for="passwd2" class="input-tips2">confPwd：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd2" name="passwd2"
									maxlength="16" class="inputstyle2">
							</div></li>
						<li><label for="realName " class="input-tips2">realName：</label>
							<div class="inputOuter2">
								<input type="text" id="realName" name="realName" maxlength="10"
									class="inputstyle2">
							</div></li>
						<li><label for="phone" class="input-tips2">phone：</label>
							<div class="inputOuter2">
								<input type="text" id="phone" name="phone" maxlength="11"
									class="inputstyle2">
							</div></li>
						<li>
							<div class="inputArea">
								<input type="button" id="reg"
									style="margin-top: 10px; margin-left: 85px;"
									class="button_blue" value="Agreement and registration">
								<a href="#" class="zcxy" target="_blank">Agreement and
									registration</a>
							</div>
						</li>
						<div class="cl"></div>
					</ul>
				</form>
			</div>
		</div>
		<!--注册end-->
	</div>
	<div class="jianyi">*It is recommended to use IE8 or above
		version IE browser or chrome kernel browser to visit this site</div>
</body>
</html>