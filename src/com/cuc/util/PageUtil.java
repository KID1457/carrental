package com.cuc.util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	public static final String Text = "text";
	public static final String BbsText = "bbstext";
	public static final String BbsImage = "bbsimage";
	private int pageSize = 20;
	private int rsCount = 0;
	private int pageCount = 0;
	private int currentPage = 1;
	private HttpServletRequest request = null;

	public PageUtil(HttpServletRequest request) {
		this.request = request;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setRsCount(int rsCount) {
		this.rsCount = rsCount;
	}

	public int getPageCount() {
		this.pageCount = (this.rsCount - 1) / this.pageSize + 1;
		return this.pageCount;
	}

	public int getCurrentPage() {
		if (this.request.getParameter("currentPage") != null) {
			this.currentPage = Integer.parseInt(this.request
					.getParameter("currentPage"));
		}
		return this.currentPage;
	}

	public String createPageTool(String flag) {
		StringBuffer str = new StringBuffer();
		@SuppressWarnings("unused")
		String temp = "";
		String url = this.getParamUrl();
		int ProPage = this.currentPage - 1;
		int Nextpage = this.currentPage + 1;
		if (flag.equals(PageUtil.Text)) {
			str.append("<form method='post' name='pageform' action=''>");
			str
					.append("<table width='88%' border='0' cellspacing='0' cellpadding='0'>");
			str.append("<tr>");
			str.append("<td width='3%'>&nbsp;</td>");
			str.append("<td height='26'>");
			str.append("Records " + this.rsCount + "。&nbsp;&nbsp;&nbsp;");
			str.append("Total" + this.pageCount + "Pages&nbsp;&nbsp;&nbsp;");
			str.append("Size" + this.pageSize + "Records &nbsp;&nbsp;&nbsp;");
			str.append("Current" + this.currentPage + "/" + this.pageCount + "Page");
			str.append("</td><td>");
			if (this.currentPage > 1) {
				str.append("<a href='" + url + "&currentPage=1'>Home</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("<a href='" + url + "&currentPage=" + ProPage
						+ "'>Last</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("Home");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("Last");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			if (this.currentPage < this.pageCount) {
				str.append("<a href='" + url + "&currentPage=" + Nextpage
						+ "'>Next</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("Next");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			if (this.pageCount > 1 && this.currentPage != this.pageCount) {
				str.append("<a href='" + url + "&currentPage=" + pageCount
						+ "'>End</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("End");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			str.append("go to");
			str
					.append("<select name='currentPage' onchange='javascript:ChangePage(this.value);'>");
			for (int j = 1; j <= pageCount; j++) {
				str.append("<option value='" + j + "'");
				if (currentPage == j) {
					str.append("selected");
				}
				str.append(">");
				str.append("" + j + "");
				str.append("</option>");
			}
			str.append("</select>Page");
			str.append("</td><td width='3%'>&nbsp;</td></tr></table>");
			str.append("<script language='javascript'>");
			str.append("function ChangePage(testpage){");
			str.append("document.pageform.action='" + url
					+ "&currentPage='+testpage+'';");
			str.append("document.pageform.submit();");
			str.append("}");
			str.append("</script>");
			str.append("</form>");
		} else if (flag.equals(PageUtil.BbsText)) {
			str
					.append("<table width='88%' border='0' cellspacing='0' cellpadding='0'>");
			str.append("<tr>");
			str.append("<td width='3%'>&nbsp;</td>");
			str.append("<td height='26'>");
			str.append("Records" + this.rsCount + ".&nbsp;&nbsp;");
			str.append("Total" + this.pageCount + "Pages&nbsp;&nbsp;");
			str.append("Size " + this.pageSize + "Records &nbsp;&nbsp;");
			str.append("Current" + this.currentPage + "/" + this.pageCount + "Page");
			str.append("</td><td>");
			if (this.currentPage > 1) {
				str.append("<a href='" + url + "&currentPage=1'>Home</a>");
				str.append("&nbsp;&nbsp;");
			}
			if (this.currentPage > 1) {
				str.append("<a href='" + url + "&currentPage=" + ProPage
						+ "'>Last</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			if (this.pageCount <= 10) {
				for (int i = 1; i <= this.pageCount; i++) {
					if (this.currentPage == i) {
						str.append("<font color=red>[" + i
								+ "]</font>&nbsp;&nbsp;");
					} else {
						str.append("<a href='" + url + "&currentPage=" + i
								+ "'>" + i + "</a>&nbsp;&nbsp;");
					}
				}
			} else {

				int endPage = this.currentPage + 4;
				if (endPage > this.pageCount) {
					endPage = this.pageCount;
				}
				int startPage = 0;
				if (this.pageCount >= 8 && this.currentPage >= 8) {
					startPage = this.currentPage - 5;
				} else {
					startPage = 1;
				}
				for (int i = startPage; i <= endPage; i++) {
					if (this.currentPage == i) {
						str.append("<font color=red>[" + i
								+ "]</font>&nbsp;&nbsp;");
					} else {
						str.append("<a href='" + url + "&currentPage=" + i
								+ "'>" + i + "</a>&nbsp;&nbsp;");
					}
				}
			}
			if (this.currentPage < this.pageCount) {
				str.append("<a href='" + url + "&currentPage=" + Nextpage
						+ "'>Next</a>");
				str.append("&nbsp;&nbsp;");
			}
			if (this.pageCount > 1 && this.currentPage != this.pageCount) {
				str.append("<a href='" + url + "&currentPage=" + pageCount
						+ "'>End</a>");
				str.append("&nbsp;&nbsp;");
			}

			str.append("</td><td width='3%'>&nbsp;</td></tr></table>");
		} else if (flag.equals(PageUtil.BbsImage)) {
			str.append("<style>");
			str.append("BODY {FONT-SIZE: 12px;FONT-FAMILY:宋体; }");
			str
					.append("DIV.meneame {  FONT-SIZE: 80%; PADDING-BOTTOM: 3px; MARGIN: 3px; COLOR: #ff6500; PADDING-TOP: 3px; TEXT-ALIGN: center}");
			str
					.append("DIV.meneame A {BORDER-RIGHT: #ff9600 1px solid; PADDING-RIGHT: 7px; BACKGROUND-POSITION: 50% bottom; BORDER-TOP: #ff9600 1px solid; PADDING-LEFT: 7px; BACKGROUND-IMAGE: url('"
							+ this.request.getContextPath()
							+ "/member/images/meneame.jpg'); PADDING-BOTTOM: 5px; BORDER-LEFT: #ff9600 1px solid; COLOR: #ff6500; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ff9600 1px solid; TEXT-DECORATION: none}");
			str
					.append("DIV.meneame A:hover {BORDER-RIGHT: #ff9600 1px solid; BORDER-TOP: #ff9600 1px solid; BACKGROUND-IMAGE: none; BORDER-LEFT: #ff9600 1px solid; COLOR: #ff6500; BORDER-BOTTOM: #ff9600 1px solid; BACKGROUND-COLOR: #ffc794}");
			str
					.append("DIV.meneame SPAN.current {BORDER-RIGHT: #ff6500 1px solid; PADDING-RIGHT: 7px; BORDER-TOP: #ff6500 1px solid; PADDING-LEFT: 7px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; BORDER-LEFT: #ff6500 1px solid; COLOR: #ff6500; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ff6500 1px solid; BACKGROUND-COLOR: #ffbe94}");
			str
					.append("DIV.meneame SPAN.disabled {BORDER-RIGHT: #ffe3c6 1px solid; PADDING-RIGHT: 7px; BORDER-TOP: #ffe3c6 1px solid; PADDING-LEFT: 7px; PADDING-BOTTOM: 5px; BORDER-LEFT: #ffe3c6 1px solid; COLOR: #ffe3c6; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ffe3c6 1px solid}");
			str.append("</style>");
			str.append("<div class=\"meneame\">");
			if (this.currentPage > 1) {
				str.append("<a href='" + url
						+ "&currentPage=1' hidefocus=\"true\">Home</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("<a href='" + url + "&currentPage=" + ProPage
						+ "' hidefocus=\"true\">Last</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">Home</span>");
				str.append("&nbsp;&nbsp;");
				str.append("<span class=\"disabled\">Last</span>");
				str.append("&nbsp;&nbsp;");
			}
			if (this.pageCount <= 10) {
				for (int i = 1; i <= this.pageCount; i++) {
					if (this.currentPage == i) {
						str.append("<span class=\"current\">" + i + "</span>");
					} else {
						str.append("<a href='" + url + "&currentPage=" + i
								+ "' hidefocus=\"true\">" + i
								+ "</a>&nbsp;&nbsp;");
					}
				}
			} else {
				int endPage = this.currentPage + 4;
				if (endPage > this.pageCount) {
					endPage = this.pageCount;
				}
				int startPage = 0;
				if (this.pageCount >= 8 && this.currentPage >= 8) {
					startPage = this.currentPage - 5;
				} else {
					startPage = 1;
				}
				for (int i = startPage; i <= endPage; i++) {
					if (this.currentPage == i) {
						str.append("<span class=\"current\">" + i + "</span>");
					} else {
						str.append("<a href='" + url + "&currentPage=" + i
								+ "' hidefocus=\"true\">" + i
								+ "</a>&nbsp;&nbsp;");
					}
				}
			}

			if (this.currentPage < this.pageCount) {
				if (this.currentPage < this.pageCount - 10) {
					str.append("...");
					str.append("<a href='" + url + "&currentPage="
							+ (this.pageCount - 1) + "' hidefocus=\"true\">"
							+ (this.pageCount - 1) + "</a>&nbsp;&nbsp;");
					str.append("<a href='" + url + "&currentPage="
							+ this.pageCount + "' hidefocus=\"true\">"
							+ this.pageCount + "</a>&nbsp;&nbsp;");
				}

				str.append("<a href='" + url + "&currentPage=" + Nextpage
						+ "' hidefocus=\"true\">Next</a>");
				str.append("&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">Next</span>");
				str.append("&nbsp;&nbsp;");
			}
			if (this.pageCount > 1 && this.currentPage != this.pageCount) {
				str.append("<a href='" + url + "&currentPage=" + pageCount
						+ "' hidefocus=\"true\">End</a>");
				str.append("&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">End</span>");
				str.append("&nbsp;&nbsp;");
			}
			str.append("</div>");
		}
		return str.toString();
	}

	@SuppressWarnings("unchecked")
	private String getParamUrl() {
		String result = null;
		String pageUrl = request.getRequestURI();
		Enumeration<String> enumeration = request.getParameterNames();
		String totalParamUrl = "";
		while (enumeration.hasMoreElements()) {
			String param_name = enumeration.nextElement();
			String param_value = request.getParameter(param_name);
			if (param_name != null && !param_name.equals("")
					&& !param_name.equals("currentPage")
					&& !param_value.equals("")) {
				if (totalParamUrl.equals("")) {
					totalParamUrl = param_name + "=" + param_value;
				} else {
					totalParamUrl = totalParamUrl + "&" + param_name + "="
							+ param_value;
				}
			}
		}
		if (pageUrl.indexOf("?") > -1) {
			result = pageUrl + "&" + totalParamUrl;
		} else {
			result = pageUrl + "?" + totalParamUrl;
		}
		
		return result;
	}

}
