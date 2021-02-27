<%@page import="de.hwg_lu.bw4s.beans.LoginBean"%>
<%@page import="de.hwg_lu.bw4s.beans.MessageBean"%>
<%@page import="de.hwg_lu.bw4s.beans.GUIBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BW4S-Portal - Anmeldeseite</title>
</head>
<body>
<jsp:useBean id="guiBean" class="de.hwg_lu.bw4s.beans.GUIBean" scope="session" />
<jsp:useBean id="messageBean" class="de.hwg_lu.bw4s.beans.MessageBean" scope="session" />
<jsp:useBean id="loginBean"   class="de.hwg_lu.bw4s.beans.LoginBean"   scope="session" />
<jsp:getProperty name="guiBean" property="headlineHtml" />
<jsp:getProperty name="messageBean" property="messageHtml" />

<form action="./LoginAppl.jsp" method="get" >
<table>
	<tr>
		<td>Nickname:</td>
		<td><input type="text" name="userid" value="<jsp:getProperty name="loginBean" property="userid" />" 
					placeholder="Hier Nickname eingeben"
					maxlength="20"
					required
			/>
		</td>
	</tr>
	<tr>
		<td>Passwort</td>
		<td><input type="password" name="password" value="" /></td>
	</tr>
	<tr>
		<td></td>
		<td>
<!-- 		<input type="submit" name="zurReg" value="zurReg" />  wird als Link simuliert -->
			<input type="submit" name="login" value="Anmelden" />
		</td>
	</tr>
</table>
</form>
Noch nicht registriert? Klicken Sie
<a href="./LoginAppl.jsp?zurReg=zurReg">hier</a>.
</body>
</html>