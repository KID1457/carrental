package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.Insurance;

public interface IInsuranceDAO {
	public boolean addInsurance(Insurance insurance);

	public boolean deleteByInsuranceId(int InsuranceId);

	public boolean updateInsurance(Insurance insurance);

	public Insurance getByInsuranceId(int InsuranceId);

	public ArrayList<String[]> searchAllInsurance();

	public boolean changeInsuranceState(int InsuranceId, int state);
	
	public ArrayList<String[]> searchInsuranceByState(int state);

}
