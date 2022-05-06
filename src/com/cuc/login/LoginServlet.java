package com.cuc.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cuc.dao.IBusinessStoreDAO;
import com.cuc.dao.IMemberDAO;
import com.cuc.dao.ISysAdminDAO;
import com.cuc.dao.imp.BusinessStoreDAO;
import com.cuc.dao.imp.MemberDAO;
import com.cuc.dao.imp.SysAdminDAO;
import com.cuc.model.BusinessStore;
import com.cuc.model.Member;
import com.cuc.model.SysAdmin;
import com.cuc.util.CommonUtil;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String identity = request.getParameter("identity");
		String userNo = request.getParameter("username");
		String password = request.getParameter("password");
		String codeNum = request.getParameter("codeNum");
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");

		if (rand.equals(codeNum)) {

			if (identity.equals("1")) {
				IMemberDAO memberDAO = new MemberDAO();
				Member member = memberDAO.memberLogin(userNo, password);
				if (member == null) {
					CommonUtil.showAlertMessage(response, "Error content to DB。");
				} else if (member.getMemberId() > 0) {
					session.setAttribute("member", member);
					response
							.sendRedirect("/CarRentalOnline/member/welcome.jsp");
				} else {
					CommonUtil.showAlertMessage(response, "Wrong account or password!");
				}

			} else if (identity.equals("2")) {
				IBusinessStoreDAO storeDAO = new BusinessStoreDAO();
				BusinessStore store = storeDAO.businessStoreLogin(userNo,
						password);
				if (store == null) {
					CommonUtil.showAlertMessage(response, "Error content to DB");
				} else if (store.getStoreId() > 0) {

					if (store.getState() == 0) {
						CommonUtil.showAlertMessage(response,
								"The business store account has been closed, please contact the administrator!");
						return;
					}

					session.setAttribute("store", store);

					request.getRequestDispatcher("/businessStore/welcome.jsp")
							.forward(request, response);
				} else {
					CommonUtil.showAlertMessage(response, "Wrong account or password!");
				}

			} else if (identity.equals("3")) {
				ISysAdminDAO adminDAO = new SysAdminDAO();
				SysAdmin admin = adminDAO.sysAdminLogin(userNo, password);
				if (admin == null) {
					CommonUtil.showAlertMessage(response, "Error content to DB");
				} else if (admin.getSId() > 0) {
					session.setAttribute("admin", admin);
					request.getRequestDispatcher("/sysAdmin/welcome.jsp")
							.forward(request, response);
				} else {
					CommonUtil.showAlertMessage(response, "Wrong account or password!");
				}
			}
		} else {
			CommonUtil.showAlertMessage(response, "Error verification code!");
		}
	}

}
