<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cuc.model.SysAdmin"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	SysAdmin admin = (SysAdmin) session.getAttribute("admin");
	if (admin == null) {
		response
				.getWriter()
				.write(
						"<script language =javascript>window.open('../member/login.jsp','_top')</script>");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admins</title>
<link rel="stylesheet" href="<%=basePath%>businessStore/css/common.css">
<link rel="stylesheet" href="<%=basePath%>businessStore/css/style.css">
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>businessStore/js/jquery.SuperSlide.js"></script>
<script type="text/javascript">
	$( function() {
		$(".sideMenu").slide( {
			titCell :"h3",
			targetCell :"ul",
			defaultIndex :0,
			effect :'slideDown',
			delayTime :'500',
			trigger :'click',
			triggerTime :'150',
			defaultPlay :true,
			returnDefault :false,
			easing :'easeInQuint',
			endFun : function() {
				scrollWW();
			}
		});
		$(window).resize( function() {
			scrollWW();
		});
	});
	function scrollWW() {
		if ($(".side").height() < $(".sideMenu").height()) {
			$(".scroll").show();
			var pos = $(".sideMenu ul:visible").position().top - 38;
			$('.sideMenu').animate( {
				top :-pos
			});
		} else {
			$(".scroll").hide();
			$('.sideMenu').animate( {
				top :0
			});
			n = 1;
		}
	}

	var n = 1;
	function menuScroll(num) {
		var Scroll = $('.sideMenu');
		var ScrollP = $('.sideMenu').position();
		/*alert(n);
		alert(ScrollP.top);*/
		if (num == 1) {
			Scroll.animate( {
				top :ScrollP.top - 38
			});
			n = n + 1;
		} else {
			if (ScrollP.top > -38 && ScrollP.top != 0) {
				ScrollP.top = -38;
			}
			if (ScrollP.top < 0) {
				Scroll.animate( {
					top :38 + ScrollP.top
				});
			} else {
				n = 1;
			}
			if (n > 1) {
				n = n - 1;
			}
		}
	}
</script>
</head>
<body>
	<div class="top">
		<div id="top_t">
			<div id="logo" class="fl"></div>
			<div id="photo_info" class="fr">
				<div id="photo" class="fl">
					<a href="<%=basePath%>sysAdmin/SysAdminInfo.jsp" target="content"><img
						src="<%=basePath%>businessStore/images/a.png" alt="" width="60"
						height="60"> </a>
				</div>
				<div id="base_info" class="fr">
					<div class="help_info">
						<a href="1" id="hp">&nbsp;</a> <a href="2" id="gy">&nbsp;</a> <a
							href="<%=basePath%>servlet/SysAdminServlet?method=logout"
							id="out">&nbsp;</a>
					</div>
					<div class="info_center">
						<%=admin.getSNo()%>
						<!-- <span id="nt">通知</span><span><a href="#" id="notice">0</a>
							</span> -->
					</div>
				</div>
			</div>
		</div>
		<div id="side_here">
			<div id="side_here_l" class="fl"></div>
			<div id="here_area" class="fl">current location：</div>
		</div>
	</div>
	<div class="side">
		<div class="sideMenu" style="margin: 0 auto">
			<h3>Members Manage</h3>
			<ul>

				<li id="li1"><a id="a1"
					href="<%=basePath%>servlet/SysAdminServlet?method=pageShowAllMemberInfo"
					target="content"> Membership List </a></li>

				<li id="li2"><a id="a2"
					href="<%=basePath%>sysAdmin/AddMemberInfo.jsp" target="content">
						Add Membership</a></li>
			</ul>
			<h3>Business Manage</h3>
			<ul>

				<li><a
					href="<%=basePath%>servlet/SysAdminServlet?method=ShowAllStore"
					target="content"> Business Info</a></li>

				<li><a href="<%=basePath%>sysAdmin/AddStoreInfo.jsp"
					target="content"> Add Business</a></li>
			</ul>
			<h3>Rental Car Manage</h3>
			<ul>

				<li><a href="<%=basePath%>servlet/CarServlet?method=ShowAllCar"
					target="content"> Add Rental Car</a></li>


				<li><a
					href="<%=basePath%>servlet/CarServlet?method=sysAdminJumpToAddCarInfo"
					target="content"> Add Car</a></li>
			</ul>
			<!-- <h3>
					Vehicle Operations Management
				</h3>
				<ul>
					<li>
						Out of shop
					</li>
					<li>
						In-store return
					</li>
				</ul> -->
			<h3>Orders Manage</h3>
			<ul>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysSearchAllOrder"
					target="content">All Orders</a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysSearchDaiZhiFuOrder"
					target="content">To be paid</a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysSearchDaiChuCheOrder"
					target="content"> Waiting for departure</a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysSearchRetalingOrder"
					target="content"> Leasing</a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysSearchDaiHuanCheOrder"
					target="content"> Waiting for return</a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysShowFinishedOrder"
					target="content">Finish orders </a></li>
				<li><a
					href="<%=basePath%>servlet/OrderServlet?method=sysShowCancelOrder"
					target="content">Cancel </a></li>
			</ul>

			<%-- <h3>Experience message</h3>
			<ul>

				<li><a id="a11"
					href="<%=basePath%>servlet/SysAdminServlet?method=pageShowAllMessage"
					target="content"> All Experience</a></li>
			</ul> --%>

			<h3>Lease insurance</h3>
			<ul>

				<li><a
					href="<%=basePath%>servlet/SysAdminServlet?method=ShowAllInsurance"
					target="content"> Browse rental insurance</a></li>

				<li><a href="<%=basePath%>sysAdmin/AddInsuranceInfo.jsp"
					target="content"> Add rental insurance</a></li>
			</ul>
			<h3>Statistics and analysis</h3>
			<ul>
				<li><a
					href="<%=basePath%>servlet/StoreProfitServlet?method=showDayStoreProfit"
					target="content">Business operation</a></li>
				<li><a
					href="<%=basePath%>servlet/RegisterServlet?method=showDayRegister"
					target="content">User development</a></li>
				<li><a
					href="<%=basePath%>servlet/CarRentalServlet?method=showDayCarRental"
					target="content">Vehicle rental</a></li>
			</ul>
		</div>
	</div>
	<div class="main">
		<iframe id="content" src="/CarRentalOnline/WelcomePage.jsp"
			frameborder="no" scrolling="auto" width="100%" height="auto"
			allowtransparency="true" name="content"></iframe>
	</div>
	<div class="bottom">
		<div id="bottom_bg">copyright</div>
	</div>
	<div class="scroll">
		<a href="javascript:;" class="per" onclick="menuScroll(1);"></a> <a
			href="javascript:;" class="next" onclick="menuScroll(2);"></a>
	</div>
	<script type="text/javascript">
	$("#a1").click( function() {
		$("#a1 li").attr("class", "on");
		$("#a2 li").removeClass("on");
	});
	$("#a2").click( function() {
		$("#a1 li").removeClass("on");
		$("#a2 li").attr("class", "on");
	});
</script>
</body>
</html>