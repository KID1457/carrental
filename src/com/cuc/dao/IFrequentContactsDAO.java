package com.cuc.dao;

import java.util.ArrayList;
import java.util.Map;

import com.cuc.model.FrequentContacts;

public interface IFrequentContactsDAO {
	public boolean addFrequentContacts(FrequentContacts contacts);

	public ArrayList<FrequentContacts> getByMemberId(int memberId);

	public boolean updateFrequentContacts(FrequentContacts contacts);

	public boolean deleteByFrequentId(int frequentId);

	public Map<String, Object> getFrequentByFrequentId(int frequentId);

}
