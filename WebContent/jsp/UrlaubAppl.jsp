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

String urlaubsziel = request.getParameter("urlaubsziel");
String bewertung = request.getParameter("bewertung");

String anzeigen = request.getParameter("anzeigen");
String eingeben = request.getParameter("eingeben");
String loeschen = request.getParameter("loeschen");

if (anzeigen == null) anzeigen = "";
if (eingeben == null) eingeben = "";
if (loeschen == null) loeschen = "";

if (anzeigen.equals("alle anzeigen")){
	urlaubBean.setAktuUrlaubsziel(urlaubsziel);
	urlaubBean.setAktuBewertung(bewertung);
	urlaubBean.merksDir();
//	urlaubBean.merksDir(urlaubsziel, bewertung);
	response.sendRedirect("./Urlaub2View.jsp");
}else if(eingeben.equals("weitere eingeben")){
	//nix tun
	response.sendRedirect("./Urlaub1View.jsp");
}else if(loeschen.equals("alle loeschen")){
	urlaubBean.loescheAlles();
	response.sendRedirect("./Urlaub2View.jsp");	
}else{

	response.sendRedirect("./Urlaub1View.jsp");	
}










%>
</body>
</html>