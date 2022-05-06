package com.cuc.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.cuc.dao.IBusinessStoreDAO;
import com.cuc.dao.ICarDAO;
import com.cuc.dao.IDayCarRentalDAO;
import com.cuc.dao.IDayStoreProfitDAO;
import com.cuc.dao.IMemberDAO;
import com.cuc.dao.IMessageDAO;
import com.cuc.dao.IMonthCarRentalDAO;
import com.cuc.dao.IMonthRegisterDAO;
import com.cuc.dao.IMonthStoreProfitDAO;
import com.cuc.dao.IOrderDAO;
import com.cuc.dao.ISysAdminDAO;
import com.cuc.dao.imp.BusinessStoreDAO;
import com.cuc.dao.imp.CarDAO;
import com.cuc.dao.imp.DayCarRentalDAO;
import com.cuc.dao.imp.DayStoreProfitDAO;
import com.cuc.dao.imp.MemberDAO;
import com.cuc.dao.imp.MessageDAO;
import com.cuc.dao.imp.MonthCarRentalDAO;
import com.cuc.dao.imp.MonthRegisterDAO;
import com.cuc.dao.imp.MonthStoreProfitDAO;
import com.cuc.dao.imp.OrderDAO;
import com.cuc.dao.imp.SysAdminDAO;
import com.cuc.model.Car;
import com.cuc.model.DayCarRental;
import com.cuc.model.DayStoreProfit;
import com.cuc.model.Message;
import com.cuc.model.MonthCarRental;
import com.cuc.model.MonthRegister;
import com.cuc.model.MonthStoreProfit;
import com.cuc.util.CommonUtil;
import com.cuc.util.SQLUtil;

public class Test {
	
	public static void main(String[] args) throws ParseException {
		ICarDAO carDAO = new CarDAO();
		IOrderDAO orderDAO = new OrderDAO();
		
		System.out.println("do MonthStoreProfitJob");

		IDayStoreProfitDAO storeProfitDAO = new DayStoreProfitDAO();

		Date d = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(d);
		calendar.add(Calendar.MONTH, -1);
		d = calendar.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String calDate = sdf.format(d);

		int year = Integer.parseInt(calDate.split("-")[0]);
		int month = Integer.parseInt(calDate.split("-")[1]);

		ArrayList<String[]> calStoreProfitList = storeProfitDAO
				.getMonthStoreProfitByDate("" + year + "" + month);

		ArrayList<MonthStoreProfit> monthStoreProfitList = new ArrayList<MonthStoreProfit>();

		MonthStoreProfit storeProfit = null;

		System.out.println("size" + calStoreProfitList.size());

		for (String[] calStoreProfit : calStoreProfitList) {
			storeProfit = new MonthStoreProfit();
			storeProfit.setStoreId(Integer.parseInt(calStoreProfit[0]));
			storeProfit.setSumMoney(Float.parseFloat(calStoreProfit[1]));
			storeProfit.setYear(year);
			storeProfit.setMonth(month);

			monthStoreProfitList.add(storeProfit);

		}

		IMonthStoreProfitDAO monthStoreProfitDAO = new MonthStoreProfitDAO();

		monthStoreProfitDAO.insert(monthStoreProfitList);
	}
}
