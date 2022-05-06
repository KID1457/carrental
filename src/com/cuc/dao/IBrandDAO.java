package com.cuc.dao;

import java.util.ArrayList;

public interface IBrandDAO {

	public ArrayList<String[]> getAllBrand();

	public ArrayList<String[]> getTypeByBrand(String brand);
}
