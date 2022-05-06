package com.cuc.quartz;

import java.util.ArrayList;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cuc.dao.IOrderDAO;
import com.cuc.dao.imp.OrderDAO;

public class CancelOrderJob2 implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		System.out.println("do CancelOrderJob2");

		IOrderDAO orderDAO = new OrderDAO();
		ArrayList<String[]> orderList = orderDAO.searchDaiChuCheTimeOutOrder();

		if (orderList != null) {
			for (String[] order : orderList) {
				int orderId = Integer.parseInt(order[0]);
				orderDAO.updateOrderState(orderId, "已取消");

				orderDAO.updateIsCancelByDaiChuCheTimeOut(orderId, 1);

			}
		}

	}

}
