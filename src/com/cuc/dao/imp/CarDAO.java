package com.cuc.dao.imp;

import java.util.ArrayList;
import java.util.Map;

import com.cuc.dao.ICarDAO;
import com.cuc.model.Car;
import com.cuc.util.SQLUtil;

public class CarDAO implements ICarDAO {

	public boolean addCar(Car car) {
		String sql = "insert into t_car(storeId,carNumber,carBrand,carType,carForm,carMoney,carGear,carDisplacement,carBufyData,compartment,seat,engineNum,carframeNum,carImage,state) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Object[] paramArray = new Object[15];
		paramArray[0] = car.getStoreId();
		paramArray[1] = car.getCarNumber();
		paramArray[2] = car.getCarBrand();
		paramArray[3] = car.getCarType();
		paramArray[4] = car.getCarForm();
		paramArray[5] = car.getCarMoney();
		paramArray[6] = car.getCarGear();
		paramArray[7] = car.getCarDIsplacement();
		paramArray[8] = car.getCarBufyData();
		paramArray[9] = car.getCompartment();
		paramArray[10] = car.getSeat();
		paramArray[11] = car.getEngineNum();
		paramArray[12] = car.getCarframeNum();
		paramArray[13] = car.getCarImage();
		paramArray[14] = car.getState();

		return SQLUtil.getInstance().update(sql, paramArray);
	}

	public boolean deleteByCarId(int carId) {

		String sql = "delete from t_car where carId=?";

		Object[] paramArray = new Object[1];
		paramArray[0] = carId;

		return SQLUtil.getInstance().update(sql, paramArray);
	}

	public Map<String, Object> searchByCarId(int carId) {

		String sql = "select * from t_car where carId=" + carId;

		Map<String, Object> car = SQLUtil.getInstance().getSingleObject(sql);

		return car;
	}

	public boolean updateCar(Car car) {
		String sql = "update "
				+ " t_car set storeId=?,carNumber=?,carBrand=?,carType=?,carForm=?,carMoney=?,carGear=?,carDisplacement=?,"
				+ "carBufyData=?,compartment=?,seat=?,engineNum=?,carframeNum=?,carImage=?,state=? "
				+ " where carId=? ";

		Object[] paramArray = new Object[16];
		paramArray[0] = car.getStoreId();
		paramArray[1] = car.getCarNumber();
		paramArray[2] = car.getCarBrand();
		paramArray[3] = car.getCarType();
		paramArray[4] = car.getCarForm();
		paramArray[5] = car.getCarMoney();
		paramArray[6] = car.getCarGear();
		paramArray[7] = car.getCarDIsplacement();
		paramArray[8] = car.getCarBufyData();
		paramArray[9] = car.getCompartment();
		paramArray[10] = car.getSeat();
		paramArray[11] = car.getEngineNum();
		paramArray[12] = car.getCarframeNum();
		paramArray[13] = car.getCarImage();
		paramArray[14] = car.getState();
		paramArray[15] = car.getCarId();

		return SQLUtil.getInstance().update(sql, paramArray);
	}

	public ArrayList<String[]> SearchByStoreNameAndTime(String storeName,
			String beginTime, String endTime, int pageSize, int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = "select * " + "from t_car ,t_businessstore "
				+ "where t_car.storeId=t_businessstore.storeId and "
				+ "storeName='"
				+ storeName
				+ "' and t_car.state=1 AND "
				+ "carId not in "
				+ "("
				+ "	Select carId"
				+ "	from t_order "
				+ "	where  (collectionTime  between '"
				+ beginTime
				+ "' and '"
				+ endTime
				+ "' or "
				+ "	returnTime  between '"
				+ beginTime
				+ "' and '"
				+ endTime
				+ "' )and "
				+ "	(t_order.orderState= 'To be paid' or "
				+ "	orderState = 'Waiting for departure' or "
				+ "	orderState='Leasing' or "
				+ "	orderState='Waiting for return' )"
				+ ")"
				+ " limit " + (start - 1) + "," + pageSize;

		System.out.println("--->" + sql);

		return SQLUtil.getInstance().search(sql);
	}

	public Object[] getRSCountByStoreNameAndTime(String storeName,
			String beginTime, String endTime) {

		String sql = "select count(*) " + "from t_car ,t_businessstore "
				+ "where t_car.storeId=t_businessstore.storeId and "
				+ "storeName='" + storeName + "' and t_car.state=1 AND "
				+ "carId not in " + "(" + "	Select carId" + "	from t_order "
				+ "	where  (collectionTime  between '" + beginTime + "' and '"
				+ endTime + "' or " + "	returnTime  between '" + beginTime
				+ "' and '" + endTime + "') and ("
				+ "	t_order.orderState= 'To be paid' or " + "	orderState = 'Waiting for departure' or "
				+ "	orderState='Leasing' or " + "	orderState='Waiting for return' )" + ")";

		System.out.println("->" + sql);

		return SQLUtil.getInstance().getSingleRow(sql);
	}

	public ArrayList<String[]> pageSearchByStoreId(int storeId, int pageSize,
			int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;
		String sql = "select * from t_car where storeId=" + storeId
				+ " order by carBrand DESC " + "limit " + (start - 1) + ","
				+ pageSize;

		return SQLUtil.getInstance().search(sql);
	}

	public Object[] getRSCountByStoreId(int storeId) {

		String sql = "select count(*) as rscount from t_car where storeId="
				+ storeId;

		return SQLUtil.getInstance().getSingleRow(sql);
	}

