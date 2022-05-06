package com.cuc.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

public class CommonUtil {
	public static int changeState(int state) {
		return state == 1 ? 0 : 1;
	}

	public static void showAlertMessage(HttpServletResponse response, String msg)
			throws IOException {
		response.getWriter().println(
				"<SCRIPT LANGUAGE='JavaScript'>alert('" + msg
						+ "');javascript:history.back(-1);</SCRIPT>");

	}


	public static void showAlertMessageNoBack(HttpServletResponse response,
			String msg) throws IOException {
		response.getWriter().println(
				"<SCRIPT LANGUAGE='JavaScript'>alert('" + msg + "');</SCRIPT>");

	}

	public static String randomCode(int num) {

		String code = "";

		Random random = new Random();

		for (int i = 0; i < num; i++) {
			code += random.nextInt(10);
		}

		return code;

	}


	public static String[] changeValues(String[] values, String s) {

		if (ArrayHelper.inArray(values, s)) {
			for (int i = 0; i < values.length; i++) {
				values[i] = "";
			}
		}

		return values;
	}


	public static double differentDays(String from, String to)
			throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date beginDate = sdf.parse(from);
		Date endDate = sdf.parse(to);

		double days = ((endDate.getTime() - beginDate.getTime()) * 1.0 / (1000 * 3600 * 24));

		return Math.ceil(days);
	}

	public static long calMin(String from, String to) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date d = sdf.parse(from);
		Date d2 = sdf.parse(to);
		
		long c = Math.abs(d.getTime() - d2.getTime()) / (1000 * 60);

		return c;
	}
}
