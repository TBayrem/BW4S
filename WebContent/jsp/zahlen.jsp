<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/zahlen.css" />
</head>
<body>
<% int maxNum = 17; %>
<table>
	<tr>
		<td><h4>Hier kommen <%= maxNum %> Zahlen in einer Tabelle</h4></td>
		<td><h4>und hier in einer Liste</h4></td>
	</tr>
	<tr>
		<td>
			<table class="innen">
<!-- 			<tr>
					<td class="innen">erst kommt die</td>
					<td class="innen">1</td>
				</tr> -->
<% for(int index = 1; index <= maxNum; index++){ %>
	<tr>
		<td class="innen">
<%			
			if (index == 1){
				out.print("erst");
			}else{
				out.print("dann");
			}
%>			


<% if (index == 1){ %>
erst
<% }else{ %>
dann
<% } %>

<%-- myVar = (Bedingung)?wahrWert:falschWert; --%>	
<% 
String wort = (index == 1)?"erst":"dann";
out.println(wort);
%>
<%= (index == 1)?"erst":"dann" %>


			kommt die</td>
		<td class="innen">
			<%= index %>
			<%-- out.println(index); --%>
		</td>
	</tr>
<% } %>
				<tr><td colspan="2" class="innen">dann ist die Tabelle fertig</td></tr>
			</table>
		</td>
		<td>

<!-- zweites Feld -->

			<ul>

<% for(int index = 1; index <= maxNum; index++){ %>
	<li>
<%			if (index == 1){
				out.print("erst");
			}else{
				out.print("dann");
			}
%>			
		kommt die
			<%= index %>
	</li>
<% } %>
			</ul>

		</td>
	</tr>
</table>
</body>
</html>