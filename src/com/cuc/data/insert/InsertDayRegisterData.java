package com.cuc.data.insert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.cuc.dao.IDayRegisterDAO;
import com.cuc.dao.IMemberDAO;
import com.cuc.dao.imp.DayRegisterDAO;
import com.cuc.dao.imp.MemberDAO;
import com.cuc.model.DayRegister;

public class InsertDayRegisterData {

	public static void main(String[] args) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String dateStr = "2016-08-01";
		while (!dateStr.equals("2016-12-31")) {

			int year = Integer.parseInt(dateStr.split("-")[0]);
			int month = Integer.parseInt(dateStr.split("-")[1]);
			int day = Integer.parseInt(dateStr.split("-")[2]);

			IMemberDAO memberDAO = new MemberDAO();
			int regCount = Integer
					.parseInt(memberDAO.getDayRegCount(dateStr)[0].toString());

			DayRegister register = new DayRegister();
			register.setYear(year);
			register.setMonth(month);
			register.setDay(day);
			register.setRegCount(regCount);

			IDayRegisterDAO registerDAO = new DayRegisterDAO();
			System.out.println("resutl:"+registerDAO.insert(register));

			Date d = sdf.parse(dateStr);
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(d);
			calendar.add(Calendar.DATE, 1);
			d = calendar.getTime();

			dateStr = sdf.format(d);
		}

	}
}
