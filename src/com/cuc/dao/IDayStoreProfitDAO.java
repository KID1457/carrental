package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.DayStoreProfit;

public interface IDayStoreProfitDAO {

	public boolean insert(ArrayList<DayStoreProfit> storePrifitList);

	public ArrayList<String[]> getDayStoreProfit(int pageSize, int currentPage);

	public Object[] getDayStoreProfitRsCount();

	public ArrayList<String[]> getDayStoreProfitByCondition(String beginDate,
			String endDate, Integer storeId, int pageSize, int currentPage);

	public Object[] getDayStoreProfitByConditionRsCount(String beginDate,
			String endDate, Integer storeId);

	public ArrayList<String[]> getMonthStoreProfitByDate(String Date);

	public ArrayList<String[]> getDayStoreProfitByStoreId(int storeId,
			int pageSize, int currentPage);

	public Object[] getDayStoreProfitByStoreIdRsCount(int storeId);

}
