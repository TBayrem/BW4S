package de.hwg_lu.bw4s.beans;

import java.sql.*;

import de.hwg_lu.bw.jdbc.PostgreSQLAccess;

public class LoginBean {

	String userid;
	String password;
	boolean isLoggedIn;
	
	public LoginBean() {
		this.userid = "";
		this.password = "";
		this.isLoggedIn = false;
	}
	
	public boolean checkUseridPassword() throws SQLException {
		// true - userid/password existiert in der account-table
		// false - userid/password ex. nicht
		String sql = "SELECT * from account where userid = ? and password = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.userid);
		prep.setString(2,  this.password);
		ResultSet dbRes = prep.executeQuery();
		boolean gefunden = dbRes.next();
		return gefunden;
	}
	public String getLoginCheckRedirectHtml() {
		String html = "";
		if (!this.isLoggedIn()){
			html += "<meta http-equiv='refresh' content='0; URL=./PortalAppl.jsp' >";
		}
		return html;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isLoggedIn() {
		return isLoggedIn;
	}
	public void setLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}
}
