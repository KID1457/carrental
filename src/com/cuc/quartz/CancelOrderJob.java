package com.cuc.quartz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cuc.dao.IOrderDAO;
import com.cuc.dao.imp.OrderDAO;

public class CancelOrderJob implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		System.out.println("do CancelOrderJob ");

		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderTime = df.format(now.getTime() - 2 * 60 * 1000);

		IOrderDAO orderDAO = new OrderDAO();

		ArrayList<String[]> orderList = orderDAO.searchTimeOutOrder(orderTime);

		if (orderList != null) {
			for (String[] order : orderList) {

				int orderId = Integer.parseInt((order[0]));
				orderDAO.updateOrderState(orderId, "已取消");
			}
		}

	}

}
