<%@page import="de.hwg_lu.bw4s.beans.UrlaubBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
UrlaubBean urlaubBean = (UrlaubBean) session.getAttribute("urlaubBean");
if (urlaubBean == null){
	urlaubBean = new UrlaubBean();
	session.setAttribute("urlaubBean", urlaubBean);
}
%>
<h4>Hier können Urlaubsziele eingegeben werden</h4>
<form action="./UrlaubAppl.jsp" method="get">
	Urlaubsziel: <input type="text" name="urlaubsziel" value="" /><br>
	Bewertung: <input type="text" name="bewertung" value="" /><br>
	<input type="submit" name="anzeigen" value="alle anzeigen" />



</form>
</body>
</html>