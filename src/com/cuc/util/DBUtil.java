package com.cuc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class DBUtil {
	private static DBUtil instance = null;

	public static synchronized DBUtil getInstance() {
		if (instance == null) {
			instance = new DBUtil();
		}
		return instance;
	}
	
	public Connection getConnection(){
		Connection con=null;
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			String url = "jdbc:mysql://localhost:3306/db_bs_carrental?useUnicode=true&characterEncoding=utf-8";
			con = DriverManager.getConnection(url, "root", "admin");

		} catch (ClassNotFoundException e) {
			JOptionPane.showMessageDialog(null, "Class Cannot find", "ERROR", 0);
			return null;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "FAil!", "ERROR", 0);
			return null;
		}
		return con;
	}
	
	public void close(Connection con, Statement stm, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stm != null) {
				stm.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "ERROR", "ERROR", 0);
		}
	}
}
