package com.cuc.dao;

import java.util.ArrayList;
import java.util.Map;

import com.cuc.model.Car;

public interface ICarDAO {
	public boolean addCar(Car car);

	public boolean updateCar(Car car);

	public boolean deleteByCarId(int carId);

	public ArrayList<String[]> pageSearchByStoreId(int storeId, int pageSize,
			int currentPage);

	public Object[] getRSCountByStoreId(int storeId);

	public Map<String, Object> searchByCarId(int carId);

	public ArrayList<String[]> SearchByStoreNameAndTime(String storeName,
			String beginTime, String endTime, int pageSize, int currentSize);

	public ArrayList<String[]> pageSearchAllCar(int pageSize, int currentPage);

	public Object[] getAllCarRSCount();

	public Object[] getRSCountByStoreNameAndTime(String storeName,
			String beginTime, String endTime);

	public ArrayList<String[]> pageSearchCarByCondition(int storeId,
			String[] carBrand, float[] price, String[] carGear, String[] seat,
			String beginTime, String endTime, int pageSize, int currentPage);

	public Object[] getRSCountBySearchCarCondition(int storeId,
			String[] carBrand, float[] price, String[] carGear, String[] seat,
			String beginTime, String endTime);

	public boolean changeCarStore(int carId, int storeId);

	public ArrayList<String[]> getDayCarRentalNum(String date);

}
