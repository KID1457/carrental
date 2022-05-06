<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.cuc.model.Order"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=basePath%>member/css/secondCommon.css" rel="stylesheet">
<link href="<%=basePath%>member/css/Thirdstep.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="payment-wrap">
		<!--支付信息-->
		<div class="payment-info-box">
			<div class="payment-info">
				<div class="pay-success">
					<span></span> Order payment succeeded
				</div>
				<div class="pay-help">
					Please take your valid ID card, <span>driver's license and
						credit card with you when you pick up the car</span>
				</div>
			</div>
			<%
					Order order = (Order) session.getAttribute("order");
				%>
			<div id="divOrderInfo" class="payment-detail">

				<span class="pay-type">Payment method: online payment</span> <span
					class="pay-price">Total price of orders:<em>￥<%=order.getTotalMoney()%></em>(Only
					accept bank card payment, not cash）
				</span>
			</div>
			<div class="payment-remark highlight no-margin">
				<p>Please pick up the car at our store within the specified
					time, otherwise the order will be cancelled automatically</p>
			</div>
			<div class="payment-link">
				<a href="http://www.1hai.cn/" title="Back to home page">Back to
					home page</a> <a
					href="https://my.1hai.cn/Order/MyOrders/Detail?sqs=BiursZPWExD0WHS3hEXfXil/shXSDpQE"
					title="View order">View order</a>
			</div>
		</div>

	</div>


	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
