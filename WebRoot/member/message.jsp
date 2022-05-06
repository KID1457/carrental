<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cuc.dao.IMessageDAO"%>
<%@page import="com.cuc.dao.imp.MessageDAO"%>
<%@page import="java.util.ArrayList"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script language="javascript">
	function countChar(textareaNamezzjs, spanName) {
		document.getElementById(spanName).innerHTML = document
				.getElementById(textareaNamezzjs).value.length;
	}
	function alarm(){
		alert("Only JPG, GIF and BMP files can be uploaded");
	}
	function checkExt(){
		var allowArray = new Array("jpg","gif","bmp");
		var simg = document.getElementById("simg").value;
		var fileExt = simg.substr(simg.lastIndexOf(".")+1);
		var flag = false;
		for(var i = 0;i<allowArray.length;i++){
			if (allowArray[i] == fileExt.toLowerCase()){
				flag = true;
				break;
			}
		}
		if (flag == false){
			alert("File type not allowed to upload, only JPG, GIF, BMP files are allowed to upload");
		}
		return flag;
	}
	
	
	
</script>

<link rel="stylesheet" href="<%=basePath%>/member/css/tiyan.css"
	type="text/css"></link>
<title>Car rental experience</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<!--head end -->
	<div id="wrap-banner">
		<div class="box-banner">
			<div class="box-exam">
				<span class="exam-tit" id="examtit">Sample experience content</span>
			</div>
			<p class="stp-a">
				Release the first driving experience, <br>such as: first
				driving to work, first self driving tour<br> <br> Post
				experience to personal Center- <a
					href="<%=basePath%>member/memberInfoCenter.jsp">My message</a>Query
				audit information.
			</p>
		</div>
	</div>

	<div id="wrap-fm">
		<div class="box-fm">
			<form
				action="<%=basePath%>servlet/MemberServlet?method=insertMessage"
				method="post" enctype="multipart/form-data"
				onSubmit="return checkExt();">
				<div class="form-post">
					<!--提交-->
					<div id="mycomment" class="box-write" style="display: block;">
						<h3 class="write-tit">
							<span class="hid-txt">Release experience content</span> <strong
								class="zishu"> <span id="num">0</span><span
								class="color">Word number</span>
							</strong>
						</h3>
						<textarea name="txtComment" id="txtComment" class="area"
							onkeydown="countChar('txtComment','num');"
							onkeyup="countChar('txtComment','num');"></textarea>
						<div class="box-up-subm">
							<span class="sp-up">Upload photo</span> <input type="file"
								name="simg" id="simg" class="up-file"> <strong
								class="img-req">(only JPG, GIF, BMP picture files are
								supported)</strong> <input type="submit" name="btnComment" value="commit"
								id="btnComment" class="subm-ty com-btn-style">
						</div>
					</div>
				</div>
			</form>
			<div class="latest-notice">
				<p>
					<strong>Active object：</strong><br> <br> All registered
					member users.
				</p>
			</div>
		</div>
	</div>

	<div id="main">
		<div class="main-con">
			<div class="wrap-tylist">
				<table id="DataList_ppl_ty" cellspacing="0"
					style="width: 100%; border-collapse: collapse;">
					<tbody>
						<%
								ArrayList<String[]> list = (ArrayList<String[]>) request
										.getAttribute("messagelist");
								for (int i = 0; i < list.size(); i++) {
									String[] msg = list.get(i);
									msg[3] = msg[3].substring(0, 4) + "****"
											+ msg[3].substring(8, 11);
							%>
						<tr>
							<td>
								<div class="box-tylist" id="ppl3960">
									<strong class="u-npho">User account: <%=msg[2]%> <span>(<%=msg[3]%>)
									</span>：
									</strong>
									<p class="up-con">
										<%=msg[5]%>
									</p>
									<div class="box-uimg">
										<img src="<%=basePath%>uploadFiles/<%=msg[7]%>"
											id="DataList_ppl_ty_mypicture_0">
									</div>
									<div class="up-time">
										Share in：<%=msg[6].substring(0,19)%>
									</div>
								</div>
							</td>
						</tr>
						<%
								}
							%>

					</tbody>
				</table>
				<div class="wrap-page">
					<%=request.getAttribute("pageTool")%>
				</div>
			</div>
		</div>
		<div class="side-bar">
			<img src="http://s2.1haimg.cn/image/tiyan/top-cor.png"
				class="img-top">

		</div>
	</div>
</body>
</html>