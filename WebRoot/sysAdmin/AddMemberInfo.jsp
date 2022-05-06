<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript" src="<%=basePath%>script/tinybox.js"></script>
<link rel="stylesheet" href="<%=basePath%>businessStore/css/common.css">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/main.css">
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/colResizable-1.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/common.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	function validate(myform) {
	
		if ($("#no").val().length == 0) {
			alert("Account number cannot be empty！");
			$("#no").focus();
			return false;
		}

		if ($("#no").val().length < 6 || $("#no").val().length > 16) {
			alert("Wrong account length and format！");
			$("#no").focus();
			return false;
		}
		

		if ($("#password").val().length == 0) {
			alert("password connt bo empty！");
			$("#password").focus();
			return false;
		}

		if ($("#password").val().length < 6 || $("#password").val().length > 16) {
			alert("Wrong password length and format！");
			$("#password").focus();
			return false;
		}

		if ($("#name").val().length == 0) {
			alert("Name cannot be empty！");
			$("#name").focus();
			return false;
		}


		if ($("#phone").val().length == 0) {
			alert("Phone cannot be empty！");
			$("#phone").focus();
			return false;
		}

		return true;
	}
	
	
	
	function isSameNo(){
	
		if($("#no").val().length!=0){
		
			var url="<%=basePath%>servlet/MemberServlet?method=isSameNo";
			
				 $.post(url,{"no":$("#no").val()},function(result){
					 if(result=="-1"){
						  $("#notip").html("√available！"); 
					  }else{
					 	 $("#notip").html("×Has been registered！");
					  }
				  });
		}
	}
	

</SCRIPT>
<body>
	<div class="container">
		<div class="box">
			<div class="box_border">
				<div class="box_top">
					<b class="pl15">Registered member</b>
				</div>

				<div class="box_center">

					<form name="validateForm"
						action="<%=basePath%>servlet/SysAdminServlet?method=regMember"
						method="post" class="jqtransform"
						onsubmit="return validate(this) ">
						<table class="form_table pt15 pb15" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="td_right">Account number：</td>
									<td class=""><input type="text" name="no" id="no"
										class="input-text lh30" size="40" onblur="isSameNo()"><span
										id="notip" style="color: red;"></span></td>
								</tr>
								<tr>
									<td class="td_right">password：</td>
									<td><input type="password" name="password" id="password"
										class="input-text lh30" size="40"></td>
								</tr>
								<tr>
									<td class="td_right">name：</td>
									<td><input type="text" name="name" id="name"
										class="input-text lh30" size="40"></td>
								</tr>
								<tr>
									<td class="td_right">phone：</td>
									<td><input type="text" name="phone" id="phone"
										class="input-text lh30" size="40"></td>
								</tr>

								<tr>
									<td class="td_right">&nbsp;</td>
									<td class=""><input type="submit" name="button"
										class="btn btn82 btn_save2" value="save"> <input
										type="reset" name="button" class="btn btn82 btn_res"
										value="reset"></td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
