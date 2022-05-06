package com.cuc.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cuc.dao.IMessageDAO;
import com.cuc.dao.imp.MessageDAO;
import com.cuc.util.PageUtil;

public class MessageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if (method == null) {
			method = "";
		}
		if (method.equals("welShowMessage")) {
			welShowMessage(request, response);
		}

	}

	/**
	 * Show all messages that have been approved
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void welShowMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		IMessageDAO messageDAO = new MessageDAO();

		PageUtil pageUtil = new PageUtil(request);
		pageUtil.setPageSize(5);// Set the number of items to be displayed per page
		int count = messageDAO.getStateCount(1);// Get the total number of messages that have been reviewed
		pageUtil.setRsCount(count);

		int pageCount = pageUtil.getPageCount();// Calculate the total number of pages
		int currentPage = pageUtil.getCurrentPage();

		String pageTool = pageUtil.createPageTool(pageUtil.BbsImage);// Create paging tool bar
		request.setAttribute("pageTool", pageTool);

		ArrayList<String[]> list = messageDAO.searchAllMessageByState(1,
				pageUtil.getPageSize(), currentPage);
		request.setAttribute("messagelist", list);
		request.getRequestDispatcher("/member/message.jsp").forward(request,
				response);

	}
}
