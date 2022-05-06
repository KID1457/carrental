package com.cuc.dao;

import java.util.ArrayList;
import java.util.Map;

import com.cuc.model.Order;

public interface IOrderDAO {
	public boolean addOrder(Order order);

	public boolean updateOrderState(int orderId, String orderState);

	public ArrayList<Order> getByMemberId(int memberId);

	public ArrayList<String[]> getByStoreId(int storeId, String orderState,
			int pageSize, int currentPage);

	public ArrayList<String[]> searchStoreAllOrder(int storeId, int pageSize,
			int currentPage);

	public Object[] getRsCountStoreAllOrder(int storeId);

	public Object[] getRsCountByStoreId(int storeId, String orderState);

	public ArrayList<String[]> searchAllOrder(String orderState, int pageSize,
			int currentPage);

	public Object[] getRsCountAllOrder(String orderState);

	public int getNewOrderId();

	public ArrayList<String[]> searchTimeOutOrder(String nowDate);

	public ArrayList<String[]> searchOrderByMemberId(int memberId,
			String orderState);

	public Map<String, Object> getOrderByOrderId(int orderId);

	public ArrayList<String[]> searchAllOrderByCondition(String orderId,
			String orderState, String beginTime, String endTime, int pageSize,
			int currentPage);

	public Object[] getAllOrderByConditionRsCount(String orderId,
			String orderState, String beginTime, String endTime);

	public ArrayList<String[]> searchAllStoreOrderByCondition(int storeId,
			String orderId, String orderState, String beginTime,
			String endTime, int pageSize, int currentPage);

	public Object[] getAllStoreOrderByConditionRsCount(int storeId,
			String orderId, String orderState, String beginTime, String endTime);

	public ArrayList<String[]> searchDaiChuCheTimeOutOrder();

	public ArrayList<String[]> searchDaiHuanCheOrderByToStoreId(int toStoreId,
			int pageSize, int currentPage);

	public Object[] getRsCountDaiHuanCheOrderByToStoreId(int toStoreId);

	public ArrayList<String[]> searchCanReturnCar(int storeId, int pageSize,
			int currentPage);

	public Object[] getRsCountCanReturnCar(int storeId);

	public boolean updateIsCancelByDaiChuCheTimeOut(int orderId,
			int isCancelByDaiChuCheTimeOut);

	public ArrayList<String[]> getDayStoreProfit(String date);

	public ArrayList<String[]> searchCanReturnOrderByCondition(int storeId,
			String orderId, String beginTime, String endTime, int pageSize,
			int currentPage);

	public Object[] getCanReturnOrderRsCount(int storeId, String orderId,
			String beginTime, String endTime);
}
