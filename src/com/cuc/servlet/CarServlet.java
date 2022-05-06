package com.cuc.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cuc.dao.IBaseDAO;
import com.cuc.dao.IBusinessStoreDAO;
import com.cuc.dao.ICarDAO;
import com.cuc.dao.IFrequentContactsDAO;
import com.cuc.dao.IInsuranceDAO;
import com.cuc.dao.imp.BaseDAO;
import com.cuc.dao.imp.BusinessStoreDAO;
import com.cuc.dao.imp.CarDAO;
import com.cuc.dao.imp.FrequentContactsDAO;
import com.cuc.dao.imp.InsuranceDAO;
import com.cuc.model.BusinessStore;
import com.cuc.model.Car;
import com.cuc.model.FrequentContacts;
import com.cuc.model.Member;
import com.cuc.util.ArrayHelper;
import com.cuc.util.CommonUtil;
import com.cuc.util.FileUpload;
import com.cuc.util.PageUtil;

public class CarServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String method = request.getParameter("method");

		System.out.println("CarServlet method=" + method);

		if (method == null) {
			method = "";
		}

		if (method.equals("delCarById")) {
			delCarById(request, response);
		} else if (method.equals("showCarInfoById")) {
			showCarInfoById(request, response);
		} else if (method.equals("ShowAllCar")) {
			ShowAllCar(request, response);
		} else if (method.equals("updateCarState")) {
			updateCarState(request, response);
		} else if (method.equals("searchCar")) {// Check available rental cars on the home page
			searchCar(request, response);
		} else if (method.equals("searchByCondition")) {
			searchByCondition(request, response);
		} else if (method.equals("orderCar")) {// Book a vehicle order check page
			orderCar(request, response);
		} else if (method.equals("updateCarInfo")) {
			updateCarInfo(request, response);
		} else if (method.equals("jumpToAddCarInfo")) {
			jumpToAddCarInfo(request, response);
		} else if (method.equals("addCarInfo")) {// Adding vehicle information in shops
			addCarInfo(request, response);
		} else if (method.equals("sysAdminJumpToAddCarInfo")) {
			sysAdminJumpToAddCarInfo(request, response);
		} else if (method.equals("sysAdminAddCarInfo")) {// Enterprise administrators add vehicle information
			sysAdminAddCarInfo(request, response);
		}
	}

	private void sysAdminAddCarInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// File upload
		FileUpload fu = new FileUpload();
		fu.setRequest(request);
		String realPath = this.getServletContext().getRealPath(
				"/uploadFiles/car");
		fu.setUploadPath(realPath + "\\");
		int i = fu.process();
		// int Result 0 The file operation was successful; 1 The request object does not exist. 2 File save path not set or incorrect file save path；3
		// The correct enctype is not set;4 file manipulation exceptions.
		switch (i) {
		case 0:

			String[] fileArr = fu.getUpdFileNames();
			// Because the file upload form uses enctype="multipart/form-data", the data cannot be read directly

			int storeId = Integer.parseInt(fu.getParameter("storeId"));
			String carNumber = fu.getParameter("carNumber");

			if (carNumber.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carNumber can not be null!");
				return;
			}

			String carBrand = fu.getParameter("carBrand");

			if (carBrand.trim().equals("0")) {
				CommonUtil.showAlertMessage(response, "carBrand can not be null!");
				return;
			}

			String carType = fu.getParameter("carType");

			if (carType.trim().equals("0")) {
				CommonUtil.showAlertMessage(response, "carType can not be null!");
				return;
			}

			String carForm = fu.getParameter("carForm");
			String engineNum = fu.getParameter("engineNum");

			if (engineNum.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "engineNum can not be null!");
				return;
			}

			String carframeNum = fu.getParameter("carframeNum");

			if (carframeNum.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carframeNum can not be null!");
				return;
			}

			String carGear = fu.getParameter("carGear");

			String carDisplacement = fu.getParameter("carDisplacement");
			String carDisplacementUnits = fu
					.getParameter("carDisplacementUnits");

			if (carDisplacementUnits.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carDisplacement can not be null!");
				return;
			}

			carDisplacement = carDisplacement + carDisplacementUnits;

			String seat = fu.getParameter("seat");

			String compartment = fu.getParameter("compartment");
			String buyDate = fu.getParameter("buyDate");

			if (buyDate.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "buyDate can not be null!");
				return;
			}

			String state = fu.getParameter("state");
			String carMoney = fu.getParameter("carMoney");

			if (carMoney.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carMoney can not be null!");
				return;
			}

			Car car = new Car();
			car.setStoreId(storeId);
			car.setCarNumber(carNumber);
			car.setCarBrand(carBrand);
			car.setCarType(carType);
			car.setCarForm(carForm);
			car.setEngineNum(engineNum);
			car.setCarframeNum(carframeNum);
			car.setCarGear(carGear);
			car.setCarDIsplacement(carDisplacement);
			car.setSeat(seat);
			car.setCompartment(compartment);
			car.setCarBufyData(buyDate);
			car.setState(Integer.parseInt(state));

			try {
				car.setCarMoney(Float.parseFloat(carMoney));
			} catch (Exception e) {
				CommonUtil.showAlertMessage(response, "carMoney value format error!");
				return;
			}

			String str[] = fu.getParameters("tt");
			car.setCarImage(fileArr[0]);

			ICarDAO carDAO = new CarDAO();
			if (carDAO.addCar(car)) {
				CommonUtil.showAlertMessage(response, "Success!");
			} else {
				// Delete photos
				File f = new File(realPath + "\\" + fileArr[0]);
				f.delete();
				CommonUtil.showAlertMessage(response, "Fail!");
			}
			break;
		case 1:
			CommonUtil.showAlertMessage(response, "request is Non-existent");
			break;
		case 2:
			CommonUtil.showAlertMessage(response, "Save path has not setting!");
			break;
		case 3:
			CommonUtil.showAlertMessage(response,
					"Form has not setting enctype=multipart/form-data!");
			break;
		case 4:
			CommonUtil.showAlertMessage(response, "Fail");
			break;
		}

	}

	private void sysAdminJumpToAddCarInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/sysAdmin/AddCarInfo.jsp").forward(
				request, response);

	}

	private void addCarInfo(HttpServletRequest request,
			HttpServletResponse response) throws NumberFormatException,
			IOException {

		// Files upload
		FileUpload fu = new FileUpload();
		fu.setRequest(request);
		String realPath = this.getServletContext().getRealPath(
				"/uploadFiles/car");
		fu.setUploadPath(realPath + "\\");
		int i = fu.process();
		switch (i) {
		case 0:

			String[] fileArr = fu.getUpdFileNames();

			HttpSession session = request.getSession();
			BusinessStore store = (BusinessStore) session.getAttribute("store");

			int storeId = store.getStoreId();
			String carNumber = fu.getParameter("carNumber");

			if (carNumber.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carNumber can not be null!");
				return;
			}

			String carBrand = fu.getParameter("carBrand");

			if (carBrand.trim().equals("0")) {
				CommonUtil.showAlertMessage(response, "carBrand can not be null!");
				return;
			}

			String carType = fu.getParameter("carType");

			if (carType.trim().equals("0")) {
				CommonUtil.showAlertMessage(response, "carType can not be null!");
				return;
			}

			String carForm = fu.getParameter("carForm");
			String engineNum = fu.getParameter("engineNum");

			if (engineNum.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "engineNum can not be null!");
				return;
			}

			String carframeNum = fu.getParameter("carframeNum");

			if (carframeNum.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carframeNum can not be null!");
				return;
			}

			String carGear = fu.getParameter("carGear");

			String carDisplacement = fu.getParameter("carDisplacement");
			String carDisplacementUnits = fu
					.getParameter("carDisplacementUnits");

			if (carDisplacementUnits.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carDisplacement can not be null!");
				return;
			}

			carDisplacement = carDisplacement + carDisplacementUnits;

			String seat = fu.getParameter("seat");

			String compartment = fu.getParameter("compartment");
			String buyDate = fu.getParameter("buyDate");

			if (buyDate.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "buyDate can not be null!");
				return;
			}

			String state = fu.getParameter("state");
			String carMoney = fu.getParameter("carMoney");

			if (carMoney.trim().length() == 0) {
				CommonUtil.showAlertMessage(response, "carMoney can not be null!");
				return;
			}

			Car car = new Car();
			car.setStoreId(storeId);
			car.setCarNumber(carNumber);
			car.setCarBrand(carBrand);
			car.setCarType(carType);
			car.setCarForm(carForm);
			car.setEngineNum(engineNum);
			car.setCarframeNum(carframeNum);
			car.setCarGear(carGear);
			car.setCarDIsplacement(carDisplacement);
			car.setSeat(seat);
			car.setCompartment(compartment);
			car.setCarBufyData(buyDate);
			car.setState(Integer.parseInt(state));
			car.setCarMoney(Float.parseFloat(carMoney));

			String str[] = fu.getParameters("tt");
			car.setCarImage(fileArr[0]);

			ICarDAO carDAO = new CarDAO();
			if (carDAO.addCar(car)) {
				CommonUtil.showAlertMessage(response, "Success!");
			} else {
				// Delete photos
				File f = new File(realPath + "\\" + fileArr[0]);
				f.delete();
				CommonUtil.showAlertMessage(response, "Fail!");
			}
			break;
		case 1:
			CommonUtil.showAlertMessage(response, "request is Non-existent");
			break;
		case 2:
			CommonUtil.showAlertMessage(response, "Save path has not setting");
			break;
		case 3:
			CommonUtil.showAlertMessage(response,
					"Form has not setting enctype=multipart/form-data!");
			break;
		case 4:
			CommonUtil.showAlertMessage(response, "Fail!");
			break;
		}

	}

	private void jumpToAddCarInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/businessStore/AddCarInfo.jsp").forward(
				request, response);

	}

	private void updateCarInfo(HttpServletRequest request,
			HttpServletResponse response) throws NumberFormatException,
			IOException {

		// Files upload
		FileUpload fu = new FileUpload();
		fu.setRequest(request);
		String realPath = this.getServletContext().getRealPath(
				"/uploadFiles/car");
		fu.setUploadPath(realPath + "\\");
		int i = fu.process();
		// int Result 0 The file operation was successful; 1 The request object does not exist. 2 File save path not set or incorrect file save path；3
		// The correct enctype was not set; 4 File manipulation exception.
		switch (i) {
		case 0:
			String[] fileArr = fu.getUpdFileNames();
			// Because the file upload form uses enctype="multipart/form-data", the data cannot be read directly

			int storeId = Integer.parseInt(fu.getParameter("storeId"));

			int carId = Integer.parseInt(fu.getParameter("carId"));
			String carNumber = fu.getParameter("carNumber");
			String carBrand = fu.getParameter("carBrand");
			String carType = fu.getParameter("carType");
			String carForm = fu.getParameter("carForm");
			String engineNum = fu.getParameter("engineNum");
			String carframeNum = fu.getParameter("carframeNum");
			String carGear = fu.getParameter("carGear");

			String carDisplacement = fu.getParameter("carDisplacement");
			String carDisplacementUnits = fu
					.getParameter("carDisplacementUnits");
			carDisplacement = carDisplacement + carDisplacementUnits;

			String seat = fu.getParameter("seat");

			String compartment = fu.getParameter("compartment");
			String buyDate = fu.getParameter("buyDate");
			String state = fu.getParameter("state");
			String carMoney = fu.getParameter("carMoney");

			Car car = new Car();
			car.setStoreId(storeId);
			car.setCarId(carId);
			car.setCarNumber(carNumber);
			car.setCarBrand(carBrand);
			car.setCarType(carType);
			car.setCarForm(carForm);
			car.setEngineNum(engineNum);
			car.setCarframeNum(carframeNum);
			car.setCarGear(carGear);
			car.setCarDIsplacement(carDisplacement);
			car.setSeat(seat);
			car.setCompartment(compartment);
			car.setCarBufyData(buyDate);
			car.setState(Integer.parseInt(state));
			car.setCarMoney(Float.parseFloat(carMoney));

			String str[] = fu.getParameters("tt");
			String oldphoto = fu.getParameter("oldCarImg");
			try {
				car.setCarImage(fileArr[0]);
				// Delete original photo
				File f = new File(realPath + "\\" + oldphoto);
				f.delete();
			} catch (ArrayIndexOutOfBoundsException e) {
				car.setCarImage(oldphoto);
			}
			ICarDAO carDAO = new CarDAO();
			if (carDAO.updateCar(car)) {
				CommonUtil.showAlertMessage(response, "Success!");
			} else {
				File f = new File(realPath + "\\" + fileArr[0]);
				f.delete();
				CommonUtil.showAlertMessage(response, "Fail!");
			}
			break;
		case 1:
			CommonUtil.showAlertMessage(response, "request is Non-existent");
			break;
		case 2:
			CommonUtil.showAlertMessage(response, "Save path has not setting!");
			break;
		case 3:
			CommonUtil.showAlertMessage(response,
					"Form has not setting enctype=multipart/form-data!");
			break;
		case 4:
			CommonUtil.showAlertMessage(response, "Fail!");
			break;
		}

	}

	// Book a vehicle order check page
	private void orderCar(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Member member = (Member) request.getSession().getAttribute("member");
		if (member == null) {
			CommonUtil.showAlertMessage(response, "You haven't signed in yet. You can only book after signing in!");
			return;
		}

		IFrequentContactsDAO contactsDAO = new FrequentContactsDAO();
		ArrayList<FrequentContacts> contactsList = contactsDAO
				.getByMemberId(member.getMemberId());

		if (contactsList == null || contactsList.size() == 0) {
			CommonUtil.showAlertMessage(response, "You haven't added the common car rental information yet. Please add it in the personal center before booking！");
			return;
		}

		IInsuranceDAO insuranceDAO = new InsuranceDAO();
		ArrayList<String[]> insuranceList = insuranceDAO
				.searchInsuranceByState(1);// Search for all insurance information with status 1

		int carId = Integer.parseInt(request.getParameter("carId"));

		ICarDAO carDAO = new CarDAO();
		Map<String, Object> carMap = carDAO.searchByCarId(carId);

		request.setAttribute("carMap", carMap);
		request.setAttribute("insuranceList", insuranceList);
		request.setAttribute("contactsList", contactsList);

		request.getRequestDispatcher("/member/orderCar.jsp").forward(request,
				response);

	}

	private void searchByCondition(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String[] carBrand = request.getParameterValues("pp");
		
		if(carBrand==null){
			carBrand = new String[]{"All"};
		}
		
		for (int i = 0; i < carBrand.length; i++) {
			System.out.println(carBrand[i]);
		}

		carBrand = CommonUtil.changeValues(carBrand, "All");

		String[] price = request.getParameterValues("hyj");
		
		if(price==null){
			price = new String[]{"All"};
		}

		float[] money = null;

		if (ArrayHelper.inArray(price, "All")) {
			money = new float[0];
		} else {
			money = new float[price.length * 2];
			int k = 0;
			for (int i = 0; i < price.length; i++) {
				System.out.println(price[i]);
				for (int j = 0; j < 2; j++) {
					money[k++] = Float.parseFloat(price[i].split("-")[j]);
				}
			}
		}

		// Get the selected gear box
		String[] carGear = request.getParameterValues("bsx");
		
		if(carGear==null){
			carGear = new String[]{"All"};
		}
		
		for (int i = 0; i < carGear.length; i++)
			System.out.println(carGear[i]);

		// Determine if the gear box contains an unrestricted condition, and if so, set all selected gear boxes to ""
		carGear = CommonUtil.changeValues(carGear, "All");

		// Get selected seats
		String[] seat = request.getParameterValues("cx");
		
		if(seat==null){
			seat = new String[]{"0"};
		}
		
		// Determine if the selected seat contains an unrestricted condition ('0'), and if so, set all selected seats to""
		seat = CommonUtil.changeValues(seat, "0");

		HttpSession session = request.getSession();
		String storeName = (String) session.getAttribute("fromStoreName");

		IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
		BusinessStore store = storeDAO.getByBusinessStoreName(storeName);

		String beginTime = (String) request.getSession().getAttribute(
				"beginTime");
		String endTime = (String) request.getSession().getAttribute("endTime");

		ICarDAO carDAO = new CarDAO();
		int rsCount = Integer.parseInt(carDAO.getRSCountBySearchCarCondition(
				store.getStoreId(), carBrand, money, carGear, seat, beginTime,
				endTime)[0].toString());

		PageUtil util = new PageUtil(request);
		util.setPageSize(5);
		util.setRsCount(rsCount);
		util.getPageCount();
		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);
		request.setAttribute("pageTool", null);

		ArrayList<String[]> carList = carDAO.pageSearchCarByCondition(store
				.getStoreId(), carBrand, money, carGear, seat, beginTime,
				endTime, util.getPageSize(), currentPage);

		request.setAttribute("carList", carList);

		request.getRequestDispatcher("/member/SearchCar.jsp").forward(request,
				response);

	}

	// Leasing members search for vehicles available for lease under a shop for a specified date and time period
	private void searchCar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String fromStoreName = request.getParameter("storeName");// Name of pick-up shop

		if (fromStoreName == null) {
			CommonUtil.showAlertMessage(response, "You have not selected a pick-up store.");
			return;
		}

		String beginDate = request.getParameter("beginDate");// Pick-up start date
		String beginHour = request.getParameter("beginHour");// Pick-up start actual date
		String tostoreName = request.getParameter("tostoreName");// Name of return shop

		if (tostoreName == null) {
			CommonUtil.showAlertMessage(response, "You have not selected a drop off store.");
			return;
		}

		String endDate = request.getParameter("endDate");// Return end date
		String endHour = request.getParameter("endHour");// Return end date

		// fromStoreName = new String(fromStoreName.getBytes("utf-8"),"utf-8");

		String beginTime = beginDate + " " + beginHour;
		String endTime = endDate + " " + endHour;

		// Determine if the pick-up time is less than the return time
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date d1 = null;
		try {
			d1 = sdf.parse(beginTime);
			Date d2 = sdf.parse(endTime);
			if (d2.getTime() <= d1.getTime()) {
				CommonUtil.showAlertMessage(response, "Return time must be greater than pick-up time, please re select!");

				return;
			}
		} catch (ParseException e) {

			CommonUtil.showAlertMessage(response, "The format of time and date is wrong. Please re select the time and date!");
			return;
		}

		// You cannot select a pick-up time that is less than the current time
		if (d1.getTime() <= new Date().getTime()) {
			CommonUtil.showAlertMessage(response, "Vehicles need to be rented one day in advance.");
			return;
		}

		// Cannot be hired on the day, only after tomorrow (needs to be hired one day in advance)
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		if (sdf2.format(d1).equals(sdf2.format(new Date()))) {
			CommonUtil.showAlertMessage(response, "You need to rent one day in advance. You can't rent vehicles on that day.");
			return;
		}

		ICarDAO carDAO = new CarDAO();
		int rsCount = Integer.parseInt(carDAO.getRSCountByStoreNameAndTime(
				fromStoreName, beginTime, endTime)[0].toString());

		PageUtil util = new PageUtil(request);
		util.setPageSize(5);
		util.setRsCount(rsCount);
		util.getPageCount();
		int currentPage = util.getCurrentPage();

		String pageTool = util.createPageTool(PageUtil.BbsImage);

		request.setAttribute("pageTool", pageTool);

		// Leasing members search for vehicles available for lease under a shop for a specified date and time period
		ArrayList<String[]> carList = carDAO.SearchByStoreNameAndTime(
				fromStoreName, beginTime, endTime, util.getPageSize(),
				currentPage);
		request.setAttribute("carList", carList);

		// Is there a checkbox for door-to-door delivery and pick-up?
		String[] isSongCheShangMen = request
				.getParameterValues("isSongCheShangMen");
		String[] isShangMenQuChe = request
				.getParameterValues("isShangMenQuChe");

		// Store basic order information in session Useful for adding order information later on
		HttpSession session = request.getSession();
		session.setAttribute("fromStoreName", fromStoreName);// Name of the shop where the car is ordered
		session.setAttribute("beginTime", beginTime);// Start time
		session.setAttribute("tostoreName", tostoreName);// Name of return shop
		session.setAttribute("endTime", endTime);// End date
		session.setAttribute("isSongCheShangMen", isSongCheShangMen);
		session.setAttribute("isShangMenQuChe", isShangMenQuChe);

		request.getRequestDispatcher("/member/SearchCar.jsp").forward(request,
				response);

	}

	private void updateCarState(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("carId"));
		int state = Integer.parseInt(request.getParameter("state"));

		if (state == 0) {
			state = 1;
		} else if (state == 1) {
			state = 0;
		}

		IBaseDAO baseDAO = new BaseDAO();
		Object[] paramArray = new Object[2];
		paramArray[0] = state;
		paramArray[1] = id;
		boolean result = baseDAO.update("t_car", "state=?", "carId=?",
				paramArray);

		if (result) {
			response.getWriter().println(
					"<SCRIPT LANGUAGE='JavaScript'>alert('Success！');</SCRIPT>");
			return;
		} else {
			response
					.getWriter()
					.println(
							"<SCRIPT LANGUAGE='JavaScript'>alert('Fail!');javascript:history.back(-1);</SCRIPT>");
			return;
		}
	}

	private void ShowAllCar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		ICarDAO carDAO = new CarDAO();
		int rsCount = Integer
				.parseInt((carDAO.getAllCarRSCount()[0].toString()));

		PageUtil pageUtil = new PageUtil(request);
		pageUtil.setPageSize(5);
		pageUtil.setRsCount(rsCount);

		pageUtil.getPageCount();
		int currentPage = pageUtil.getCurrentPage();

		String pageTool = pageUtil.createPageTool(PageUtil.BbsImage);
		request.setAttribute("pageTool", pageTool);

		ArrayList<String[]> carList = carDAO.pageSearchAllCar(pageUtil
				.getPageSize(), currentPage);
		request.setAttribute("carList", carList);

		request.getRequestDispatcher("/businessStore/CarList.jsp").forward(
				request, response);

	}

	private void showCarInfoById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int carId = Integer.parseInt(request.getParameter("carId"));

		ICarDAO carDAO = new CarDAO();
		request.setAttribute("carInfo", carDAO.searchByCarId(carId));
		request.getRequestDispatcher("/businessStore/UpdateCarInfo.jsp")
				.forward(request, response);
		return;

	}

	private void delCarById(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int carId = Integer.parseInt(request.getParameter("carId"));
		System.out.println("carId->" + carId);
		ICarDAO carDAO = new CarDAO();
		if (carDAO.deleteByCarId(carId)) {
			response
					.getWriter()
					.println(
							"<SCRIPT LANGUAGE='JavaScript'>alert('Success!');javascript:history.back(-1);</SCRIPT>");
			return;
		} else {
			response
					.getWriter()
					.println(
							"<SCRIPT LANGUAGE='JavaScript'>alert('Fail！');javascript:history.back(-1);</SCRIPT>");
			return;
		}

	}

}
