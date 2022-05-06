package com.cuc.quartz;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cuc.dao.IMemberDAO;
import com.cuc.dao.IMonthRegisterDAO;
import com.cuc.dao.imp.MemberDAO;
import com.cuc.dao.imp.MonthRegisterDAO;
import com.cuc.model.MonthRegister;


public class CalMonthRegisterCountJob implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		System.out.println("do CalMonthRegisterCountJob");

		Date d = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(d);
		calendar.add(Calendar.MONTH, -1);
		d = calendar.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String calDate = sdf.format(d);

		String year = calDate.split("-")[0];
		String month = calDate.split("-")[1];

		IMemberDAO memberDAO = new MemberDAO();
		int regCount = Integer.parseInt(memberDAO.getMonthRegCount(year, month)[0]
				.toString());

		MonthRegister register = new MonthRegister();
		register.setYear(year);
		register.setMonth(month);
		register.setRegCount(regCount);

		IMonthRegisterDAO registerDAO = new MonthRegisterDAO();
		System.out.println(registerDAO.insert(register));

	}

}
