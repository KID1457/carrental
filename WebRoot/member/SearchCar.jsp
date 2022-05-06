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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="<%=basePath%>member/css/zc1css.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>member/css/base.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript"
	src="<%=basePath%>member/script/jquery-1.7.2.min.js"></script>



<style>
body, td, th {
	font-family: Arial, "微软雅黑";
}

body {
	background: #f3f5f5;
}

.pplist {
	padding: 10px;
}

.pplist div {
	margin: 0px 20px 10px 0px;
	width: 120px;
	display: block;
	float: left
}

.btys {
	float: right;
	margin-right: 20px;
	width: 100px;
	border: none;
	height: 30px;
	background: #de1921;
	color: #fff;
	text-align: center;
	line-height: 30px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	cursor: pointer;
	margin-top: 30px;
}
</style>
<title>短租自驾</title>

</head>

<body>
	<style type="text/css">
#nav {
	margin: 5px;
	width: 970px;
	height: 50px;
	margin-top: 33px;
	margin-left: 65px;
	line-height: 60px;
	font-size: 18px;
	font-family: "微软雅黑", Arial, Helvetica, sans-serif;
}

#nav ul {
	float: left;
	width: 650px;
}

#nav li {
	position: relative;
	list-style: none;
	width: 98px;
	float: left;
	height: 50px;
}

#nav li a {
	padding: 5px;
	width: 90px;
	color: #000000;
	text-decoration: none;
	height: 38px;
	display: block;
	text-align: center;
	line-height: 40px;
}

#nav li a:hover {
	line-height: 40px;
	height: 38px;
	border-bottom: 2px #FF0000 solid;
}

#nav ul ul {
	position: absolute;
	top: 50px;
	left: 0px;
	background: #FFF;
	visibility: hidden;
}

#nav ul :hover ul {
	visibility: visible;
	width: 100px;
	z-index: 9999999999;
}

#nav ul ul li a {
	display: block;
	width: 90px;
	margin: 0;
	height: 38px;
	float: left;
}

#nav table {
	position: absolute;
	top: 0;
	left: 0;
}

