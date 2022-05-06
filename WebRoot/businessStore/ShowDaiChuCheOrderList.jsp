<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.cuc.dao.ICarDAO"%>
<%@page import="com.cuc.dao.imp.CarDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/common.css">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/main.css">
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/colResizable-1.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/common.js"></script>
<script src="<%=basePath%>member/laydate/laydate.js"></script>
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
			var msg = "Enable?";
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

	<div class="container">
		<div id="forms" class="mt10">
			<div class="box">
				<div class="box_border">
					<div class="box_top">
						<b class="pl15">order info</b>

					</div>
					<center>
						<form
							action="<%=basePath%>servlet/OrderServlet?method=storeSearchAllOrderByCondition"
							method="post">
							<div class="box_center pt10 pb10">
								<table class="form_table" border="0" cellpadding="0"
									cellspacing="0">
									<tbody>
										<tr>
											<td>orderNum：</td>
											<td><input type="hidden" name="jumpUrl"
												value="ShowDaiChuCheOrderList.jsp" /> <input type="hidden"
												name="orderState" value="Waiting for departure" /> <input
												type="text" name="orderId" class="input-text lh25" size="20">
												&nbsp;&nbsp;&nbsp;</td>

											<td>createTime：</td>
											<td><input class="laydate-icon" onclick="laydate()"
												style="width: 150px; height: 30px; font-size: 16px;"
												name="beginTime"> - <input class="laydate-icon"
												id="demo"
												style="width: 150px; height: 30px; font-size: 16px;"
												name="endTime"> &nbsp;&nbsp;&nbsp;</td>

											<td><input type="submit" name="button"
												class="btn btn82 btn_search" value="select"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>

					</center>

					<div class="box_center">
						<center>
							<div id="table" class="mt10" style="width: 99%;">
								<div class="box span10 oh">
									<table border="0" cellpadding="0" cellspacing="0"
										class="list_table">
										<tr>
											<th width="10">orderNum</th>
											<th width="32">type</th>
											<th width="18">carMoney</th>
											<th width="18">total sum</th>
											<th width="42">picking time</th>
											<th width="42">return time</th>
											<th width="30">status</th>
											<th width="35">options</th>


										</tr>

										<%
												ArrayList<String[]> orderList = (ArrayList<String[]>) request
														.getAttribute("orderList");
												if (orderList != null) {
													for (int i = 0; i < orderList.size(); i++) {
														String[] order = orderList.get(i);
											%>

										<tr class="tr">
											<td class="td_center"><%=order[0]%></td>
											<td class="td_center">
												<%
														ICarDAO carDAO = new CarDAO();
																Map<String, Object> carMap = carDAO.searchByCarId(Integer
																		.parseInt(order[4]));
													%> <%=carMap.get("carBrand")%><%=carMap.get("carType")%>/<%=carMap.get("carForm")%>/<%=carMap.get("carGear")%>/<%=carMap.get("carDisplacement")%>

											</td>
											<td class="td_center"><font color="#ff8000"> <strong>¥<%=order[8]%></strong>
											</font></td>
											<td class="td_center"><font color="#ff8000"> <strong>¥<%=order[9]%></strong>
											</font></td>
											<td class="td_center"><%=order[6].substring(0, 19)%></td>
											<td class="td_center"><%=order[7].substring(0, 19)%></td>
											<td class="td_center"><%=order[10]%></td>
											<td class="td_center">
												<form
													action="<%=basePath%>servlet/OrderServlet?method=storeSearchOrderDetial&orderId=<%=order[0]%>&carId=<%=order[4]%>"
													method="post">
													<input type="submit" value="order detail"
														class="ext_btn ext_btn_submit">
												</form>

											</td>

										</tr>

										<%
												}
												}
											%>


									</table>
								</div>
							</div>

							<div style="margin: 30px;">
								<%=request.getAttribute("pageTool")%></div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	;
	! function() {
		laydate( {
			elem :'#demo'
		})
	}();
</script>
</body>
</html>
