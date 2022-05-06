package com.cuc.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class SQLUtil {
	private static SQLUtil instance = null;

	public static synchronized SQLUtil getInstance() {
		if (instance == null) {
			instance = new SQLUtil();
		}
		return instance;
	}

	public boolean update(String sql, Object[] paramArray) {

		boolean update = true;

		Connection con = DBUtil.getInstance().getConnection();

		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(sql);
			if (paramArray != null) {
				for (int i = 0; i < paramArray.length; i++) {
					pstm.setObject(i + 1, paramArray[i]);
				}
			}
			pstm.executeUpdate();
		} catch (SQLException e) {
			update = false;
		} finally {
			DBUtil.getInstance().close(con, pstm, null);
		}
		return update;
	}

	public boolean update(String sql, ArrayList<Object[]> paramArrayList)
			throws SQLException {

		boolean update = true;

		Connection con = DBUtil.getInstance().getConnection();

		con.setAutoCommit(false);

		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(sql);
			if (paramArrayList != null) {
				for (int j = 0; j < paramArrayList.size(); j++) {
					Object[] paramArray = paramArrayList.get(j);
					
					for (int i = 0; i < paramArray.length; i++) {
						pstm.setObject(i + 1, paramArray[i]);
					}
					pstm.addBatch();
					
					if (j % 10000 == 0) { 
						pstm.executeBatch();
						con.commit();
					}
				}
				pstm.executeBatch();
				con.commit();
			}
		} catch (SQLException e) {
			update = false;
		} finally {
			DBUtil.getInstance().close(con, pstm, null);
		}
		return update;
	}

	public boolean update(String table, String condition, String where,
			Object[] paramArray) {

		String sql = "update " + table + " set " + condition + " where "
				+ where;

		boolean update = true;

		Connection con = DBUtil.getInstance().getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(sql);
			if (paramArray != null) {
				for (int i = 0; i < paramArray.length; i++) {
					pstm.setObject(i + 1, paramArray[i]);
				}
			}
			pstm.executeUpdate();
		} catch (SQLException e) {
			update = false;
		} finally {
			DBUtil.getInstance().close(con, pstm, null);
		}
		return update;
	}
	
	public int insertGetId(String sql, Object[] paramArray) {

		Connection conn = DBUtil.getInstance().getConnection();

		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		int retId = 0;
		try {
			preparedStatement = conn.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);

			if (paramArray != null) {
				for (int i = 0; i < paramArray.length; i++) {
					preparedStatement.setObject(i + 1, paramArray[i]);
				}
			}
			preparedStatement.executeUpdate();

			rs = preparedStatement.getGeneratedKeys();

			if (rs.next()) {

				retId = rs.getInt(1);
			}

		} catch (SQLException e) {
			return retId;
		} finally {
			DBUtil.getInstance().close(conn, preparedStatement, rs);
		}
		return retId;

	}


	public String login(String sql) {
		String login = "";

		Connection con = DBUtil.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;
		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			if (rs.next()) {
				login = "Welcome!";
			} else {
				login = "Error Password!";
			}
		} catch (SQLException e) {
			login = "cannot content mysql";
		} finally {
			DBUtil.getInstance().close(con, stm, rs);
		}
		return login;
	}

	public ArrayList<String[]> search(String sql) {
		ArrayList<String[]> search = new ArrayList<String[]>();

		Connection con = DBUtil.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;

		String[] content = null;
		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			int colCount = rs.getMetaData().getColumnCount();
			while (rs.next()) {
				content = new String[colCount];
				for (int i = 1; i <= colCount; i++) {
					content[i - 1] = rs.getString(i);
				}
				search.add(content);
			}
		} catch (SQLException e) {
			return null;
		} finally {
			DBUtil.getInstance().close(con, stm, rs);
		}
		return search;
	}

	public ArrayList<String> getColumnName(String sql) {
		ArrayList<String> columnName = new ArrayList<String>();

		Connection con = DBUtil.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;

		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int column = rsmd.getColumnCount();
			for (int i = 1; i <= column; i++) {
				columnName.add(rsmd.getColumnName(i).toString());
			}
		} catch (SQLException e) {
			return null;
		} finally {
			DBUtil.getInstance().close(con, stm, rs);
		}
		return columnName;
	}

	public Object[] getSingleRow(String sql) {
		Object obj[] = null;

		Connection con = DBUtil.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;

		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			int colCount = rs.getMetaData().getColumnCount();
			if (rs.next()) {
				obj = new Object[colCount];
				for (int i = 1; i <= colCount; i++) {
					obj[i - 1] = rs.getObject(i);
				}
			}
		} catch (SQLException e) {
			return null;
		} finally {
			DBUtil.getInstance().close(con, stm, rs);
		}
		return obj;
	}

	public Map<String, Object> getSingleObject(String sql) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> columnName = getColumnName(sql);
		Object obj[] = getSingleRow(sql);
		if (columnName == null || obj == null) {
			return null;
		}
		for (int i = 0; i < columnName.size(); i++) {
			map.put(columnName.get(i), obj[i]);
		}
		return map;
	}

}
