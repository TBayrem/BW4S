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

 UrlaubBean urlaubBean = (UrlaubBean)session.getAttribute("urlaubBean");
 if(urlaubBean== null)
 {
	 urlaubBean= new UrlaubBean();
	 session.setAttribute("urlaubBean",urlaubBean);
 }


 String Urlaubziel = request.getParameter("UrlaubZiel");
String Bewertung = request.getParameter("Bewertung");
String Anzeigen = request.getParameter("anzeigen");
String eingeben = request.getParameter("eingeben");
String loschen = request.getParameter("loschen");

if (Anzeigen == null) Anzeigen="";
if (eingeben == null) eingeben="";
if (loschen == null) loschen="";

if (Anzeigen.equals("Alle Anzeigen")){
	
	
urlaubBean.setAktuUrlaubsziel(Urlaubziel);
urlaubBean.setAktuBewertung(Bewertung);
urlaubBean.merksDir();



	response.sendRedirect("./UrlaubView2.jsp");
}
else if (eingeben.equals("weiter eingeben")){
	response.sendRedirect("./UrlaubView1.jsp");
}else if(loschen.equals("alle lochen")){
	urlaubBean.loescheAlles();
	response.sendRedirect("./UrlaubView2.jsp");
}else{
	response.sendRedirect("./UrlaubView1.jsp");
}
%>
</body>
</html>