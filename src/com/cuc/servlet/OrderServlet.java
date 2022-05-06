package com.cuc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cuc.dao.ICarDAO;
import com.cuc.dao.IInsuranceOrderDAO;
import com.cuc.dao.IOrderDAO;
import com.cuc.dao.imp.CarDAO;
import com.cuc.dao.imp.InsuranceOrderDAO;
import com.cuc.dao.imp.OrderDAO;
import com.cuc.model.BusinessStore;
import com.cuc.model.InsuranceOrder;
import com.cuc.model.Member;
import com.cuc.model.Order;
import com.cuc.util.CommonUtil;
import com.cuc.util.PageUtil;

public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");

		System.out.println("OrderServlet->" + method);

		if (method == null) {
			method = "";
		}

		if (method.equals("sendOrder")) {
			sendOrder(request, response);
		} else if (method.equals("insertOrder")) {
			insertOrder(request, response);
		} else if (method.equals("orderPay")) {
			orderPay(request, response);
		} else if (method.equals("MemberSearchOrder")) {
			MemberSearchOrder(request, response);
		} else if (method.equals("orderDetail")) {
			orderDetail(request, response);
		} else if (method.equals("cancelOrder")) {
			cancelOrder(request, response);
		} else if (method.equals("orderPay2")) {
			orderPay2(request, response);
		} else if (method.equals("jumpOrderPayPage")) {
			jumpOrderPayPage(request, response);
		} else if (method.equals("storeSearchAllOrder")) {
			storeSearchAllOrder(request, response);
		} else if (method.equals("storeShowCancelOrder")) {
			storeShowCancelOrder(request, response);
		} else if (method.equals("storeShowFinishedOrder")) {
			storeShowFinishedOrder(request, response);
		} else if (method.equals("storeSearchDaiHuanCheOrder")) {
			storeSearchDaiHuanCheOrder(request, response);
		} else if (method.equals("storeSearchDaiZhiFuOrder")) {
			storeSearchDaiZhiFuOrder(request, response);
		} else if (method.equals("storeSearchDaiChuCheOrder")) {
			storeSearchDaiChuCheOrder(request, response);
		} else if (method.equals("storeSearchRetalingOrder")) {
			storeSearchRetalingOrder(request, response);
		} else if (method.equals("storeSearchOrderDetial")) {
			storeSearchOrderDetial(request, response);
		} else if (method.equals("outCar")) {
			outCar(request, response);
		} else if (method.equals("returnCar")) {
			returnCar(request, response);
		} else if (method.equals("sysSearchAllOrder")) {
			sysSearchAllOrder(request, response);
		} else if (method.equals("sysSearchDaiZhiFuOrder")) {
			sysSearchDaiZhiFuOrder(request, response);
		} else if (method.equals("sysSearchDaiChuCheOrder")) {
			sysSearchDaiChuCheOrder(request, response);
		} else if (method.equals("sysSearchRetalingOrder")) {
			sysSearchRetalingOrder(request, response);
		} else if (method.equals("sysSearchDaiHuanCheOrder")) {
			sysSearchDaiHuanCheOrder(request, response);
		} else if (method.equals("sysShowFinishedOrder")) {
			sysShowFinishedOrder(request, response);
		} else if (method.equals("sysShowCancelOrder")) {
			sysShowCancelOrder(request, response);
		} else if (method.equals("storeSearchCanReturnOrder")) {
			storeSearchCanReturnOrder(request, response);
		} else if (method.equals("sysSearchAllOrderByCondition")) {
			sysSearchAllOrderByCondition(request, response);
		} else if (method.equals("storeSearchAllOrderByCondition")) {
			storeSearchAllOrderByCondition(request, response);
		} else if (method.equals("storeSearchAllCanReturnOrderByCondition")) {
			storeSearchAllCanReturnOrderByCondition(request, response);
		}
	}

	private void storeSearchAllCanReturnOrderByCondition(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BusinessStore store = (BusinessStore) request.getSession()
				.getAttribute("store");


		int storeId = store.getStoreId();
		String orderId = request.getParameter("orderId");

		if (orderId == null) {
			orderId = "";
		}

		String beginTime = request.getParameter("beginTime");
		if (beginTime == null) {
			beginTime = "";
		}

		String endTime = request.getParameter("endTime");
		if (endTime == null) {
			endTime = "";
		}

		IOrderDAO orderDAO = new OrderDAO();

		int rsCount = Integer.parseInt(orderDAO
				.getCanReturnOrderRsCount(storeId, orderId,
						 beginTime, endTime)[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		ArrayList<String[]> orderList = orderDAO
				.searchCanReturnOrderByCondition(storeId, orderId,
						beginTime, endTime, pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);

		request.getRequestDispatcher("/businessStore/ReturnCar.jsp").forward(
				request, response);

	}

	private void storeSearchAllOrderByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		BusinessStore store = (BusinessStore) request.getSession()
				.getAttribute("store");

		String jumpUrl = request.getParameter("jumpUrl");
		String orderState = request.getParameter("orderState");

		if (orderState == null) {
			orderState = "";
		}

		int storeId = store.getStoreId();
		String orderId = request.getParameter("orderId");

		if (orderId == null) {
			orderId = "";
		}

		String beginTime = request.getParameter("beginTime");
		if (beginTime == null) {
			beginTime = "";
		}

		String endTime = request.getParameter("endTime");
		if (endTime == null) {
			endTime = "";
		}

		IOrderDAO orderDAO = new OrderDAO();

		int rsCount = Integer.parseInt(orderDAO
				.getAllStoreOrderByConditionRsCount(storeId, orderId,
						orderState, beginTime, endTime)[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		ArrayList<String[]> orderList = orderDAO
				.searchAllStoreOrderByCondition(storeId, orderId, orderState,
						beginTime, endTime, pageSize, currentPage);

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);

		request.getRequestDispatcher("/businessStore/" + jumpUrl).forward(
				request, response);

	}

	private void sysSearchAllOrderByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String mark = request.getParameter("mark");

		String orderState = null;

		if ("1".equals(mark)) {// 查询所有状态的订单
			orderState = "";
		} else if ("2".equals(mark)) {
			orderState = "To be paid";
		} else if ("3".equals(mark)) {
			orderState = "Waiting for departure";
		} else if ("4".equals(mark)) {
			orderState = "Leasing";
		} else if ("5".equals(mark)) {
			orderState = "Waiting for return";
		} else if ("6".equals(mark)) {
			orderState = "Finish orders";
		} else if ("7".equals(mark)) {
			orderState = "Cancel";
		}

		String orderId = request.getParameter("orderId");

		if (orderId == null) {
			orderId = "";
		}

		String beginTime = "";
		beginTime = request.getParameter("beginTime");
		if (beginTime == null) {
			beginTime = "";
		}

		String endTime = "";
		endTime = request.getParameter("endTime");
		if (endTime == null) {
			endTime = "";
		}

		IOrderDAO orderDAO = new OrderDAO();

		int rsCount = Integer.parseInt(orderDAO.getAllOrderByConditionRsCount(
				orderId, orderState, beginTime, endTime)[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		ArrayList<String[]> orderList = orderDAO.searchAllOrderByCondition(
				orderId, orderState, beginTime, endTime, pageSize, currentPage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);
		request.setAttribute("mark", mark);

		request.getRequestDispatcher("/sysAdmin/ShowAllOrderList.jsp").forward(
				request, response);

	}

	private void storeSearchCanReturnOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		BusinessStore store = (BusinessStore) request.getSession()
				.getAttribute("store");

		IOrderDAO orderDAO = new OrderDAO();

		int rsCount = Integer.parseInt(orderDAO.getRsCountCanReturnCar(store
				.getStoreId())[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		ArrayList<String[]> orderList = orderDAO.searchCanReturnCar(store
				.getStoreId(), pageSize, currentPage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);

		request.getRequestDispatcher("/businessStore/ReturnCar.jsp").forward(
				request, response);

	}

	private void sysShowCancelOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "Cancel");

	}

	private void sysShowFinishedOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "Finish orders");

	}

	private void sysSearchDaiHuanCheOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "Waiting for return");

	}

	private void sysSearchRetalingOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "Leasing");

	}

	private void sysSearchDaiChuCheOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "Waiting for departure");

	}

	private void sysSearchDaiZhiFuOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "To be paid");

	}

	private void sysSearchAllOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		sysSearchAllOrderByState(request, response, "");

	}

	public void sysSearchAllOrderByState(HttpServletRequest request,
			HttpServletResponse response, String orderState)
			throws ServletException, IOException {

		IOrderDAO orderDAO = new OrderDAO();

		int rsCount = Integer
				.parseInt(orderDAO.getRsCountAllOrder(orderState)[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		ArrayList<String[]> orderList = orderDAO.searchAllOrder(orderState,
				pageSize, currentPage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);

		if (orderState.equals("")) {
			request.setAttribute("mark", "1");
		} else if (orderState.equals("To be paid")) {
			request.setAttribute("mark", "2");
		} else if (orderState.equals("Waiting for departure")) {
			request.setAttribute("mark", "3");
		} else if (orderState.equals("Leasing")) {
			request.setAttribute("mark", "4");
		} else if (orderState.equals("Waiting for return")) {
			request.setAttribute("mark", "5");
		} else if (orderState.equals("Finish orders")) {
			request.setAttribute("mark", "6");
		} else if (orderState.equals("Cancel")) {
			request.setAttribute("mark", "7");
		}

		request.getRequestDispatcher("/sysAdmin/ShowAllOrderList.jsp").forward(
				request, response);
	}

	private void returnCar(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// BusinessStore store = (BusinessStore) request.getSession()
		// .getAttribute("store");

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		// int carId = Integer.parseInt(request.getParameter("carId"));

		IOrderDAO orderDAO = new OrderDAO();
		// ICarDAO carDAO = new CarDAO();

		if (orderDAO.updateOrderState(orderId, "Finish orders")) {
			// if(carDAO.changeCarStore(carId, storeId))
			CommonUtil.showAlertMessage(response, "Success");
		}

	}

	private void outCar(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		/*
		 * 2. When the tenant payment is completed, the status of the order becomes to be shipped. 
		 * The store administrator logs in to the upper background, views the background, and carries out the car operation. 
		 * After that, the store where the vehicle is located will become tostorid, that is, the number of the car return store.
		 *  At this time, the status of the order becomes leasing.
		 */

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int carId = Integer.parseInt(request.getParameter("carId"));

		IOrderDAO orderDAO = new OrderDAO();
		ICarDAO carDAO = new CarDAO();

		if (orderDAO.updateOrderState(orderId, "Leasing")) {
			Map<String, Object> orderMap = orderDAO.getOrderByOrderId(orderId);

			int toStoreId = Integer.parseInt(orderMap.get("toStoreId")
					.toString());
			if (carDAO.changeCarStore(carId, toStoreId)) {
				CommonUtil.showAlertMessage(response, "Success!");

				searchOrderDetail(request, response, orderId, carId,
						"/businessStore/OrderDetail.jsp");
			} else {
				CommonUtil.showAlertMessage(response, "Fail!");
			}

		} else {
			CommonUtil.showAlertMessage(response, "Fail!");
		}

	}

	private void storeSearchOrderDetial(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int carId = Integer.parseInt(request.getParameter("carId"));

		if (request.getParameter("go") == null) {
			searchOrderDetail(request, response, orderId, carId,
					"/businessStore/OrderDetail.jsp");

		} else {
			searchOrderDetail(request, response, orderId, carId,
					"/businessStore/ReturnCarOrderDetail.jsp");
		}

	}

	private void storeSearchRetalingOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "Leasing", "ShowRentaingOrderList.jsp");

	}

	private void storeSearchDaiChuCheOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "Waiting for departure", "ShowDaiChuCheOrderList.jsp");

	}

	private void storeSearchDaiZhiFuOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "To be paid", "ShowDaiZhiFuOrderList.jsp");
	}

	private void storeSearchDaiHuanCheOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "Waiting for return",
				"ShowDaiHuanCheOrderList.jsp");

		// IOrderDAO orderDAO = new OrderDAO();
		//
		// BusinessStore store = (BusinessStore) request.getSession()
		// .getAttribute("store");
		//
		// int storeId = store.getStoreId();
		//
		// int rsCount = Integer.parseInt(orderDAO
		// .getRsCountDaiHuanCheOrderByToStoreId(storeId)[0].toString());
		//
		// int pageSize = 5;
		//
		// PageUtil util = new PageUtil(request);
		// util.setPageSize(pageSize);
		// util.setRsCount(rsCount);
		//
		// util.getPageCount();
		//
		// int currentPage = util.getCurrentPage();
		//
		// String pageTool = util.createPageTool(PageUtil.BbsImage);
		//
		// ArrayList<String[]> orderList = orderDAO
		// .searchDaiHuanCheOrderByToStoreId(storeId, pageSize,
		// currentPage);
		//
		// request.setAttribute("orderList", orderList);
		// request.setAttribute("pageTool", pageTool);
		//
		// request.getRequestDispatcher(
		// "/businessStore/ShowDaiHuanCheOrderList.jsp").forward(request,
		// response);
	}

	private void storeShowFinishedOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "Finish orders", "ShowFinishedOrderList.jsp");
	}

	private void storeShowCancelOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "Cancel", "ShowCancelOrderList.jsp");
	}

	private void storeSearchAllOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		searchStateOrder(request, response, "", "ShowAllOrderList.jsp");

		// IOrderDAO orderDAO = new OrderDAO();
		//
		// BusinessStore store = (BusinessStore) request.getSession()
		// .getAttribute("store");
		//
		// int storeId = store.getStoreId();
		//
		// int rsCount = Integer.parseInt(orderDAO
		// .getRsCountStoreAllOrder(storeId)[0].toString());
		//
		// int pageSize = 5;
		//
		// PageUtil util = new PageUtil(request);
		// util.setPageSize(pageSize);
		// util.setRsCount(rsCount);
		//
		// util.getPageCount();
		//
		// int currentPage = util.getCurrentPage();
		//
		// String pageTool = util.createPageTool(PageUtil.BbsImage);
		//
		// ArrayList<String[]> orderList = orderDAO.searchStoreAllOrder(storeId,
		// pageSize, currentPage);
		//
		// request.setAttribute("orderList", orderList);
		// request.setAttribute("pageTool", pageTool);
		//
		// request.getRequestDispatcher("/businessStore/ShowAllOrderList.jsp")
		// .forward(request, response);

	}

	public void searchStateOrder(HttpServletRequest request,
			HttpServletResponse response, String orderState, String jumpUrl)
			throws ServletException, IOException {

		IOrderDAO orderDAO = new OrderDAO();

		BusinessStore store = (BusinessStore) request.getSession()
				.getAttribute("store");

		int storeId = store.getStoreId();

		int rsCount = Integer.parseInt(orderDAO.getRsCountByStoreId(storeId,
				orderState)[0].toString());

		int pageSize = 5;

		PageUtil util = new PageUtil(request);
		util.setPageSize(pageSize);
		util.setRsCount(rsCount);

		util.getPageCount();

		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		ArrayList<String[]> orderList = orderDAO.getByStoreId(storeId,
				orderState, pageSize, currentPage);

		request.setAttribute("orderList", orderList);
		request.setAttribute("pageTool", pageTool);

		request.getRequestDispatcher("/businessStore/" + jumpUrl).forward(
				request, response);

	}

	private void jumpOrderPayPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		IOrderDAO orderDAO = new OrderDAO();
		Map<String, Object> orderMap = orderDAO.getOrderByOrderId(orderId);

		request.setAttribute("orderMap", orderMap);

		request.getRequestDispatcher("/member/OrderPay2.jsp").forward(request,
				response);

	}

	private void orderPay2(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		IOrderDAO orderDAO = new OrderDAO();

		if (orderDAO.updateOrderState(orderId, "Waiting for departure")) {
			Map<String, Object> orderMap = orderDAO.getOrderByOrderId(orderId);

			request.setAttribute("orderMap", orderMap);
			request.getRequestDispatcher("/member/OrderPaySuccess2.jsp")
					.forward(request, response);
		} else {
		}

	}

	private void cancelOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int carId = Integer.parseInt(request.getParameter("carId"));

		IOrderDAO orderDAO = new OrderDAO();
		if (orderDAO.updateOrderState(orderId, "Cancel")) {
			searchOrderDetail(request, response, orderId, carId,
					"/member/OrderDetail.jsp");
		} else {
			CommonUtil.showAlertMessage(response, "Fail");
		}

	}

	private void orderDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int carId = Integer.parseInt(request.getParameter("carId"));

		searchOrderDetail(request, response, orderId, carId,
				"/member/OrderDetail.jsp");

	}

	public void searchOrderDetail(HttpServletRequest request,
			HttpServletResponse response, int orderId, int carId, String jumpUrl)
			throws ServletException, IOException {

		IOrderDAO orderDAO = new OrderDAO();
		Map<String, Object> orderMap = orderDAO.getOrderByOrderId(orderId);

		ICarDAO carDAO = new CarDAO();
		Map<String, Object> carMap = carDAO.searchByCarId(carId);

		IInsuranceOrderDAO insuranceOrderDAO = new InsuranceOrderDAO();
		ArrayList<String[]> insuranceList = insuranceOrderDAO
				.searchInsuranceByOrderId(orderId);

		request.setAttribute("orderMap", orderMap);
		request.setAttribute("carMap", carMap);
		request.setAttribute("insuranceList", insuranceList);// "/member/OrderDetail.jsp"

		request.getRequestDispatcher(jumpUrl).forward(request, response);
	}

	private void MemberSearchOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Member member = (Member) request.getSession().getAttribute("member");

		IOrderDAO orderDAO = new OrderDAO();

		ArrayList<String[]> allOrderList = orderDAO.searchOrderByMemberId(
				member.getMemberId(), null);

		ArrayList<String[]> daiZhiFuOrderList = orderDAO.searchOrderByMemberId(
				member.getMemberId(), "To be paid");

		ArrayList<String[]> daiChuCheOrderList = orderDAO
				.searchOrderByMemberId(member.getMemberId(), "Waiting for departure");

		ArrayList<String[]> zuLinZhongOrderList = orderDAO
				.searchOrderByMemberId(member.getMemberId(), "Leasing");

		ArrayList<String[]> daiHuanCheOrderList = orderDAO
				.searchOrderByMemberId(member.getMemberId(), "Waiting for return");

		ArrayList<String[]> yiWanChengOrderList = orderDAO
				.searchOrderByMemberId(member.getMemberId(), "Finish orders");

		ArrayList<String[]> yiQuXiaoOrderList = orderDAO.searchOrderByMemberId(
				member.getMemberId(), "Cancel");

		request.setAttribute("allOrderList", allOrderList);
		request.setAttribute("daiZhiFuOrderList", daiZhiFuOrderList);
		request.setAttribute("daiChuCheOrderList", daiChuCheOrderList);
		request.setAttribute("zuLinZhongOrderList", zuLinZhongOrderList);
		request.setAttribute("daiHuanCheOrderList", daiHuanCheOrderList);
		request.setAttribute("yiWanChengOrderList", yiWanChengOrderList);
		request.setAttribute("yiQuXiaoOrderList", yiQuXiaoOrderList);

		request.getRequestDispatcher("/member/OrderList.jsp").forward(request,
				response);

	}

	// Order payment
	private void orderPay(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Order order = (Order) request.getSession().getAttribute("order");
		IOrderDAO orderDAO = new OrderDAO();

		if (orderDAO.updateOrderState(order.getOrderId(), "Waiting for departure")) {
			// Skip to order payment success page
			response
					.sendRedirect("/CarRentalOnline/member/OrderPaySuccess.jsp");
		} else {
			// No order payment failure
		}

	}

	// Adding an order
	private void insertOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Order order = (Order) request.getSession().getAttribute("order");
		String[] insurancePrices = (String[]) request.getSession()
				.getAttribute("insurancePrices");

		int length = insurancePrices.length;

		int[] insuranceId = new int[length];
		float[] insurancePrice = new float[length];

		for (int i = 0; i < length; i++) {
			String[] ip = insurancePrices[i].split("-");

			insuranceId[i] = Integer.parseInt(ip[0]);
			insurancePrice[i] = Float.parseFloat(ip[1]);
		}

		IOrderDAO orderDAO = new OrderDAO();
		if (orderDAO.addOrder(order)) {

			int orderId = orderDAO.getNewOrderId();

			order.setOrderId(orderId);

			ArrayList<InsuranceOrder> list = new ArrayList<InsuranceOrder>();

			for (int i = 0; i < insuranceId.length; i++) {
				InsuranceOrder insuranceOrder = new InsuranceOrder();
				insuranceOrder.setInsuranceId(insuranceId[i]);
				insuranceOrder.setOrderId(orderId);
				insuranceOrder.setPrice(insurancePrice[i]);
				list.add(insuranceOrder);
			}

			IInsuranceOrderDAO insuranceOrderDAO = new InsuranceOrderDAO();
			if (insuranceOrderDAO.addInsuranceOrder(list)) {

				response.sendRedirect("/CarRentalOnline/member/OrderPay.jsp");
			} else {
				CommonUtil.showAlertMessage(response, "Fail！");
			}

		} else {
			CommonUtil.showAlertMessage(response, "Fail！");
		}
	}

	// Send order
	private void sendOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		float day = Float.parseFloat((request.getParameter("day")));

		int fromStoreId = Integer.parseInt(request.getParameter("fromStoreId"));
		int toStoreId = Integer.parseInt(request.getParameter("toStoreId"));
		
		String contactsStr = request.getParameter("contactsId");
		
		if(contactsStr==null){
			CommonUtil.showAlertMessage(response, "please select user！");
			return;
		}
		
		int contactsId = Integer.parseInt(contactsStr);
		
		int carId = Integer.parseInt(request.getParameter("carId"));
		String beginTime = (String) request.getSession().getAttribute(
				"beginTime");
		String endTime = (String) request.getSession().getAttribute("endTime");
		float carMoney = Float.parseFloat(request.getParameter("carMoney"));
		String remark = request.getParameter("remark");

		String songCheShangMenAddress = "";
		String shangMenQuCheAddress = "";

		HttpSession session = request.getSession();
		String[] isSongCheShangMen = (String[]) session
				.getAttribute("isSongCheShangMen");
		String[] isShangMenQuChe = (String[]) session
				.getAttribute("isShangMenQuChe");
		if (isSongCheShangMen != null) {
			songCheShangMenAddress = request
					.getParameter("songCheShangMenAddress");
		}
		if (isShangMenQuChe != null) {
			shangMenQuCheAddress = request.getParameter("shangMenQuCheAddress");
		}

		String[] insurancePrices = request.getParameterValues("insurancePrice");
		

		int length = insurancePrices.length;

		int[] insuranceId = new int[length];
		float[] insurancePrice = new float[length];

		for (int i = 0; i < length; i++) {
			String[] ip = insurancePrices[i].split("-");

			insuranceId[i] = Integer.parseInt(ip[0]);
			insurancePrice[i] = Float.parseFloat(ip[1]);
		}

		float totalMoney = carMoney * day;
		for (float f : insurancePrice) {
			totalMoney += f;
		}

		Order order = new Order();
		order.setFromStoreId(fromStoreId);
		order.setToStoreId(toStoreId);
		order.setFrequentId(contactsId);
		order.setCarId(carId);
		order.setCollectionTime(beginTime);
		order.setReturnTime(endTime);
		order.setPrice(carMoney);
		order.setTotalMoney(totalMoney);
		order.setOrderState("To be paid");
		order.setRemark(remark);
		order.setSongCheShangMenAddress(songCheShangMenAddress);
		order.setShangMenQuCheAddress(shangMenQuCheAddress);

		request.getSession().setAttribute("order", order);
		request.getSession().setAttribute("insurancePrices", insurancePrices);
		request.setAttribute("insurancePrices", insurancePrices);
		request.setAttribute("day", day);
		request.getRequestDispatcher("/member/OrderCharge.jsp").forward(
				request, response);

	}

}
