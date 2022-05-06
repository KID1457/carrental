package com.cuc.data.insert;

import java.util.Date;
import java.util.Random;

import com.cuc.util.DateRandomTest;
import com.cuc.util.SQLUtil;

/**
 * 添加会员信息
 * 
 * @author Administrator
 * 
 */
public class InsertMemberData {

	public static String base = "abcdefghijklmnopqrstuvwxyz0123456789";
	public static String firstName = "ZhaoLiQianSun";
	public static String girl = "DuryeeShannenTaineShere";
	public static String boy = "LanphierBirgitOlivetteMccamyAlexDylan";
	public static String[] road = "Chongqing Mansion,Black road,Tenth road,Zunyi road,Xiangtan road,Ruijin square,Xianshan road,Dongshan road,Xianshanxi Tower,Baisha road,Zebra square,Airport road,Minhang road"
			.split(",");
	public static final String[] email_suffix = "@gmail.com,@yahoo.com,@msn.com,@hotmail.com,@aol.com,@ask.com,@live.com,@qq.com,@0355.net,@163.com,@163.net,@263.net,@3721.net,@yeah.net,@googlemail.com,@126.com,@sina.com,@sohu.com,@yahoo.com.cn"
			.split(",");

	public static int getNum(int start, int end) {
		return (int) (Math.random() * (end - start + 1) + start);
	}

	public static String getIdentity() {

		Random rd = new Random();
		String num = "";
		for (int i = 0; i < 18; i++) {
			num += rd.nextInt(10);
		}

		return num;
	}

	public static String getEmail(int lMin, int lMax) {
		int length = getNum(lMin, lMax);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = (int) (Math.random() * base.length());
			sb.append(base.charAt(number));
		}
		sb.append(email_suffix[(int) (Math.random() * email_suffix.length)]);
		return sb.toString();
	}

	public static String[] telFirst = "134,135,136,137,138,139,150,151,152,157,158,159,130,131,132,155,156,133,153"
			.split(",");

	public static String getTel() {
		int index = getNum(0, telFirst.length - 1);
		String first = telFirst[index];
		String second = String.valueOf(getNum(1, 888) + 10000).substring(1);
		String thrid = String.valueOf(getNum(1, 9100) + 10000).substring(1);
		return first + second + thrid;
	}

	public static String name_sex = "";

	public static String getChineseName() {
		int index = getNum(0, firstName.length() - 1);
		String first = firstName.substring(index, index + 1);
		int sex = getNum(0, 1);
		String str = boy;
		int length = boy.length();
		if (sex == 0) {
			str = girl;
			length = girl.length();
			name_sex = "Female";
		} else {
			name_sex = "Male";
		}
		index = getNum(0, length - 1);
		String second = str.substring(index, index + 1);
		int hasThird = getNum(0, 1);
		String third = "";
		if (hasThird == 1) {
			index = getNum(0, length - 1);
			third = str.substring(index, index + 1);
		}
		return first + second + third;
	}

	public static String getRoad() {
		int index = getNum(0, road.length - 1);
		String first = road[index];
		String second = String.valueOf(getNum(11, 150)) + "number";
		String third = "-" + getNum(1, 20) + "-" + getNum(1, 10);
		return first + second + third;
	}

	public static String getUserNo(String tel) {

		return "user" + tel.substring(4);
	}

	public static String getRegTime(String beginTime, String endTime) {

		return DateRandomTest.randomDate(beginTime, endTime).toLocaleString();
	}

	public static void main(String[] args) {

		Date d1 = new Date();

		String beginTime = "2016-08-01";// Assumed member registration time
		String endTime = "2016-12-31";
		String password = "111111";// Password is 111111

		String sql = "insert into t_member(memberId,memberNo,memberPassword,memberName,memberSex,memberPhone,registerTime) "
				+ "	values(?,?,?,?,?,?,?)";

		for (int i = 0; i < 10000; i++) {
			String tel = getTel();// Phone number
			String memberNo = getUserNo(tel);// User name
			String memberName = getChineseName();// Name
			String sex = name_sex;
			String regTime = getRegTime(beginTime, endTime);

			Object[] paramArray = new Object[7];
			paramArray[0] = i + 15;
			paramArray[1] = memberNo;
			paramArray[2] = password;
			paramArray[3] = memberName;
			paramArray[4] = sex;
			paramArray[5] = getTel();
			paramArray[6] = regTime;

			System.out.println("result"
					+ SQLUtil.getInstance().update(sql, paramArray));

		}

		Date d2 = new Date();
		System.out.println("Time spent：" + (d2.getTime() - d1.getTime()));
	}
}