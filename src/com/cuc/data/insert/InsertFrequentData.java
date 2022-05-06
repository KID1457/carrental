package com.cuc.data.insert;

import java.util.Date;
import java.util.Random;

import com.cuc.dao.IFrequentContactsDAO;
import com.cuc.dao.imp.FrequentContactsDAO;
import com.cuc.util.SQLUtil;

/**
 * Add common renter information Add two common renter information per member user
 * 
 * @author Administrator
 * 
 */
public class InsertFrequentData {

	public static void main(String[] args) {

		Date d1 = new Date();

		String[] idTypes = { "ID card", "Officer's Pass", "ID card", "Passport", "ID card", "Taiwan Compatriot Card", "ID card",
				"Hong Kong and Macao Residents Entry Permit", "ID card", "ID card", "ID card" };

		String[] provinces = { "Fujian province", "Anhui province", "Jiangxi province", "Jilin province", "Hunan province", "Hubei province", "Zhejiang province",
				"Jiangsu province", "Yunnan province" };
		String[][] citys = { { "Fuzhou", "Xiamen", "Putian" }, { "Hefei", "Huangshan", "Suzhou" },
				{ "Nanchang", "Jiujiang", "Fuzhou" }, { "Changchun", "Siping", "Jilin" },
				{ "Changsha", "Zhuzhou", "Xiangtan" }, { "Wuhan", "Huangshi", "shiyan" },
				{ "Hangzhou", "Ningbo", "Wenzhou" }, { "Nanjing", "Wuxi", "Xuzhou" },
				{ "Kunming", "Qujin", "Yuxi" } };

		String sql = "insert into t_frequentcontacts(memberId,frequentName,frequentPhone,idType,Identity,frequentProvince,frequentCity,frequentAddresss) values(?,?,?,?,?,?,?,?)";

		//10021
		for (int i = 3; i < 10021; i++) {
			for (int j = 0; j < 2; j++) {

				Random rd = new Random();
				int idType_num = rd.nextInt(idTypes.length);

				String idType = idTypes[idType_num];// Type of document

				String identity = InsertMemberData.getIdentity();// Document number

				String frequentName = InsertMemberData.getChineseName();// Name

				String tel = InsertMemberData.getTel();// Phone number

				int provinces_num = rd.nextInt(provinces.length);
				String province = provinces[provinces_num];// Province

				String city = citys[provinces_num][rd.nextInt(3)];// City

				String address = InsertMemberData.getRoad();// Specific address

				Object[] paramArray = new Object[8];
				paramArray[0] = i;//memberId
				paramArray[1] = frequentName;
				paramArray[2] = tel;
				paramArray[3] = idType;
				paramArray[4] = identity;
				paramArray[5] = province;
				paramArray[6] = city;
				paramArray[7] = address;

				System.out.println("result:"
						+ SQLUtil.getInstance().update(sql, paramArray));
			}

		}

		Date d2 = new Date();

		System.out.println("Time spent：" + (d2.getTime() - d1.getTime()));

	}

}
