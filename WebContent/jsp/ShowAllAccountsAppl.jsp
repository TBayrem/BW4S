<%@page import="de.hwg_lu.bw4s.beans.ShowAllAccountsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="saab" class="de.hwg_lu.bw4s.beans.ShowAllAccountsBean" scope="session" /> 
<%
	String refresh = request.getParameter("refresh");
	String deleteAll = request.getParameter("deleteAll");
	if (refresh == null) refresh = "";
	if (deleteAll == null) deleteAll = "";

	if (refresh.equals("aktualisiere")){
		saab.readAllAccountsFromDB();
		response.sendRedirect("./ShowAllAccountsView.jsp");
	}else if(deleteAll.equals("loesche alle Accounts")){
		saab.deleteAllAccountsFromDB();
		response.sendRedirect("./ShowAllAccountsView.jsp");
	}else{
		response.sendRedirect("./ShowAllAccountsView.jsp");
	}
%>
</body>
</html>