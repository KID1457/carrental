package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.SysAdmin;

public interface ISysAdminDAO {
	public boolean addSysAdmin(SysAdmin admin);

	public SysAdmin sysAdminLogin(String adminNo, String adminPassword);

	public SysAdmin getBySysAdminId(int adminId);

	public boolean updateSysAdmin(SysAdmin admin);

	public ArrayList<String[]> searchAllSysAdmin();

	public boolean delSysAdminById(int adminId);
	
}
