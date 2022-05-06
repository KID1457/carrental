<%@page import="com.cuc.model.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cuc.dao.IMessageDAO"%>
<%@page import="com.cuc.dao.imp.MessageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cuc.dao.IBusinessStoreDAO"%>
<%@page import="com.cuc.dao.imp.BusinessStoreDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%

	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>member/shenzhou/style1.3.17.7.css">
<link href="<%=basePath%>member/shenzhou/zc_global.css" rel="stylesheet"
	type="text/css">
<title>CarRentalOnline~</title>
<link href="<%=basePath%>member/shenzhou/index.css" rel="stylesheet"
	type="text/css">

<link href="<%=basePath%>member/css/jquery.slideBox.css"
	rel="stylesheet" type="text/css" />
<script src="<%=basePath%>member/laydate/laydate.js"></script>
<script src="<%=basePath%>member/script/jquery-1.7.1.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>member/script/jquery.slideBox.js"
	type="text/javascript"></script>
<script>
	jQuery(function($) {
		$('#demo1').slideBox({
			hideClickBar : false,
		});
		$('#demo2').slideBox({
			direction : 'top',
			duration : 0.3,
			easing : 'linear',
			delay : 5,
			startIndex : 1
		});
		$('#demo3').slideBox({
			duration : 0.3,
			easing : 'linear',
			delay : 5,
			hideClickBar : false,
			clickBarRadius : 10
		});
		$('#demo4').slideBox({
			hideBottomBar : true
		});
	});;
	!function() {
		laydate({
			elem : '#demo'
		})
	}();
	
	
	function getStoreName(){
	
		var procit = document.getElementById("procit");
		var prov=procit[procit.selectedIndex].value; 
		var toprocity = document.getElementById("toprocity");
		var newstr = prov.split(" ");
	
	
		var url = "<%=basePath%>/servlet/StoreServlet?method=getStoreName&province="+newstr[0]+"&city="+newstr[1];
	//	var url = "<%=basePath%>/servlet/StoreServlet?method=getStoreName&province="+encodeURI(newstr[0])+"&city="+encodeURI(encodeURI(newstr[1]));
		$.get(url,function(data,status){
      		var str="<select>"; 
      		var data = data.split("\n");
      		for(var i=0;i<data.length-1;i++) 
		    {         
		    	str=str+"<option value="+data[i]+">"+data[i]+"</option>";     
		    } 
      		str=str+"</select>"; 
      		document.getElementById("storeName").innerHTML=str; 
      		document.getElementById("tostoreName").innerHTML=str; 
    	});
    	
    	var optionNum=procit.selectedIndex;
    	$("#toprocity option:eq("+optionNum+")").attr("selected","selected");
	}
	
	function getStoreName2(){
		var procit = document.getElementById("toprocity");
		var prov=procit[procit.selectedIndex].value; 
		
		var newstr = prov.split(" ");
		
		var url = "<%=basePath%>/servlet/StoreServlet?method=getStoreName&province="+newstr[0]+"&city="+newstr[1];
		$.get(url,function(data,status){
      		var str="<select>"; 
      		var data = data.split("\n");
      		for(var i=0;i<data.length-1;i++) 
		    {         
		    	str=str+"<option>"+data[i]+"</option>";     
		    } 
      		str=str+"</select>"; 
      		document.getElementById("tostoreName").innerHTML=str; 
    	});
    	
	}
	
//	$(document).ready(function(){
//  $("button").click(function(){
//    $.get("<%=basePath%>/servlet/StoreServlet?method=getStoreName&province=Fujian&city=FuZhou",function(data,status){
 //     alert("数据：" + data + "\n状态：" + status);
//    });
//  });
//});
	
