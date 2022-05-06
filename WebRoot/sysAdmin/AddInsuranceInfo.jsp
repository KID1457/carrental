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
	src="<%=basePath%>businessStore/js/common.js"></script>

<SCRIPT LANGUAGE="JavaScript">
	function validate(myform) {
	
		if ($("#name").val().length == 0) {
			alert("Insurance name cannot be empty！");
			$("#name").focus();
			return false;
		}


		if ($("#price").val().length == 0) {
			alert("Price cannot be empty！");
			$("#price").focus();
			return false;
		}
		
	
		
		if (!$.isNumeric($("#price").val() )) {
			alert("Price is not a number！");
			$("#price").focus();
			return false;
		}
		
		if ($("#content").val().length == 0) {
			alert("Insurance description cannot be empty！");
			$("#content").focus();
			return false;
		}

		return true;
	}

</SCRIPT>


</head>

<body>
	<div class="container">
		<div class="box">
			<div class="box_border">
				<div class="box_top">
					<b class="pl15">Lease insurance add</b>
				</div>

				<div class="box_center">

					<form
						action="<%=basePath%>servlet/SysAdminServlet?method=addInsuranceInfo"
						method="post" class="jqtransform"
						onsubmit="return validate(this) ">
						<table class="form_table pt15 pb15" width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="td_right">Insurance name：</td>
									<td class=""><input type="text" name="name" id="name"
										class="input-text lh30" size="40"></td>
								</tr>
								<tr>
									<td class="td_right">Insurance price：</td>
									<td><input type="text" name="price" id="price"
										class="input-text lh30" size="40"></td>
								</tr>
								<tr>
									<td class="td_right">Content description：</td>
									<td><textarea rows="5" cols="50" style="height: 80px;"
											class="input-text" name="content" id="content"></textarea></td>
								</tr>

								<tr>
									<td class="td_right">Available state：</td>
									<td class=""><span class="fl">
											<div class="select_border">
												<div class="select_containers ">
													<select name="state" class="select">
														<option value="0">DisEnable</option>
														<option value="1">Enable</option>
													</select>
												</div>
											</div>
									</span></td>
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
