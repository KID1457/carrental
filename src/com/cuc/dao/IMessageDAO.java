package com.cuc.dao;

import java.util.ArrayList;

import com.cuc.model.Message;

public interface IMessageDAO {
	public boolean addMessage(Message message);

	public boolean deleteByMessageId(int messageId);

	public ArrayList<String[]> searchAllMessage(int pageSize,
			int currentPage);

	public boolean updateMessageState(int messageId, int state);

	public ArrayList<Message> getMessageByMemberId(int memberId, int state);

	public ArrayList<String[]> searchAllMessageByState(int state, int pageSize,
			int currentPage);

	public int getStateCount(int state);
}
