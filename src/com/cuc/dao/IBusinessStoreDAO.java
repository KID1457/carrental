package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.BusinessStore;

public interface IBusinessStoreDAO {
	public boolean addBusinessStore(BusinessStore store);

	public boolean updateBusinessStore(BusinessStore store);

	public ArrayList<String[]> searchAllBusinessStore();

	public BusinessStore getByBusinessStoreName(String storeName);

	public BusinessStore businessStoreLogin(String storeNo, String storePassword);

	public BusinessStore getByBusinessStoreId(int storeId);

	public ArrayList<String[]> getAllBusinessCity();

	public ArrayList<String[]> getBusinessNameByCity(String storeProvince,
			String storeCity);

	public boolean changePassword(int storeId, String newPassword);

	public boolean updateStoreState(int id, int state);
	
	public boolean isSomeNo(String no);
}
