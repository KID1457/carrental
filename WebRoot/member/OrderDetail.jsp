<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.cuc.dao.IFrequentContactsDAO"%>
<%@page import="com.cuc.dao.imp.FrequentContactsDAO"%>
<%@page import="com.cuc.util.CommonUtil"%>
<%@page import="com.cuc.dao.IBusinessStoreDAO"%>
<%@page import="com.cuc.dao.imp.BusinessStoreDAO"%>
<%@page import="com.cuc.model.BusinessStore"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="<%=basePath%>member/css/Global.css" rel="stylesheet">
<script type="text/javascript">
	function del() {
		var msg = "Cancel?";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>

<body>

	<%
	Map<String, Object> orderMap =	(Map<String, Object> )request.getAttribute("orderMap");
	Map<String, Object> carMap =	(Map<String, Object> )request.getAttribute("carMap");
	ArrayList<String[]> insuranceList =	(ArrayList<String[]> )request.getAttribute("insuranceList");
 		%>
	<div>
		<div id="content">
			<div class="content-bd">
				<div class="col-main">

					<div class="order-status status-orange">
						<h2>
							<%=orderMap.get("orderState") %>
						</h2>
						<div class="dashed-border"></div>
						<p>
							orderNum：<%=orderMap.get("orderId") %>
							<%
IFrequentContactsDAO contactsDAO = new FrequentContactsDAO();
Map<String,Object> frequentMap =  contactsDAO.getFrequentByFrequentId(Integer.parseInt(orderMap.get("frequentId").toString() ));
 %>
							<span> | </span>Renter：<%=frequentMap.get("frequentName") %>
							<span> | </span>Payment method: online payment <span>|</span>Payment
							status：<%=orderMap.get("orderState") %>
						</p>
					</div>
					<div class="ui-bfc mod car-info">
						<div class="ui-bfc-hd car-info-img">
							<img
								src="<%=basePath %>uploadFiles/car/<%=carMap.get("carImage") %>">
							<p>
								Lease term：
								<%
String beginTime = orderMap.get("collectionTime").toString();
String endTime = orderMap.get("returnTime").toString();
double diffDay = CommonUtil.differentDays(beginTime,endTime);

 %>
								<span class="orange"><%=diffDay %></span>days
							</p>
						</div>
						<div class="ui-bfc-bd car-info-detail">
							<h1>
								<%=carMap.get("carBrand") %><%=carMap.get("carType") %>
								<span><%=carMap.get("carGear") %>/<%=carMap.get("carDisplacement") %>/<%=carMap.get("compartment") %>/<%=carMap.get("seat") %>&nbsp;&nbsp;</span>
							</h1>
							<table width="100%">
								<tbody>
									<tr>
										<th colspan="2">Pick up location</th>
										<th colspan="2">Return location</th>
									</tr>
									<tr>
										<td width="12%">Pick up a car store：</td>
										<%
											int fromStoreId =  Integer.parseInt(orderMap.get("fromStoreId").toString());
											int toStoreId =  Integer.parseInt(orderMap.get("toStoreId").toString());
											IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
											BusinessStore fromStore =  storeDAO.getByBusinessStoreId(fromStoreId);
												BusinessStore toStore =  storeDAO.getByBusinessStoreId(toStoreId);
											 %>
										<td class="cell-cnt" width="40%"><%=fromStore.getStoreName() %>
										</td>
										<td width="12%">Return shop：</td>
										<td class="cell-cnt" width="40%"><%=toStore.getStoreName() %>
										</td>
									</tr>
									<tr>
										<td>Picking time：</td>
										<td class="cell-cnt"><%=beginTime %></td>
										<td>Return time：</td>
										<td class="cell-cnt"><%=endTime %></td>
									</tr>

									<tr>
										<td>Pick up location：</td>
										<td class="cell-cnt"><%=fromStore.getStoreAddress()%></td>
										<td>Return location：</td>
										<td class="cell-cnt"><%=toStore.getStoreAddress()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /order-info -->
					<div class="mod price-info" style="margin-bottom: 40px;">
						<h2 class="hd">Details of expenses</h2>
						<div class="bd">
							<div class="price-info-item">
								<div class="price-info-item-hd">
									<h3>
										Vehicle rental fee and store service fee <span
											class="insurance-count">(prepaid)</span>
									</h3>
									<p>
										<span class="ui-rmb">¥</span><%=Float.parseFloat(orderMap.get("price").toString())*diffDay %>
									</p>
								</div>
								<div class="dashed-border db-gray-normal"></div>
							</div>

							<%
									if(insuranceList!=null){
									for(int i = 0;i<insuranceList.size();i++){
									String[] insurance = insuranceList.get(i);
								
								 %>


							<div class="price-info-item">
								<div class="price-info-item-hd">
									<h3>
										<%=insurance[1] %>

									</h3>
									<p>
										<span class="ui-rmb">¥</span><%=insurance[2] %>
									</p>
								</div>
								<div class="dashed-border db-gray-normal"></div>
							</div>
							<%}} %>
							<%
String songCheShangMenAddress = orderMap.get("songCheShangMenAddress").toString();
if(songCheShangMenAddress.length()!=0){
 %>
							<div class="price-info-item">
								<div class="price-info-item-hd">
									<h3>
										Delivery address： <span class="insurance-count"> <span
											class="ui-rmb"><%=orderMap.get("songCheShangMenAddress") %></span>
										</span>

									</h3>
									<p></p>
								</div>
								<div class="dashed-border db-gray-normal"></div>
							</div>
							<%} %>
							<%
String shangMenQuCheAddress = orderMap.get("shangMenQuCheAddress").toString();
if(shangMenQuCheAddress.length()!=0){
 %>
							<div class="price-info-item">
								<div class="price-info-item-hd">
									<h3>
										Pick up address: <span class="insurance-count"> <span
											class="ui-rmb"><%=orderMap.get("shangMenQuCheAddress") %></span>
										</span>

									</h3>
									<p></p>
								</div>
								<div class="dashed-border db-gray-normal"></div>
							</div>
							<%} %>

							<div class="price-info-item">
								<div class="price-info-item-hd">
									<h3>
										Remarks： <span class="insurance-count"> <span
											class="ui-rmb"><%=orderMap.get("remark") %></span>
										</span>

									</h3>
									<p></p>
								</div>
								<div class="dashed-border db-gray-normal"></div>
							</div>

							<div class="price-info-item"></div>
							<div class="price-info-total">
								<span class="txt">Total：</span> <sup class="ui-rmb"> ¥ </sup>
								<%=orderMap.get("totalMoney") %>
							</div>
						</div>
						<div class="prepay-tips">

							<p>
								<%
									if(orderMap.get("orderState").equals("To be paid")){
									 %>
								Please complete the payment within half an hour, otherwise the
								order will be cancelled automatically.
								<%}else{ %>
								Thank you very much for your reservation. Have a safe journey!
								<%} %>

							</p>

						</div>
					</div>
					<%
						if(orderMap.get("orderState").equals("To be paid")){
						 %>
					<div id="prepayCountDown">
						Time to final payment: <span>00</span> h <span>58</span> m <span>58</span>
						s
					</div>
					<div class="order-operate">
						<a id="btn-pay" class="ui-btn ui-btn-orange-l btn-pay"
							href="<%=basePath %>servlet/OrderServlet?method=jumpOrderPayPage&orderId=<%=orderMap.get("orderId") %>"><span>Pay
								Now</span> </a> <a id="btn-cancel" class="ui-btn ui-btn-white-l btn-cancel"
							href="<%=basePath %>servlet/OrderServlet?method=cancelOrder&orderId=<%=orderMap.get("orderId") %>&carId=<%=carMap.get("carId") %>"
							onclick='javascript:return del()'><span>Cancel</span> </a>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>

	<!-- Script -->
	<script src="<%=basePath%>member/script/jquery"></script>
	<script src="<%=basePath%>member/script/jquery.js"></script>
	<script>
		<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		long c= CommonUtil.calMin(nowTime, orderMap.get("orderTime").toString());
		%>
	var mins = 30-<%=c%>;
	function addMinites(mins) {
		var nowMils = new Date().valueOf();
		var untilMils = nowMils + mins * 1000 * 60;
		return new Date(untilMils);
	}

	Date.prototype.Format = function(fmt) { //author: meizz
		var o = {
			"M+" :this.getMonth() + 1, //month
			"d+" :this.getDate(), //day
			"h+" :this.getHours(), //hour
			"m+" :this.getMinutes(), //minute
			"s+" :this.getSeconds(), //second
			"q+" :Math.floor((this.getMonth() + 3) / 3),
			"S" :this.getMilliseconds()
		//millisecond
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}
	var finalTime = addMinites(mins).Format('yyyy/MM/dd hh:mm:ss');
	$('#prepayCountDown')
			.countdown(
					finalTime,
					function(event) {
						$(this)
								.html(
										event.strftime('There's still time to make the final payment:' +
										//'<span>%D</span> days ' +
												'<span>%H</span> h ' + '<span>%M</span> m ' + '<span>%S</span> s'));
					}).on('finish.countdown', function(event) {
					$(this).hide();
					$('.order-operate').hide();
					//$(this).html('This offer has expired!')
					//  .parent().addClass('disabled');

				});
</script>
</body>
</html>
