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
<h4>hier werde angezeigt</h4>

<textarea rows="8" cols="40">

<%= urlaubBean.getAlleUrlaubszieleAlsHtml() %>
</textarea>
<form action="./Urlaub.jsp" method="get">
    <input type="submit" name="eingeben" value="weiter eingeben"/>
    
    <input type="submit" name="loschen" value="alle lochen"/>
    
</form>
</body>
</html>
