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
<base href="<%=basePath%>">
<link href="<%=basePath%>member/css/secondCommon.css" rel="stylesheet">
<link href="<%=basePath%>member/css/Step2.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="Header.jsp" />
	<%
			Order order = (Order) session.getAttribute("order");
		%>

	<div class="step2-wrap" style="margin-left: 100px; margin-top: 10px;">
		<div class="step2-box-right price-box-float" id="priceall">
			<div class="price-detail">
				<div class="title">Details of expenses</div>
				<ul>
					<li class="line-clear" id="baseRatePrice"><em
						class="price-mid "> ￥<%=order.getPrice()
							* Float.parseFloat((request.getAttribute("day")
									.toString()))%><i class="price-drop-open"></i><i
							class="price-drop-close"></i>
					</em>Vehicle rental fee and store service fee <span>Vehicle
							rental<%=order.getPrice()%>yuan * <%=request.getAttribute("day")%>days
					</span></li>


					<%
							String[] insurancePrice = (String[]) request
									.getAttribute("insurancePrices");
								if(insurancePrice!=null){
							for (int i = 0; i < insurancePrice.length; i++) {
								String[] ip = insurancePrice[i].split("-");
						%>

					<li><em class="price-mid ">￥<%=ip[1]%></em><%=ip[2]%></li>
					<%
							}}
						%>
					<li id="promotionPriceList" class="hidelable"></li>
				</ul>
				<div class="price-box" id="totalAmount">
					<span class="sub-load hidelable" id="priceloading"></span><span
						class="price-txt" id="priceTitle">Total:</span><span
						class="price-total" id="priceTotal"><em>￥</em><%=order.getTotalMoney()%></span>
				</div>
				<div class="price-btnbox">
					<a href="<%=basePath %>servlet/OrderServlet?method=insertOrder"
						title="place order" id="btnSubmit" style="margin: 10px;">place
						order</a> <a href="javascript:history.back(-1);"
						title="Return to modify" id="btnSubmit" style="margin: 10px;">Return
						to modify</a>

				</div>
				<div class="price-help">
					<p
						style="border-bottom: 1px dashed #EB5A01; padding-bottom: 5px; margin-bottom: 5px;">
						<b>Please pay within 30 minutes, otherwise the order will be
							cancelled automatically</b>
					</p>
					<p
						style="display: none; border-bottom: 1px dashed #EB5A01; padding-bottom: 5px; margin-bottom: 5px;">
						<b>This form can participate in the annual cash back activity.
							You need to pay the whole amount of the form. The returned amount
							(50% of the basic car rental fee) will be returned to your one
							card bank account 3-5 working days after returning the car</b>
					</p>
					For the first time, please use my credit card, my second-generation
					ID card and my valid local driving license. <br> (in addition
					to credit card, airport / HSR first rent customers must also
					provide their boarding pass or HSR ticket of the day)
					<p>This order is only for the customer's car rental appointment
						registration. After submitting this order, the customer needs to
						go through the specific car rental procedures in the store, and
						the specific rights and obligations shall be subject to the signed
						contract.</p>
				</div>
				<div id="LimitRemind"
					style="border-top: 1px solid #ccc; color: #EB5A01; background: #FFFCD2; padding: 15px; line-height: 20px; display: none;"></div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
	<!--footer-->

	<script src="<%=basePath%>member/script/jquery"></script>
	<script src="<%=basePath%>member/script/secondStep"></script>

</body>
</html>
