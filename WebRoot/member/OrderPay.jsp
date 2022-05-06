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
					<span></span> Order submitted successfully!
				</div>
				<div class="pay-help">
					Please take the car with you <span>Valid ID card, driver's
						license copy, personal credit card</span>
				</div>
			</div>
			<%
					Order order = (Order) session.getAttribute("order");
				%>
			<div id="divOrderInfo" class="payment-detail">
				<span class="pay-order">order num:<%=order.getOrderId()%></span> <span
					class="pay-type">payment method: online payment</span> <span
					class="pay-price">Total price of orders:<em>￥<%=order.getTotalMoney()%></em>(only
					accept bank card payment, not cash)
				</span>
			</div>
			<div class="payment-remark highlight no-margin">
				<p>Please complete the payment within 30 minutes, otherwise the
					order will be cancelled automatically.</p>
			</div>
			<div class="payment-link">
				<a href="<%=basePath %>member/welcome.jsp" title="home">home</a> <a
					href="<%=basePath %>member/memberInfoCenter.jsp" title="View order">View
					order</a>
			</div>
		</div>
		<!--后台下单隐藏-->

	</div>
	<!--支付信息-->
	<!--网上支付链接-->
	<!--在线支付TAB-->
	<div class="pay-online-wrap">
		<div class="pay-online-tabbox">
			<div class="pay-online-title">Choose payment method</div>
			<div class="pay-online-tab tab-wyzf active">E-currency payment
			</div>
		</div>
		<div class="pay-online-box">
			<!--网银支付-->
			<div class="paybox1" id="J_bankbox">
				<ul class="bank-list">
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_pay_01.png"
							alt="Alipay">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_pay_03.png"
							alt="Cai Fu Tong">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_pay_04.png"
							alt="Quick money">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_01.png"
							alt="招商银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_02.png"
							alt="中国工商银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_03.png"
							alt="中国建设银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_04.png"
							alt="中国农业银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_05.png"
							alt="中国银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_06.png"
							alt="交通银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_07.png"
							alt="上海浦东发展银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_08.png"
							alt="中国民生银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_09.png"
							alt="深圳发展银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_10.png"
							alt="广发银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_11.png"
							alt="中国光大银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_12.png"
							alt="中信银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_13.png"
							alt="兴业银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_14.png"
							alt="上海银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_15.png"
							alt="宁波银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_16.png"
							alt="杭州银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_17.png"
							alt="平安银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_18.png"
							alt="北京农村商业银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_19.png"
							alt="中国邮政储蓄银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_20.png"
							alt="富滇银行">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_21.png"
							alt="VISA">
					</label></li>
					<li><label> <input name="paytype" value=""
							type="radio"> <img
							src="<%=basePath%>member/images/payImages/finish_bank_22.png"
							alt="MasterCard">
					</label></li>
				</ul>
				<div class="payment-btnbox">
					<a href="<%=basePath %>servlet/OrderServlet?method=orderPay"
						title="Confirm payment" class="thickbox" type="button">Confirm
						payment</a>
				</div>
			</div>
		</div>
	</div>


	</div>

	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
