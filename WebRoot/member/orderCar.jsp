<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.cuc.model.FrequentContacts"%>
<%@page import="com.cuc.dao.IBusinessStoreDAO"%>
<%@page import="com.cuc.dao.imp.BusinessStoreDAO"%>
<%@page import="com.cuc.model.BusinessStore"%>
<%@page import="com.cuc.util.CommonUtil"%>
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

<title>Scheduled vehicle</title>

<link href="<%=basePath%>member/css/secondCommon.css" rel="stylesheet">
<link href="<%=basePath%>member/css/Step2.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="Header.jsp" />
	<!--存放内容-->
	<%
			String fromStoreName = (String) session
					.getAttribute("fromStoreName"); 
			String beginTime = (String) session.getAttribute("beginTime");
			String tostoreName = (String) session.getAttribute("tostoreName");
			String endTime = (String) session.getAttribute("endTime");
		%>
	<div class="step2-progress-box" style="margin-top: 20px;"></div>
	<div class="step2-wrap" style="margin-left: 100px;">
		<form action="<%=basePath%>servlet/OrderServlet?method=sendOrder"
			method="post">
			<div class="step2-box">
				<div class="step2-box-left">
					<div class="order-info-box">
						<%
								Map<String, Object> carMap = (Map<String, Object>) request
										.getAttribute("carMap");
							%>

						<div class="car-image-box">
							<input type="hidden" value="<%=carMap.get("carId")%>"
								name="carId"> <input type="hidden"
								value="<%=carMap.get("carMoney")%>" name="carMoney"> <input
								type="hidden"
								value="<%=CommonUtil.differentDays(beginTime + ":00", endTime
							+ ":00")%>"
								name="day"> <img
								src="<%=basePath%>uploadFiles/car/<%=carMap.get("carImage")%>"
								alt="<%=carMap.get("carBrand")%><%=carMap.get("carType")%>">
							<span>Lease term： <em> <%=CommonUtil.differentDays(beginTime + ":00", endTime
							+ ":00")%>
							</em>days
							</span>
						</div>
						<div class="store-info-box">
							<div class="car-name">
								<a href="javascript:history.back(-1);" title="Return to modify">Return
									to modify</a>
								<%=carMap.get("carBrand")%><%=carMap.get("carType")%>
								<span><%=carMap.get("carGear")%><%=carMap.get("carDisplacement")%>
									/<%=carMap.get("carForm")%> / <%=carMap.get("seat")%>seats </span>
							</div>
							<ul>
								<li><span class="store-title">Pick up location</span><span
									class="store-title">Return location</span></li>
								<li>
									<%
											IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
											BusinessStore fromStore = storeDAO
													.getByBusinessStoreName(fromStoreName);
											BusinessStore toStore = storeDAO
													.getByBusinessStoreName(tostoreName);
										%> <input type="hidden" value="<%=fromStore.getStoreId()%>"
									name="fromStoreId"> <input type="hidden"
									value="<%=toStore.getStoreId()%>" name="toStoreId"> <span>Pick
										up a car store：<%=fromStoreName%></span><span>Return shop：<%=tostoreName%></span>
								</li>
								<li><span>Picking time：<%=beginTime%></span><span>Return
										time：<%=endTime%></span></li>
								<li><span>Pick up address：<%=fromStore.getStoreAddress()%></span><span>Return
										address：<%=toStore.getStoreAddress()%></span></li>
								<li style="padding-top: 5px;"><span class="store-title">Order
										description：</span></li>
								<li class="rule-toggle"><a href="javascript:void(0);"
									id="gz">Withdrawal rule</a>Unlimited kilometers, overtime fee
									of 50 yuan / hour, pre authorization of 5000 yuan (refundable),
									illegal deposit of 2000 yuan (refundable).</li>
								<li style="color: red;">reminder: <a
									href="http://www.1hai.cn/help/xxsm.aspx#clfs-FJ"
									title="restricted city rules" style="color: red;"
									target="_blank">Click to read restricted city rules</a>
								</li>
							</ul>
						</div>
					</div>


					<div class="payment-box">
						<div class="title">Payment method</div>
						<div class="payment-list">
							<ul>
								<li><label> <input name="pay" id="OnLine"
										checked="checked" class="ba-analysis" type="radio">
										Online payment <span> Please complete online payment
											within 1 hour</span>
								</label></li>
							</ul>
						</div>
					</div>
					<div class="service-box">
						<div class="title">Other services</div>
						<div class="service-list">
							<ul>
								<%
										ArrayList<String[]> insuranceList = (ArrayList<String[]>) request
												.getAttribute("insuranceList");
										for (int i = 0; i < insuranceList.size(); i++) {
											String[] insurance = insuranceList.get(i);
											if(i==0){
											
									%>
								<li><input name="insurancePrice"
									value="<%=insurance[0]%>-<%=insurance[2]%>-<%=insurance[1]%>"
									class="ba-analysis" type="checkbox" checked="checked">
									<div class="service-name">
										<%=insurance[1]%>
									</div>
									<div class="service-price">
										￥<%=insurance[2]%>
										<span></span>
									</div>
									<div class="service-des">
										<%=insurance[3]%>
									</div></li>
								<%}else{ %>
								<li><input name="insurancePrice"
									value="<%=insurance[0]%>-<%=insurance[2]%>-<%=insurance[1]%>"
									class="ba-analysis" type="checkbox">
									<div class="service-name">
										<%=insurance[1]%>
									</div>
									<div class="service-price">
										￥<%=insurance[2]%>
										<span></span>
									</div>
									<div class="service-des">
										<%=insurance[3]%>
									</div></li>
								<%} %>
								<%
										}
									%>

							</ul>
						</div>
					</div>
					<div class="invoice-box" id="invoiceList">

						<div class="remark-box">
							<div class="title">Top contacts</div>
							<div class="remark-list">
								<p>
									<%
											ArrayList<FrequentContacts> contactsList = (ArrayList<FrequentContacts>) request
													.getAttribute("contactsList");
											for (int i = 0; i < contactsList.size(); i++) {
												FrequentContacts contacts = contactsList.get(i);
										%>
									<input type="radio" name="contactsId" id="contactsId"
										value="<%=contacts.getFrequentId()%>"> <label
										for="radio"> <%=contacts.getFrequentName()%>
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<%
											}
										%>
								</p>

							</div>
						</div>
						<div class="remark-box">
							<div class="title">Remarks information</div>
							<div class="remark-list">
								<%
										String[] isSongCheShangMen = (String[])session.getAttribute("isSongCheShangMen");
										if(isSongCheShangMen!=null){
									 %>
								<p>
									Delivery address：<input type="text"
										name="songCheShangMenAddress"
										style="width: 300px; height: 30px;" />
								</p>
								<%} %>
								<%
										String[] isShangMenQuChe = (String[])session.getAttribute("isShangMenQuChe");
										if(isShangMenQuChe!=null){
										
									 %>
								<p>
									Pick up address：<input type="text" name="shangMenQuCheAddress"
										style="width: 300px; height: 30px;" />
								</p>
								<%} %>
								<p>Add remarks</p>
								<textarea class="remark-txt1" id="remark1" name="remark"
									cols="80" rows="6"></textarea>
							</div>
						</div>
						<center>

							<button type="submit"
								style="background-image: url('<%=basePath%>member/images/tijiaodingdan.png');width:185px;
										height:54px;">

							</button>
						</center>
					</div>
				</div>
			</div>
		</form>
		<div class="footer">
			<div class="footer-box">
				<div class="footer-left">
					<p>
						<a href="http://www.1hai.cn/aboutus.aspx" rel="nofollow"
							target="_blank">About hi</a> | <a
							href="http://www.1hai.cn/job/index.aspx" target="_blank">Recruiting
							talents</a> | <a href="http://www.1hai.cn/activity/mobile.aspx"
							target="_blank">Mobile client</a> | <a
							href="http://www.1hai.cn/help/index.aspx?from=foot"
							rel="nofollow" target="_blank">Help center</a> | <a
							href="http://www.1hai.cn/help/advice.aspx" rel="nofollow"
							target="_blank">Recommended area</a> | <a
							href="http://www.1hai.cn/help/contactus.aspx" rel="nofollow"
							target="_blank">Contact us</a> | <a
							href="http://www.1hai.cn/more/link.aspx" rel="nofollow"
							target="_blank">Friendship links</a> | &nbsp;Complaint
						channel:400-821-1608&nbsp;
					</p>
					<p>
						Copyright © 2020 <a href="http://www.miibeian.gov.cn/"
							target="_blank" rel="nofollow">ccc</a>
					</p>
				</div>
			</div>
		</div>
		<script src="<%=basePath%>member/script/jquery"></script>
		<script src="<%=basePath%>member/script/secondStep"></script>
</body>
</html>
