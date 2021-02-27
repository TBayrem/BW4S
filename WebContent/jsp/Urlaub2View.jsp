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
<h4>Hier werden die Urlaubsziele angezeigt</h4>
<textarea cols="40" rows="8">
<%= urlaubBean.getAlleUrlaubszieleAlsHtml() %>
</textarea>
<form action="./UrlaubAppl.jsp" method="get">
	<input type="submit" name="eingeben" value="weitere eingeben" />
	<input type="submit" name="loeschen" value="alle loeschen" />
</form>
</body>
</html>