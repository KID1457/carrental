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
<script type="text/javascript">
	$( function() {
		$(".list_table").colResizable( {
			liveDrag :true,
			gripInnerHtml :"<div class='grip'></div>",
			draggingClass :"dragging",
			minWidth :30
		});

	});

	function del(state) {

		var msg = "DisEnable?";

		if (state == 0) {
			var msg = "Enable";
		}

		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>


</head>

<body>
	<div class="container" style="margin-top: -13px;">
		<div id="forms" class="mt10">
			<div class="box">
				<div class="box_border">
					<div class="box_top">
						<b class="pl15">Lease insurance information</b>
					</div>
					<div class="box_center">
						<center>
							<div id="table" class="mt10" style="width: 99%;">
								<div class="box span10 oh">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="list_table">
										<tr>
											<th width="20">num</th>
											<th width="40">Insurance name</th>
											<th width="35">Price</th>
											<th width="200">Content description</th>
											<th width="30">State</th>
											<th width="70">Options</th>
										</tr>
										<%
												ArrayList<String[]> insuranceList = (ArrayList<String[]>) request
														.getAttribute("insuranceList");
												if (insuranceList != null && insuranceList.size() != 0) {
													for (int i = 0; i < insuranceList.size(); i++) {
														String[] insurance = insuranceList.get(i);
											%>
										<tr class="tr">
											<td class="td_center"><%=insurance[0]%></td>
											<td class="td_center"><%=insurance[1]%></td>
											<td class="td_center"><span><label
													style="font-weight: bold; color: #F18E12;"><%=insurance[2]%></label>yuan/day</span>
											</td>
											<td><%=insurance[3]%></td>
											<td class="td_center">
												<%
														if (insurance[4].equals("0")) {
													%> DisEnable <%
														} else {
													%> Enable <%
														}
													%>
											</td>
											<td class="td_center"><a
												href="<%=basePath%>servlet/SysAdminServlet?method=preupdateInsurance&id=<%=insurance[0]%>">
													<input type="image" name="imageField" id="imageField"
													src="<%=basePath%>images/update.png" width="15px;" />Edit
											</a> <%
														if (insurance[4].equals("1")) {
													%> <a
												href="<%=basePath%>servlet/SysAdminServlet?method=updateInsuranceState&id=<%=insurance[0]%>&state=<%=insurance[4]%>"
												onclick='javascript:return del(1)'> <input type="image"
													name="imageField" id="imageField"
													src="<%=basePath%>images/open.png" width="15px;" />DisEnable
											</a> <%
														} else if (insurance[4].equals("0")) {
													%> <a
												href="<%=basePath%>servlet/SysAdminServlet?method=updateInsuranceState&id=<%=insurance[0]%>&state=<%=insurance[4]%>"
												onclick='javascript:return del(0)'> <input type="image"
													name="imageField" id="imageField"
													src="<%=basePath%>images/closes.png" width="15px;" />Enable
											</a> <%
														}
													%></td>
										</tr>
										<%
												}
												}
											%>
									</table>
								</div>
							</div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
