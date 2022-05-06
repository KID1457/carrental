package com.cuc.quartz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cuc.dao.IDayCarRentalDAO;
import com.cuc.dao.IMonthCarRentalDAO;
import com.cuc.dao.imp.DayCarRentalDAO;
import com.cuc.dao.imp.MonthCarRentalDAO;
import com.cuc.model.MonthCarRental;


public class CalMonthCarRentalJob implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		System.out.println("do CalMonthCarRentalJob");

		IDayCarRentalDAO carRentalDAO = new DayCarRentalDAO();

		Date d = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(d);
		calendar.add(Calendar.MONTH, -1);
		d = calendar.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String calDate = sdf.format(d);

		int year = Integer.parseInt(calDate.split("-")[0]);
		int month = Integer.parseInt(calDate.split("-")[1]);

		ArrayList<String[]> calRentalNumList = carRentalDAO
				.getMonthCarRentalNum("" + year, "" + month);

		ArrayList<MonthCarRental> monthCarRentalList = new ArrayList<MonthCarRental>();

		MonthCarRental carRental = null;
		
		System.out.println("size" + calRentalNumList.size());

		for (String[] calRentalNum : calRentalNumList) {
			carRental = new MonthCarRental();
			carRental.setCarId(Integer.parseInt(calRentalNum[0]));
			carRental.setRentalNum(Integer.parseInt(calRentalNum[1]));
			carRental.setYear(year);
			carRental.setMonth(month);

			monthCarRentalList.add(carRental);

		}

		IMonthCarRentalDAO monthCarRentalDAO = new MonthCarRentalDAO();

		monthCarRentalDAO.insert(monthCarRentalList);
	}
}
