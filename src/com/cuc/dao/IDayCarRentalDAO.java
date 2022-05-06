package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.DayCarRental;

public interface IDayCarRentalDAO {

	public boolean insert(ArrayList<DayCarRental> dayCarRentalList);

	public ArrayList<String[]> getMonthCarRentalNum(String year, String month);

	public ArrayList<String[]> getDayCarRental(int pageSize, int currentPage);

	public Object[] getDayCarRentalRsCount();

	public ArrayList<String[]> getDayCarRentalByCondition(String beginTime,
			String endTime, int pageSize, int currentPage);
	
	public Object[] getDayCarRentalRsCountByCondition(String beginTime,
			String endTime);
	
	
}
