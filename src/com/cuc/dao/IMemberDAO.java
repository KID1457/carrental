package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.Member;

public interface IMemberDAO {
	public Member memberLogin(String memberNo, String memberPassowrd);

	public boolean isSameMemberNo(String memberNo);

	public boolean updateMember(Member member);

	public Member getByMemberId(int memberId);

	public boolean addMember(Member member);
	
	public Object[] getMemberByNo(String memberNo);

	public boolean changePassword(int memberId, String newPassword);

	public ArrayList<String[]> pageSearchAllMember(int pageSize, int currentPage);

	public Object[] getMemberCount();

	public Object[] getDayRegCount(String date);
	
	public Object[] getMonthRegCount(String year,String month);
	
}
