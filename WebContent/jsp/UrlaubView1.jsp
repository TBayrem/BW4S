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
<% UrlaubBean urlaubBean = (UrlaubBean)session.getAttribute("urlaubBean");
if(urlaubBean== null)
{
	 urlaubBean= new UrlaubBean();
	 session.setAttribute("urlaubBean",urlaubBean);
} %>
<h4>Hier Können Urlaubziele eingegeben werden:</h4>
<form action="./Urlaub.jsp" method="get" >
<table>
	<tr>
		<td>UrlaubZiel</td>
		<td><input type="text" name="UrlaubZiel" value=""/>
		</td>
	</tr>
	<tr>
		<td>Bewertung</td>
		<td><input type="text" name="Bewertung" value="" /></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="anzeigen" value="Alle Anzeigen" />
		</td>
	</tr>
</table>
</form>
</body>
</html>