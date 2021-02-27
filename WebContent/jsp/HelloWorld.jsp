<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello World</title>
</head>
<body>
<!-- Wir lernen HTML, das braucht man auch in JSPs -->
<%-- Wir lernen JSP --%>
<h4>Hier kommen ein paar JSP-Beispiele</h4>
<% String myTestString = "Hello America"; %>
<p>Ich habe einen String definiert</p>
<% out.println(myTestString); %> 
<%= myTestString %>
<p>Erg.: Variable ist noch sichtbar -> die ganze JSP ist in einer Methode</p>
<%
for (int index = 1; index < 11; index++){
%>	
	Achtung, hier kommt die Zahl <%= index %> <br>
<%	
}
%>

<%
int wIndex = 0;
int maxNum = 13;
%>
jetzt kommen gerade und ungerade Zahlen bis <%= maxNum %> <br>
<%
while (wIndex < 11){
	if (wIndex % 2 == 0){
%>
		<%= wIndex %> ist gerade
<%
	}else{
%>
		<%= wIndex %> ist ungerade
<%
	}
%>
	<br>
<%
	wIndex++;
}
%>
<p>wenn Eclipse einen Fehler sieht, wo keiner (mehr) ist:<br>
Ctrl-A: Alles markieren<br>
Ctrl-X: Alles ausschneiden und in der Zwischenablage speichern<br>
Ctrl-V: Alles wieder reinkopieren<br>
Ctrl-S: Speichern
</p>
<p>In besonders hartnäckigen Fällen:<br>
Server deleten und neu anlegen
Anm.: Server immer "unten" löschen, nicht links
Noch besser: Alle Server überall löschen!!!
Anm.: Es werden keine Server gelöscht, sondern nur Server-Konfigurationen
</p>

<h4>Achtung, hier kommen Datumsangaben</h4>
<%= new java.util.Date() %>

<br>
<% //innerhalb der <%... wird Java ausgeführt
Date myDate = new Date(); //Date wird aus java.util importiert
String myDateString = myDate.toString();
//Variable 'out' steht für den Body der Response
//die kriegen wir vom JSP-System geschenkt
out.println("ausführlich: " + myDateString);

%>
<% String[] freunde = {"Hans", "Gaby", "Mehmet", "John"}; %>
<table>
<% for (String freund : freunde){ %>
	<tr><td><%= freund %></td></tr>
<% } %>
</table>



</body>
</html>