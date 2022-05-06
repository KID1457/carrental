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
<base href="<%=basePath%>">

<title>About us</title>

<link href="<%=basePath%>member/yizuche/public.css" type="text/css"
	rel="stylesheet">

<link href="<%=basePath%>member/yizuche/index.css" type="text/css"
	rel="stylesheet">

<link href="<%=basePath%>member/yizuche/css.css" rel="stylesheet"
	type="text/css">

</head>

<body>

	<!-- 头部 -->
	<jsp:include page="Header.jsp" />
	<!--head end -->

	<div class="about_banner">
		<img src="<%=basePath%>member/yizuche/1447905061.jpg" width="1920"
			height="420">
	</div>
	<div class="whitebg">
		<div class="iconbox">
			<div class="about_hd">
				<h2>Info</h2>
			</div>
			<div class="about_bd">
				<div class="about_company_pic mt40">
					<img src="<%=basePath%>member/yizuche/video.jpg" title="公司简介">
				</div>
				<div class="about_company_text">
					<p>As a leading car rental service provider in Fujian, Auto
						Service Co., Ltd. provides professional and high-quality car
						service for customers with its strong strength. As a comprehensive
						automobile service company, it integrates special vehicle service,
						official vehicle, enterprise vehicle, rent and purchase, airport
						transfer, business investigation, conference reception, wedding
						concierge, driver rental and other multi-functional services, In
						2015, we successfully undertook the Organizing Committee of the
						first National Youth Games and the special vehicle service project
						for athletes, and won high praise from all walks of life.



						Professional driver team, full escort, with all-round,
						high-quality excellent service, let customers truly feel the
						company's service-oriented business philosophy. Based on the
						characteristics of Fujian local market, we have developed many
						sets of leading automobile dispatching management systems,
						supplemented by GPS global positioning, intelligent data analysis
						and processing technology, and established a strong central data
						service center, striving to exert the resource management ability
						to the utmost, realizing the powerful function of operating in
						Fuzhou and radiating across the country, so that customers can
						enjoy it easily A pleasant way to rent a car. "Car will arrive,
						service first" is the commitment of easy rent people.
						"Standardization, kinship, individuation and specialization" is
						the unchangeable service principle of the renter.</p>
				</div>
			</div>
			<ul class="about_num fn_cle">
				<li>Breakthrough of registered users on that day <span>500</span>
				</li>
				<li>The company owns more vehicles than <span>200</span>
				</li>
				<li>Online reservation of the day <span>200</span>
				</li>
				<li>Company team employees exceed <span>150</span>
				</li>
			</ul>
		</div>
	</div>
	<!--公司理念-->
	<div class="philosophybg">
		<div class="iconbox philosophy">
			<div class="about_hd">
				<h2>Concept</h2>
				<p style="color: #666">COMPANY PHILOSOPHY</p>
			</div>
			<div class="about_bd">
				<ul>
					<li>
						<dl>
							<dt>
								<img src="<%=basePath%>member/yizuche/company01.png">
							</dt>
							<dd class="philo-tit">Mission</dd>
							<dd class="philo-con">The subversion of Internet financial
								ecosystem, the most revolutionary creation!</dd>
						</dl>
					</li>
					<li class="philo-limt">
						<dl>
							<dt>
								<img src="<%=basePath%>member/yizuche/company02.png">
							</dt>
							<dd class="philo-tit">Idea</dd>
							<dd class="philo-con">Define the current financing of
								venture capital in the Internet era, the highest standard!</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<img src="<%=basePath%>member/yizuche/company03.png">
							</dt>
							<dd class="philo-tit">Blueprint</dd>
							<dd class="philo-con">Let Internet Finance era all current
								financing, the highest income!</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="whitebg team">
		<div class="about_hd">
			<h2>Team</h2>
			<p>COMPANY TEAM</p>
		</div>
		<div class="iconbox" style="position: relative;">
			<div class="team_hd">

				<ul>
					<li><img src="<%=basePath%>member/yizuche/memo7.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo3.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo1.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo6.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo5.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo2.png"> <i></i>
					</li>
					<li><img src="<%=basePath%>member/yizuche/memo4.png"> <i></i>
					</li>
				</ul>

			</div>
		</div>

	</div>
	<div class="whitebg">
		<div class="iconbox team">
			<div class="about_hd">
				<h2>Demeanor</h2>
				<p>TEAM STYLE</p>
			</div>
			<div class="company-showcase-con">
				<ul>
					<li><img src="<%=basePath%>member/yizuche/team01.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team02.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team03.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team04.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team05.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team06.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team07.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
					<li><img src="<%=basePath%>member/yizuche/team08.png">
						<div class="dask">
							<p>Conference Hall</p>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<!--成长历程-->
	<div class="bluebg" style="display: none;">
		<div class="iconbox our_history">
			<div class="about_hd">
				<h2>Growth course</h2>
				<p>Our history</p>
			</div>
			<div class="about_bd">
				<ul>
					<li>
						<p class="time">2013,6</p>
						<p class="text">Fuzhou e-Car dream team was founded by two
							senior partners of the post-80s generation from China's largest
							car rental company</p>
					</li>
					<li>
						<p class="time">2014,1</p>
						<p class="text">The official name of Fuzhou e-Car rental
							implies that every whale financial elite who works hard for the
							trust of whales, like the biggest wizard on the earth, is
							fighting in the blue ocean and has the greatest Internet dream</p>
					</li>
					<li>
						<p class="time">2014,1</p>
						<p class="text">2014,1,In the history of online finance,
							Fuzhou e-Car dream team formally abandoned the mainstream market,
							the latest first independent research and development of Internet
							gene, bank guarantee, bank credit endorsement of debt fund.
							Today's interest settlement, the highest income baby business
							model</p>
					</li>
					<li>
						<p class="time">2014,9</p>
						<p class="text">With the joint efforts of 50 Fuzhou e-Car
							financial elites, it took 15 months to complete the research and
							development of whale treasure trading platform. Whale finance
							relies on the wholly-owned subsidiary of Ping An Bank, the
							largest Internet trading platform in China</p>
					</li>
					<li>
						<p class="time">2014,11</p>
						<p class="text">After the three-month five-star test of
							financial system security, "whale treasure" app officially
							appeared in the app store and Android Market with the concept of
							extreme, simple and easy to use</p>
					</li>
					<li>
						<p class="time">2014,12</p>
						<p class="text">Shengbao has developed into the largest
							creditor's right holding institution of the wholly-owned
							subsidiary of Ping An Bank</p>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<center>
		<div style="clear: both;">
			<p>Copyright© 2022 All Rights Reserved.</p>
		</div>
	</center>
</body>
</html>
