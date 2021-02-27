<%@page import="de.hwg_lu.bw4s.beans.GUIBean"%>
<%@page import="de.hwg_lu.bw4s.beans.AccountBean"%>
<%@page import="de.hwg_lu.bw4s.beans.MessageBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BW4S-Portal - Registrierung</title>
<script type="text/javascript" src="../js/register.js" ></script>
<link type="text/css" rel="stylesheet" href="../css/Portal.css" />

</head>
<body>
<jsp:useBean id="accountBean" class="de.hwg_lu.bw4s.beans.AccountBean" scope="session" />
<jsp:useBean id="messageBean" class="de.hwg_lu.bw4s.beans.MessageBean" scope="session" />
<jsp:useBean id="guiBean" class="de.hwg_lu.bw4s.beans.GUIBean" scope="session" />

<jsp:getProperty name="guiBean" property="headlineHtml" />
<!-- 
<table>
	<tr>
		<td>
			<h3>BW4S-Portal</h3>
		</td>
		<td>
			<img src="../img/HWGLU_logo.png" width="300"
				alt="Hier sollte das Logo der HWG Lu stehen"
				title="Logo der HWG Lu"
			/>
		</td>
	</tr>
</table>
-->









<%
//AccountBean accountBean = (AccountBean) session.getAttribute("accountBean");
//if (accountBean == null){
//	accountBean = new AccountBean();
//	session.setAttribute("accountBean", accountBean);
//}
//MessageBean messageBean = (MessageBean) session.getAttribute("messageBean");
//if (messageBean == null){
//	messageBean = new MessageBean();
//	session.setAttribute("messageBean", messageBean);
//}
%>
<jsp:getProperty name="messageBean" property="messageHtml" />
<!-- 
<h2><jsp:getProperty name="messageBean" property="infoMessage" /></h2>
<h4><jsp:getProperty name="messageBean" property="actionMessage" /></h4>
<h2><%= messageBean.getInfoMessage() %></h2>
<h4><%= messageBean.getActionMessage() %></h4>
 -->
<form action="./RegAppl.jsp" method="get" onsubmit="return checkUserInput(this)" >
<table>
	<tr>
		<td>Nickname:</td>
		<td><input type="text"
					name="userid"
					value="<jsp:getProperty name="accountBean" property="userid" />"
					onkeyup="checkUserid(this.value)"
			/>
		</td>
		<td id="useridMsgField" class="msgField"></td>
	</tr>
	<tr>
		<td>Passwort:</td>
		<td><input type="password" name="password" value="" /></td>
		<td id="passwordMsgField" class="msgField"></td>
	</tr>
	<tr>
		<td>Username:</td>
		<td><input type="text" name="username"
					value="<jsp:getProperty name="accountBean" property="username" />" 
			/>
		</td>
		<td id="usernameMsgField" class="msgField"></td>
	</tr>
	<tr>
		<td>E-Mail:</td>
		<td><input type="email" name="email" 
					value="<jsp:getProperty name="accountBean" property="email" />" 
			/>
		</td>
		<td id="emailMsgField" class="msgField"></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="submit" name="register" value="Registrieren" />
			<input type="submit" name="zumLogin" value="zum Login" />
		</td>
	</tr>
</table>
</form>
</body>
</html>