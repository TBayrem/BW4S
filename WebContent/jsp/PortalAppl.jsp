<%@page import="de.hwg_lu.bw4s.beans.LoginBean"%>
<%@page import="de.hwg_lu.bw4s.beans.MessageBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="messageBean" class="de.hwg_lu.bw4s.beans.MessageBean" scope="session" />
<jsp:useBean id="loginBean"   class="de.hwg_lu.bw4s.beans.LoginBean"   scope="session" />

<%
String openAnwendung = request.getParameter("openAnwendung");
String abmelden = request.getParameter("abmelden");
if (openAnwendung == null) openAnwendung = "";
if (abmelden == null) abmelden = "";

if (!loginBean.isLoggedIn()){
	messageBean.setNotLoggedIn();
	response.sendRedirect("./LoginView.jsp");
}else if(openAnwendung.length() > 0){
	//messageBean nur dann setzen, wenn die Anwendung das unterstützt
	response.sendRedirect(openAnwendung);	
}else if(abmelden.equals("Abmelden")){
	loginBean.setLoggedIn(false);
	messageBean.setLoggedOff();
	response.sendRedirect("./LoginView.jsp");
}else{
	//Unerwartetes: Könnte ein bösartiger Angriff sein
	messageBean.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}
%>
</body>
</html>