	public ArrayList<String[]> pageSearchAllCar(int pageSize, int currentPage) {

		int start = (currentPage - 1) * pageSize + 1;

		String sql = "select * from t_car limit " + (start - 1) + ","
				+ pageSize;
		return SQLUtil.getInstance().search(sql);
	}

	public Object[] getAllCarRSCount() {

		String sql = "select count(*) as rscount from t_car";

		return SQLUtil.getInstance().getSingleRow(sql);
	}

	public ArrayList<String[]> pageSearchCarByCondition(int storeId,
			String[] carBrand, float[] price, String[] carGear, String[] seat,
			String beginTime, String endTime, int pageSize, int currentPage) {

		String sql = "SELECT * " + "FROM t_car" + " WHERE " + "(" + "	("
				+ "		t_car.storeId=" + storeId + "" + "	) AND" + "	(";

		for (int i = 0; i < carBrand.length; i++) {
			sql = sql + "t_car.carBrand like '%" + carBrand[i] + "%' OR ";
		}
		sql = sql.substring(0, sql.length() - 3);
		sql = sql + ") And";
		sql = sql + "	(";

		for (int i = 0; i < carGear.length; i++) {
			sql = sql + "		t_car.carGear like '%" + carGear[i] + "%' OR";
		}
		sql = sql.substring(0, sql.length() - 2);
		sql = sql + ") And";
		sql = sql + "	(";

		for (int i = 0; i < seat.length; i++) {
			sql = sql + "		t_car.seat like '%" + seat[i] + "%' OR";
		}
		sql = sql.substring(0, sql.length() - 2);
		sql = sql + ") ";

		if (price.length != 0) {
			sql = sql + "	And(";
			for (int i = 0; i < price.length; ++i) {
				sql = sql + "		t_car.carMoney>" + price[i]
						+ " AND t_car.carMoney<=" + price[++i] + " OR";
			}
			sql = sql.substring(0, sql.length() - 2);
			sql = sql + "	)";
		}

		sql = sql + ") AND t_car.state=1 AND " + "	t_car.carId NOT in" + "("
				+ "	Select carId" + "	from t_order "
				+ "	where ( collectionTime  between '" + beginTime + "' and '"
				+ endTime + "' or " + "	returnTime  between '" + beginTime
				+ "' and '" + endTime + "' )and ("
				+ "	t_order.orderState= 'To be paid' or " + "	orderState = 'Waiting for departure' or "
				+ "	orderState='Leasing' or " + "	orderState='Waiting for return' )" + ")";
		
		return SQLUtil.getInstance().search(sql);
	}

	public Object[] getRSCountBySearchCarCondition(int storeId,
			String[] carBrand, float[] price, String[] carGear, String[] seat,
			String beginTime, String endTime) {

		String sql = "SELECT count(*) " + "FROM t_car" + " WHERE " + "(" + "	("
				+ "		t_car.storeId=" + storeId + "" + "	) AND" + "	(";

		for (int i = 0; i < carBrand.length; i++) {
			sql = sql + "t_car.carBrand like '%" + carBrand[i] + "%' OR ";
		}

		sql = sql.substring(0, sql.length() - 3);
		sql = sql + ") And";
		sql = sql + "	(";

		for (int i = 0; i < carGear.length; i++) {
			sql = sql + "		t_car.carGear like '%" + carGear[i] + "%' OR";
		}

		sql = sql.substring(0, sql.length() - 2);
		sql = sql + ") And";
		sql = sql + "	(";

		for (int i = 0; i < seat.length; i++) {
			sql = sql + "		t_car.seat like '%" + seat[i] + "%' OR";
		}
		sql = sql.substring(0, sql.length() - 2);
		sql = sql + ") ";

		if (price.length != 0) {
			sql = sql + "	And(";
			for (int i = 0; i < price.length; ++i) {
				sql = sql + "		t_car.carMoney>" + price[i]
						+ " AND t_car.carMoney<=" + price[++i] + " OR";
			}
			sql = sql.substring(0, sql.length() - 2);
			sql = sql + "	)";
		}

		sql = sql + ") AND t_car.state=1 AND " + "	t_car.carId NOT in" + "("
				+ "	Select carId" + "	from t_order "
				+ "	where ( collectionTime  between '" + beginTime + "' and '"
				+ endTime + "' or " + "	returnTime  between '" + beginTime
				+ "' and '" + endTime + "') and ("
				+ "	t_order.orderState= 'To be paid' or " + "	orderState = 'Waiting for departure' or "
				+ "	orderState='Leasing' or " + "	orderState='Waiting for return' )" + ")";

		System.out.println(sql);

		return SQLUtil.getInstance().getSingleRow(sql);
	}

	public boolean changeCarStore(int carId, int storeId) {

		String sql = "update t_car set storeId=? where carId=? ";

		Object[] paramArray = new Object[2];
		paramArray[0] = storeId;
		paramArray[1] = carId;

		return SQLUtil.getInstance().update(sql, paramArray);

	}

	public ArrayList<String[]> getDayCarRentalNum(String date) {

		String sql="SELECT A.carId,IFNULL(rentalNum,0) as rentalNum "+
					" FROM t_car A LEFT JOIN ( "+
					"	SELECT t_order.carId,COUNT(*) as rentalNum "+
					"	FROM t_order "+
					"   where t_order.orderTime LIKE '"+date+"%' AND "+
					"		t_order.orderState='Waiting for departure'  "+
					"	GROUP BY t_order.carId "+
					" ) B ON A.carId=B.carId "+
					" ORDER BY rentalNum DESC";
		
		return SQLUtil.getInstance().search(sql);
	}

}
