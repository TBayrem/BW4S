<%@page import="de.hwg_lu.bw4s.beans.LoginBean"%>
<%@page import="de.hwg_lu.bw4s.beans.MessageBean"%>
<%@page import="de.hwg_lu.bw4s.beans.GUIBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BW4S-Portal - Portalseite</title>
</head>
<body>
<jsp:useBean id="guiBean" class="de.hwg_lu.bw4s.beans.GUIBean" scope="session" />
<jsp:useBean id="messageBean" class="de.hwg_lu.bw4s.beans.MessageBean" scope="session" />
<jsp:useBean id="loginBean" class="de.hwg_lu.bw4s.beans.LoginBean" scope="session" />
<jsp:getProperty name="guiBean" property="headlineHtml" />
<jsp:getProperty name="messageBean" property="messageHtml" />
<jsp:getProperty name="loginBean" property="loginCheckRedirectHtml" />
<%
//	if (!loginBean.isLoggedIn()){
//		out.println("<meta http-equiv='refresh' content='0; URL=./PortalAppl.jsp' >");
//	}
%>

<a href="./PortalAppl.jsp?openAnwendung=UrlaubAppl.jsp">Anwendung 1: Urlaubsziele</a><br>
<a href="./PortalAppl.jsp?openAnwendung=ShowAllAccountsView.jsp">Anwendung 2: Show all Accounts</a><br>
<br>

<form action="./PortalAppl.jsp" method="get" >
	<input type="submit" name="abmelden" value="Abmelden" />
</form>
</body>
</html>