</script>
<link href="<%=basePath%>member/css/idx" rel="stylesheet">
</head>
<body>

	<jsp:include page="Header.jsp" />
	<!--head end -->

	<div id="demo1" class="slideBox"
		style="width: 100%; height: 100%; margin: 0 auto;">
		<ul class="items">
			<li><a href="#" title="Rent thousands of new cars"><img
					width="100%" src="<%=basePath%>member/images/shenzhoulunbo1.jpg">
			</a></li>
			<li><a href="#" title="Charge 100 to 20"><img width="100%"
					src="<%=basePath%>member/images/shenzhoulunbo2.jpg"> </a></li>
			<li><a href="#"
				title="New users can enjoy 150 yuan meeting gift"><img
					width="100%" src="<%=basePath%>member/images/shenzhoulunbo3.jpg">
			</a></li>
			<li><a href="#"
				title="Collect and deliver the car at 10 yuan freezing point"><img
					width="100%" src="<%=basePath%>member/images/shenzhoulunbo4.jpg">
			</a></li>
		</ul>
	</div>

	<form action="<%=basePath%>servlet/CarServlet?method=searchCar"
		method="post">
		<div style="top: 100px;" class="zc-search">
			<div class="zc_index_select">
				<div>

					<div class="indexContents cur">
						<div class="zc_index_dz">
							<div class="h20 p-re zc-iptbox" id="search_short_tips"></div>
							<dl class="zc_item_cont fl">
								<dt>
									<strong>Pick Up Car</strong> <label id="shangmensongche_label"
										class="songchediv"> <input type="checkbox"
										name="isSongCheShangMen" value="scsm" /> home delivery
									</label>
								</dt>
								<dd>
									<select name="procit" id="procit" onchange="getStoreName()"
										style="width: 190px; height: 30px" id="fromCityName"
										autocomplete="on" link-input="fromCityId" maxlength="10">
										<option value="0">--City--</option>
										<%
												IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
												ArrayList<String[]> cityList = storeDAO.getAllBusinessCity();
												if (cityList != null && cityList.size() != 0) {
													for (int i = 0; i < cityList.size(); i++) {
														String[] pc = cityList.get(i);
											%>
										<option value="<%=pc[0]%> <%=pc[1]%>">
											<%=pc[0]%><%=pc[1]%>
										</option>
										<%
												}
												}
											%>
									</select>
								</dd>
								<dd class="">
									<select name="storeName" id="storeName"
										style="width: 190px; height: 30px" name="fromStore"
										id="fromStore" autocomplete="on" link-input="fromCityId"
										maxlength="10">

									</select>
									<div class="areaSelection hide" style="display: none;"></div>
								</dd>
								<dd class="h15"></dd>
								<dd class="p-re">
									<%
											SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
											
										%>
									<input name="beginDate" style="width: 190px; height: 30px"
										value="<%=df.format(new Date())%>" id="beginDate"
										class="laydate-icon" onclick="laydate()">
								</dd>
								<dd>
									<select style="width: 190px; height: 30px" name="beginHour"
										id="beginHour" autocomplete="on" link-input="fromCityId"
										maxlength="10">
										<option value="08:30">08:30</option>
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
										<option value="19:00">19:00</option>
										<option value="19:30">19:30</option>
										<option value="20:00">20:00</option>
										<option value="20:30">20:30</option>
										<option value="21:00">21:00</option>

									</select>

									<div class="sz_time" style="display: none;">
										<ol class="clearfix xbox">
											<li class="graybor">
												<div class="iptSeup areaup"></div>
											</li>
											<li class="bluebor">&nbsp;</li>
										</ol>
										<div class="sz_timeinfo clearfix fromtime"></div>
									</div>

								</dd>
							</dl>
							<dl class="zc_item_cont fr">
								<dt>
									<strong>Return car</strong> <label id="shangmequche_label"
										class="quchediv"> <input type="checkbox"
										name="isShangMenQuChe" value="smqc" /> Door picking
									</label>
								</dt>
								<dd>
									<select style="width: 190px; height: 30px" name="toprocity"
										onchange="getStoreName2()" id="toprocity" autocomplete="on"
										link-input="fromCityId" maxlength="10">
										<option value="0">--City--</option>
										<%
												if (cityList != null && cityList.size() != 0) {
													for (int i = 0; i < cityList.size(); i++) {
														String[] pc = cityList.get(i);
											%>
										<option value="<%=pc[0]%> <%=pc[1]%>">
											<%=pc[0]%><%=pc[1]%>
										</option>
										<%
												}
												}
											%>
									</select>
								</dd>
								<dd>
									<select name="tostoreName" style="width: 190px; height: 30px"
										id="tostoreName" autocomplete="on" link-input="fromCityId"
										maxlength="10">

									</select>
									<div class="areaSelection hide" style="display: none;"></div>
								</dd>
								<dd class="h15"></dd>
								<dd class="p-re">
									<input name="endDate" style="width: 190px; height: 30px"
										value="<%=df.format(new Date())%>" id="beginDate"
										class="laydate-icon" onclick="laydate()">
								</dd>
								<dd>
									<select style="width: 190px; height: 30px" name="endHour"
										id="endHour" autocomplete="on" link-input="fromCityId"
										maxlength="10">
										<option value="08:30">08:30</option>
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
										<option value="18:00">18:00</option>
										<option value="18:30">18:30</option>
										<option value="19:00">19:00</option>
										<option value="19:30">19:30</option>
										<option value="20:00">20:00</option>
										<option value="20:30">20:30</option>
										<option value="21:00">21:00</option>
									</select>
									<div class="sz_time" style="display: none;">
										<ol class="clearfix xbox">
											<li class="graybor"><br> <br></li>
											<li class="bluebor">（）&nbsp; <br> <br>
											</li>
										</ol>
										<div class="sz_timeinfo clearfix totime"></div>
									</div>
								</dd>
							</dl>
							<div style="margin-bottom: 30px" class="h20 clear"></div>
							<div class="clear">
								<input type="submit" value="Pick the car immediately"
									class="s_btn" title="Pick the car immediately"
									id="short_goselectcar">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div style="position: absolute; top: 550px" class="zc_brand">
		<div class="zc_main">
			<ul>
				<li><i class="zc-yecx"></i>
					<p>
						<b>100+</b>Vehicle type
					</p></li>
				<li><i class="zc-yewd"></i>
					<p>
						<b>1000+</b>Dots
					</p></li>
				<li><i class="zc-yecxn"></i>
					<p>
						<b>100%</b>Automobile insurance
					</p></li>
				<li><i class="zc-yelc"></i>
					<p>unlimited mileage</p></li>
			</ul>
		</div>
		<div class="main">
			<div class="main-box">
				<div style="width: 1300px;" class="main-box-left">
					<!--热门车型-->
					<div class="hotcar-box">
						<div class="title">Popular models</div>
						<ul style="height: 280px;">
							<li style="height: 330px"><em class="hotcar-icon"></em>
								<div class="hotcar-img">
									<a href="#" target="_blank"> <img
										style="width: 285px; height: 205px"
										src="<%=basePath%>/member/images/0be54569-2d4d-4490-ada9-f3472469cecd.jpg">
									</a>
								</div>
								<div style="margin-left: 20px" class="hotcar-des">
									<div style="float: left" class="car-name">
										<a style="color: #666; font-size: 16px; font-family: '微软雅黑';"
											href="#" target="_blank">Toyota Prado</a>
									</div>
									<div style="float: left; clear: both" class="car-type">
										Sport control suv|5 seats</div>
								</div></li>
							<li><em class="hotcar-icon"></em>
								<div class="hotcar-img">
									<a href="#" target="_blank"> <img
										style="width: 285px; height: 205px"
										src="<%=basePath%>/member/images/NewLavida.png">
									</a>
								</div>
								<div style="margin-left: 20px" class="hotcar-des">
									<div style="float: left; clear: both" class="car-name">
										<a style="color: #666; font-size: 16px; font-family: '微软雅黑';"
											href="#" target="_blank">Volkswagen Langyi</a>
									</div>
									<div style="float: left; clear: both" class="car-type">
										Comfortable|3compartment |5seats</div>
								</div></li>
							<li><em class="hotcar-icon"></em>
								<div class="hotcar-img">
									<a style="color: #666" href="#" target="_blank"> <img
										style="width: 285px; height: 205px"
										src="<%=basePath%>/member/images/48c9f0ad-89e4-4785-af72-60119e218504.jpg">
									</a>
								</div>
								<div style="margin-left: 20px" class="hotcar-des">
									<div style="float: left; clear: both" class="car-name">
										<a style="color: #666; font-size: 16px; font-family: '微软雅黑';"
											href="#" target="_blank">Land Rover discovery</a>
									</div>
									<div style="float: left; clear: both" class="car-type">
										Luxury SUV seat 5</div>
								</div></li>
							<li><em class="hotcar-icon"></em>
								<div class="hotcar-img">
									<a href="#" target="_blank"> <img
										style="width: 285px; height: 205px"
										src="<%=basePath%>/member/images/3008.png">
									</a>
								</div>
								<div style="margin-left: 20px" class="hotcar-des">
									<div style="float: left; clear: both" class="car-name">
										<a style="color: #666; font-size: 16px; font-family: '微软雅黑';"
											href="#" target="_blank">Peugeot 3008</a>
									</div>
									<div style="float: left; clear: both" class="car-type">
										Fashion sports SUV seats</div>
								</div></li>
						</ul>
						<div class="car-list-brands">
							<a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/cc821522-8f47-4a44-969c-8967afd8b5c5.jpg">
							</span>FAW Mazda</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/71e5afaa-ee14-4ce7-bfeb-d46d1e805a48.jpg">
							</span>Volkswagen</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/8be9cae8-da73-45f9-8e94-c2f090a5aab9.jpg">
							</span>Volkswagen Skoda</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/b40b9276-db53-4897-81c7-f7bd9b08abc0.jpg">
							</span>PEUGEOT</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/f018db1a-2802-4e49-8c6b-9eafc6756815.jpg">
							</span>MG</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/roewe.jpg"> </span>Roewe</a><a
								href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/5b9423e6-7ef1-45e3-8f3a-73c31838007c.jpg">
							</span>Honda</a><a href="#" target="_blank"><span><img
									src="<%=basePath%>/member/images/chevrolet.jpg"> </span>Chevrolet</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tys-box">
			<div class="title">
				Experience theory <a
					href="<%=basePath%>servlet/MessageServlet?method=welShowMessage"></a>
			</div>
			<div class="tys-list">
				<ul style="height: 120px">
					<%
							IMessageDAO messMemberDAO = new MessageDAO();
							ArrayList<String[]> list = messMemberDAO.searchAllMessageByState(1,
									4, 1);
							if (list != null && list.size() != 0) {
								for (int i = 0; i < list.size(); i++) {
									String content = list.get(i)[5];
						%>
					<li><em></em>
						<div class="tys-txt">
							<%=content.subSequence(0, 61)%>...
						</div></li>
					<%
							}
							}
						%>

				</ul>
			</div>
		</div>
	</div>

	<center>
		<div style="clear: both; margin-top: 800px">
			<p>Copyright©2020 All Rights Reserved.</p>
		</div>
	</center>
</body>
</html>