hr {
	display: none;
}
</style>
	<jsp:include page="Header.jsp" />
	<table style="margin: auto" align="center" border="0" width="1100">
		<tbody>
			<tr>
				<td align="center"><img style="margin-top: 10px;"
					src="<%=basePath%>member/images/searchCarBG.jpg"></td>
			</tr>
			<tr>
				<td>
					<div class="main_wrap">
						<div class="carlist" style="margin: auto; width: 1116px">
							<div class="orderinfo"
								style="height: auto; padding-bottom: 30px;">
								<div class="title">The information you have booked is as
									follows</div>
								<div class="forminfo">
									<div class="col_2">
										<div class="nameinfo">
											Picking time：<%=session.getAttribute("beginTime")%>
										</div>
									</div>
									<div class="col_2">
										<div class="nameinfo">
											Return time：<%=session.getAttribute("endTime")%>
										</div>
									</div>
									<div class="col_2">
										<div class="nameinfo">
											Pick up a car store：<%=session.getAttribute("fromStoreName")%>
										</div>
									</div>
									<div class="col_2">
										<div class="nameinfo">
											Return shop：<%=session.getAttribute("tostoreName")%>
										</div>
									</div>

									<%-- <div class="nameinfo "
											style="width: 100%; margin-top: 20px; text-align: center">
											<a id="showtext2" href="<%=basePath%>member/welcome.jsp">Modify booking information</a>
										</div> --%>
								</div>

								<p class="alert" style="display: block;">Friendly tips:
									please arrange your driving time reasonably</p>

								<!--预订信息结束-->

							</div>
							<form name="form1" id="form1" method="post"
								action="<%=basePath%>servlet/CarServlet?method=searchByCondition">
								<div class="brand" style="height: auto;">
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" width="1019">
										<tbody>
											<tr>
												<td class="nameinfo pplist" align="right" valign="top"
													width="92">brand：</td>
												<td class="pplist" align="left" valign="top" width="927">
													<div>
														<label> <input name="pp" value="All"
															checked="checked" type="checkbox"> &nbsp;All
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Audi"
															type="checkbox"> &nbsp;Audi
														</label>
													</div>
													<div>
														<label> <input name="pp" value="BMW"
															type="checkbox"> &nbsp;BMW
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Baojun"
															type="checkbox"> &nbsp;Baojun
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Porsche"
															type="checkbox"> &nbsp;Porsche
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Bent"
															type="checkbox"> &nbsp;Bent
														</label>
													</div>
													<div>
														<label> <input name="pp" value="BYD"
															type="checkbox"> &nbsp;BYD
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Benz"
															type="checkbox"> &nbsp;Benz
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Honda"
															type="checkbox"> &nbsp;Honda
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Peugeot"
															type="checkbox"> &nbsp;Peugeot
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Buick"
															type="checkbox"> &nbsp;Buick
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Havel"
															type="checkbox"> &nbsp;Havel
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Changan"
															type="checkbox"> &nbsp;Changan
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Dongfeng"
															type="checkbox"> &nbsp;Dongfeng
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Volkswagen"
															type="checkbox"> &nbsp;Volkswagen
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Toyota"
															type="checkbox"> &nbsp;Toyota
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Ford"
															type="checkbox"> &nbsp;Ford
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Haima"
															type="checkbox"> &nbsp;Haima
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Hongqi"
															type="checkbox"> &nbsp;Hongqi
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Geely"
															type="checkbox"> &nbsp;Geely
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Jaguar"
															type="checkbox"> &nbsp;Jaguar
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Cadillac"
															type="checkbox"> &nbsp;Cadillac
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Suzuki"
															type="checkbox"> &nbsp;Suzuki
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Mazda"
															type="checkbox"> &nbsp;Mazda
														</label>
													</div>
													<div>
														<label> <input name="pp" value="KIA"
															type="checkbox"> &nbsp;KIA
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Skoda"
															type="checkbox"> &nbsp;Skoda
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Citroen"
															type="checkbox"> &nbsp;Citroen
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Chevrolet"
															type="checkbox"> &nbsp;Chevrolet
														</label>
													</div>
													<div>
														<label> <input name="pp" value="Nissan"
															type="checkbox"> &nbsp;Nissan
														</label>
													</div>
												</td>
											</tr>
											<tr>
												<td class="nameinfo pplist" align="right" valign="top">
													price：</td>
												<td class="pplist" align="left" valign="top">
													<div>
														<label> <input name="hyj" value="All"
															checked="checked" type="checkbox"> &nbsp;All
														</label>
													</div>
													<div>
														<label> <input name="hyj" value="0-100"
															type="checkbox"> &nbsp;0-100
														</label>
													</div>
													<div>
														<label> <input name="hyj" value="100-200"
															type="checkbox"> &nbsp; 100-200
														</label>
													</div>
													<div>
														<label> <input name="hyj" value="200-400"
															type="checkbox"> &nbsp;200-400
														</label>
													</div>
													<div>
														<label> <input name="hyj" value="400-800"
															type="checkbox"> &nbsp;400-800
														</label>
													</div>
												</td>
											</tr>
											<tr>
												<td class="nameinfo pplist" align="right" valign="top">
													carGear：</td>
												<td class="pplist" align="left" valign="top">
													<div>
														<label> <input name="bsx" value="All"
															checked="checked" type="checkbox"> &nbsp;All
														</label>
													</div>
													<div>
														<label> <input name="bsx" value="Auto"
															type="checkbox"> &nbsp;Auto
														</label>
													</div>
													<div>
														<label> <input name="bsx" value="Manual"
															type="checkbox"> &nbsp;Manual
														</label>
													</div>

												</td>
											</tr>
											<tr>
												<td class="nameinfo pplist" align="right" valign="top">
													seat：</td>
												<td class="pplist" align="left" valign="top">
													<div>
														<label> <input name="cx" value="0"
															checked="checked" type="checkbox"> &nbsp;All
														</label>
													</div>
													<div>
														<label> <input name="cx" value="2" type="checkbox">
															&nbsp;2
														</label>
													</div>
													<div>
														<label> <input name="cx" value="4" type="checkbox">
															&nbsp;4
														</label>
													</div>
													<div>
														<label> <input name="cx" value="5" type="checkbox">
															&nbsp;5
														</label>
													</div>
													<div>
														<label> <input name="cx" value="7" type="checkbox">
															&nbsp;7
														</label>
													</div>
												</td>
											</tr>

											<tr>
												<td colspan="2" style="text-align: center; height: 40px;"
													align="center" valign="middle"><input class="btys"
													value="select" type="submit"></td>
											</tr>
										</tbody>
									</table>
									<p>&nbsp;</p>
								</div>
							</form>
							<div class="carinfo">
								<ul class="filter_car">
									<li class="default choose" id="js_DefaultSort">type</li>
								</ul>
								<div class="pick_car">
									<ul id="CarList">
										<%
												ArrayList<String[]> carList = (ArrayList<String[]>) request
														.getAttribute("carList");
												if (carList == null && carList.size() == 0) {
											%>
										<%
												} else {
													for (int i = 0; i < carList.size(); i++) {
														String[] car = carList.get(i);
											%>


										<li style="z-index: 213;">
											<div class="car_img">
												<a href="http://www.1zc.net.cn/detail.php?id=26"><img
													src="<%=basePath%>uploadFiles/car/<%=car[14]%>"
													height="107" width="182"> </a>
											</div>
											<div class="attribute">
												<span class="car_name"><a
													href="http://www.1zc.net.cn/detail.php?id=26"><strong><%=car[3]%><%=car[4]%></strong>
												</a> </span>
												<div class="clear"></div>
												<p class="attr">
													<%=car[7]%>
													<%=car[8]%>|<%=car[10]%>|<%=car[11]%>seats
												</p>
												<div class="clear"></div>
												<ul class="property">
													<li style="z-index: 223;">Basic insurance： <span
														class="red">40</span> yuan/day
													</li>
													<li style="border-bottom-style: none; z-index: 221;">
														Limited kilometres： <span class="red">Unlimited</span>
														kilometre
													</li>
												</ul>
											</div>
											<div class="price" style="position: relative; z-index: 98">
												<div class="priceinner">
													<div class="day">
														￥ <span class="red"><%=car[6]%></span>/day
													</div>
												</div>
											</div>
											<form
												action="<%=basePath%>servlet/CarServlet?method=orderCar&carId=<%=car[0]%>"
												method="post">
												<input name="按钮" class="book js_btnBooking "
													style="border: none;" value="Immediate Booking"
													type="submit">
											</form>
										</li>

										<%
												}
												}
											%>

									</ul>
								</div>
							</div>
							<dir style="margin: 20px;">
								<%
String pageTool = (String)request.getAttribute("pageTool");
if(pageTool!=null){
 %>
								<%=request.getAttribute("pageTool")%>
								<%} %>
							</dir>


						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="footer">
		<div class="footer-box">
			<div class="footer-left">
				<p>
					<a href="http://www.1hai.cn/aboutus.aspx" rel="nofollow"
						target="_blank">About hi</a> | <a
						href="http://www.1hai.cn/job/index.aspx" target="_blank">Recruiting
						talents</a> | <a href="http://www.1hai.cn/activity/mobile.aspx"
						target="_blank">Mobile client</a> | <a
						href="http://www.1hai.cn/help/index.aspx?from=foot" rel="nofollow"
						target="_blank">Help center</a> | <a
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

</body>
</html>
