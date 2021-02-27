<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Lass uns Eis essen gehen</h2>
<form action="./selectMultiple.jsp" method="get">
<!-- <form action="http://www.roeckle.de" method="post"> -->
Wer geht mit: <input type="text" name="mitesser" value="" /><br><br>
Was essen wir:
<select name="eissorten" multiple>
	<option>Spaghettieis</option>	
	<option value="kb">Krokantbecher</option>	
	<option>Karamelbecher</option>	
	<option>Walnussbecher</option>	
</select><br><br>
<input type="submit" name="bestellen" value="bestellen" />
</form>
<% //JSP-Scriptlet
out.println("<hr>");
String mitesser = request.getParameter("mitesser");
String bestellen = request.getParameter("bestellen");
String[] eissorten = request.getParameterValues("eissorten");
//null-check
if (bestellen == null) bestellen = "";
if (eissorten == null) eissorten = new String[0];

out.println("mitesser: " + mitesser + "<br>");
out.println("bestellen: " + bestellen + "<br>");

for(int index = 0; index < eissorten.length; index++){
	String myValue = eissorten[index];
	out.println("eissorte: " + myValue + "<br>");
}
//for(String myValue : eissorten){
//	String myValue = eissorten[index];
//	out.println("eissorte: " + myValue + "<br>");
//}
//for(String eissorte : eissorten){	
//	out.println("eissorte: " + eissorte + "<br>");
//}
out.println("<hr>");
Enumeration<String> myParamNames = request.getParameterNames();
while (myParamNames.hasMoreElements()){
	String myParamName = myParamNames.nextElement();
//	out.println("paramName: " + myParamName + "<br>");
	String[] myParamValues = request.getParameterValues(myParamName);
	if (myParamValues == null) myParamValues = new String[0];
	for(String myParamValue : myParamValues){
		out.println("paramName: " + myParamName + ", paramValue: " + myParamValue + "<br>");
	}
}
out.println("<hr>");
Enumeration<String> myHeaderNames = request.getHeaderNames();
while(myHeaderNames.hasMoreElements()){
	String myHeaderName = myHeaderNames.nextElement();
	Enumeration<String> myHeaderValues = request.getHeaders(myHeaderName);
	while(myHeaderValues.hasMoreElements()){
		String myHeaderValue = myHeaderValues.nextElement();
		out.println(myHeaderName + ": " + myHeaderValue + "<br>");
	}
}


%>

</body>
</html>