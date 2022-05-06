package com.cuc.quartz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cuc.dao.IDayStoreProfitDAO;
import com.cuc.dao.IOrderDAO;
import com.cuc.dao.imp.DayStoreProfitDAO;
import com.cuc.dao.imp.OrderDAO;
import com.cuc.model.DayStoreProfit;


public class CalDayStoreProfitJob implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		System.out.println("do CalDayStoreProfitJob");

		Date d = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(d);
		calendar.add(Calendar.DATE, -1);
		d = calendar.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String calDate = sdf.format(d);// 前一天的日期

		int year = Integer.parseInt(calDate.split("-")[0]);
		int month = Integer.parseInt(calDate.split("-")[1]);
		int day = Integer.parseInt(calDate.split("-")[2]);

		IOrderDAO orderDAO = new OrderDAO();
		
		ArrayList<String[]> calStoreProfitList = orderDAO.getDayStoreProfit(calDate);
		
		ArrayList<DayStoreProfit> dayStoreProfitList = new ArrayList<DayStoreProfit>();

		DayStoreProfit storeProfit = null;

		for (String[] calStoreProfit : calStoreProfitList) {

			storeProfit = new DayStoreProfit();
			storeProfit.setStoreId(Integer.parseInt(calStoreProfit[0]));
			storeProfit.setSumMoney(Float.parseFloat(calStoreProfit[1]));
			storeProfit.setYear(year);
			storeProfit.setMonth(month);
			storeProfit.setDay(day);

			dayStoreProfitList.add(storeProfit);

		}

		IDayStoreProfitDAO dayStoreProfitDAO = new DayStoreProfitDAO();

		dayStoreProfitDAO.insert(dayStoreProfitList);
		
	}

}
