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

<%! public String denullify(String s){if (s == null) return ""; else return s;} %>

<%
String userid   = request.getParameter("userid");
String password = request.getParameter("password");
String login    = this.denullify(request.getParameter("login"));
String zurReg   = this.denullify(request.getParameter("zurReg"));

if (login.equals("Anmelden")){//Anmeldefunktion
	loginBean.setUserid(userid);
	loginBean.setPassword(password);
	try{
		boolean gefunden = loginBean.checkUseridPassword();
		if (gefunden){
			messageBean.setLoginSuccessful(userid);			
			loginBean.setLoggedIn(true);
			response.sendRedirect("./PortalView.jsp");
		}else{
			messageBean.setLoginFailed();
			loginBean.setLoggedIn(false);
			response.sendRedirect("./LoginView.jsp");
		}
	}catch(Exception e){//unerwarteter Fehler
		e.printStackTrace();
		messageBean.setUnexpectedError();
		response.sendRedirect("./LoginView.jsp");
	}
}else if(zurReg.equals("zurReg")){
	messageBean.setRegistrationWelcome();
	response.sendRedirect("./RegView.jsp");
}else{
	messageBean.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}
%>
</body>
</html>