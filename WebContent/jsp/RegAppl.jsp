<%@page import="de.hwg_lu.bw4s.beans.MessageBean"%>
<%@page import="de.hwg_lu.bw4s.beans.AccountBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="accountBean" class="de.hwg_lu.bw4s.beans.AccountBean" scope="session" />
<jsp:useBean id="messageBean" class="de.hwg_lu.bw4s.beans.MessageBean" scope="session" />

<%!
public String denullify(String s){
	if (s == null) return "";
	else return s;
	//return (s == null)?"":s;
}
public String[] denullify(String[] sa){
	if (sa != null) return sa;
	else return new String[0];
}
%>

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

String userid = request.getParameter("userid");
String password = request.getParameter("password");
String username = request.getParameter("username");
String email = request.getParameter("email");
String register = this.denullify(request.getParameter("register"));
String zumLogin = this.denullify(request.getParameter("zumLogin"));
// wenn ein Button eingelesen wird, dann zuallererst null-check!
//if (register == null) register = "";
//if (zumLogin == null) zumLogin = "";
//Aktionsweiche
//  für jeden Button ein Zweig
//  mit else if verbinden
//  am Schluss ein else Zweig für Unvorhergesehenes
if (register.equals("Registrieren")){
	//Registrierfunktion ausführen
	System.out.println("register geklickt");
	
	accountBean.setUserid(userid);
	accountBean.setPassword(password);
	accountBean.setUsername(username);
	accountBean.setEmail(email);
	try{	
		boolean accountAngelegt = accountBean.insertAccountIfNotExists();
		if (accountAngelegt){//alles ok)
			messageBean.setAccountInserted(userid);
		}else{//userid schon belegt
			messageBean.setAccountAlreadyExists(userid);
		}
	}catch(Exception e){//unerwarteter Fehler
		e.printStackTrace();
		messageBean.setUnexpectedError();
	}
	response.sendRedirect("./RegView.jsp");
}else if(zumLogin.equals("zum Login")){
	//zum Login geklickt -> Weiterleitung
	System.out.println("zumLogin geklickt");
	messageBean.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}else{
	//Unerwartetes: Könnte ein bösartiger Angriff sein
	System.out.println("nichts ordentliches geklickt");
	messageBean.setGeneralWelcome();
	response.sendRedirect("./LoginView.jsp");
}
//hier ist eigentlich Schluss mit Appl
/*
out.println("userid: " + userid + "<br>");     
out.println("password: " + password + "<br>");
out.println("username: " + username + "<br>");
out.println("email: " + email + "<br>");
out.println("register: " + register + "<br>");
out.println("zumLogin: " + zumLogin + "<br>");
*/
System.out.println("userid: " + userid);     
System.out.println("password: " + password);
System.out.println("username: " + username);
System.out.println("email: " + email);
System.out.println("register: " + register);
System.out.println("zumLogin: " + zumLogin);
%>


</body>
</html>