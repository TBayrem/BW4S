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
<h3>Mit Glück sehen wir hier bald alle Accounts aus unserer account-Tabelle</h3>
<form action="./ShowAllAccountsAppl.jsp" method="get">
	<input type="submit" name="refresh" value="aktualisiere" />
	<input type="submit" name="deleteAll" value="loesche alle Accounts" />
</form>
<jsp:getProperty name="saab" property="accountsAsHtml" />





</body>
</html>