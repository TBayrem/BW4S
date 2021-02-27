package de.hwg_lu.bw4s.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import de.hwg_lu.bw.jdbc.NoConnectionException;
import de.hwg_lu.bw.jdbc.PostgreSQLAccess;

public class AccountBean {
	String userid;
	String password;
	String active;
	String admin;
	String username;
	String email;
			
	public AccountBean(){//Default-Konstruktor: Keine Parameter
		this.userid   = "";
		this.password = "";
		this.active   = "";
		this.admin    = "";
		this.username = "";
		this.email    = "";
	}

	public boolean insertAccountIfNotExists()throws NoConnectionException, SQLException{
		// true - insert hat geklappt
		// false - Account ex. schon
		// Exception - irgendwas Unvorhergesehenes
		this.prepareAttributesForDB();
		if(this.checkAccountExists()) {
//			System.out.println("Account " + this.userid + " existiert schon");
			return false;
		}else {
			this.insertAccountNoCheck();
//			System.out.println("Account " + this.userid + " wurde angelegt");
			return true;
		}
	}

	public void insertAccountNoCheck() throws NoConnectionException, SQLException{
		String sql = "insert into account (userid, password, active, admin, username, email) values (?,?,?,?,?,?)";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.userid);
		prep.setString(2, this.password);
		prep.setString(3, this.active);
		prep.setString(4, this.admin);
		prep.setString(5, this.username);
		prep.setString(6, this.email);
		prep.executeUpdate();
		System.out.println("Account " + this.userid + " wurde erfolgreich angelegt");
	}
	
	public void prepareAttributesForDB(){
		if (userid.length() > 16) userid = userid.substring(0,16);
		if (password.length() > 32) password = password.substring(0,32);
		if (username.length() > 256) username = username.substring(0,256);
		if (email.length() > 256) email = email.substring(0,256);
		if (active.equalsIgnoreCase("Y")
				|| active.equalsIgnoreCase("YES")
				|| active.equalsIgnoreCase("J")
				|| active.equalsIgnoreCase("JA")) active = "Y";
		else active = "N";
		if (admin.equalsIgnoreCase("Y")
				|| admin.equalsIgnoreCase("YES")
				|| admin.equalsIgnoreCase("J")
				|| admin.equalsIgnoreCase("JA")) admin = "Y";
		else admin = "N";
	}
	
	public boolean checkAccountExists() throws NoConnectionException, SQLException{
		//prüft, ob der Account mit this.userid schon in der Tabelle account existiert
		//return true - existiert schon
		//return false - existiert noch nicht
		String sql = "select * from account where userid = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1,  this.userid);
		ResultSet dbRes = prep.executeQuery();
		// zwei Möglichkeiten:
		// userid ex in Tab -> 1 Datensatz in ResultSet
		// userid ex nicht in Tab -> 0 Datensätze im ResultSet
		boolean gefunden = dbRes.next();
		System.out.println("Account " + this.userid + " existiert: " + gefunden);
		return gefunden;
	}
	public boolean checkAccountExists2() throws NoConnectionException, SQLException{
		//prüft, ob der Account mit this.userid schon in der Tabelle account existiert
		//return true - existiert schon
		//return false - existiert noch nicht
		String sql = "select count(*) from account where userid = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1,  this.userid);
		ResultSet dbRes = prep.executeQuery();
		// zwei Möglichkeiten:
		// gefunden: count(*) = 1
		// nicht gefunden: count(*) = 0
		dbRes.next(); // zeige auf den einzigen Datensatz; hier kommt immer true raus
		int anzahl = dbRes.getInt(1);
		boolean gefunden;
		if (anzahl == 1) gefunden = true;
		else gefunden = false;
		System.out.println("Account " + this.userid + " existiert: " + gefunden);
		return gefunden;
	}
	public boolean checkAccountExists3() throws NoConnectionException, SQLException{
		//prüft, ob der Account mit this.userid schon in der Tabelle account existiert
		//return true - existiert schon
		//return false - existiert noch nicht
		String sql = "select * from account";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		Statement stmt = dbConn.createStatement();
		ResultSet dbRes = stmt.executeQuery(sql);
		// ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		boolean gefunden = false;
		while (dbRes.next()) {
			String aktuUserid = dbRes.getString("userid");
//			System.out.println(this.userid);
//			System.out.println(dbRes.getString("userid"));
			if (aktuUserid.trim().equals(this.userid.trim())) {
				gefunden = true;
			}
		}
// this.userid = "apptestus2"
// dbRes.getString("userid") = "apptestus2      "
		System.out.println("Account " + this.userid + " existiert: " + gefunden);
		return gefunden;
	}
	
	public String toString(){
		String s = this.getClass().getSimpleName() + " mit ";
				s+= "userid: "   + this.getUserid() + ", ";
				s+= "password: " + this.getPassword() + ", ";
				s+= "active: "   + this.getActive() + ", ";
				s+= "admin: "    + this.getAdmin() + ", ";
				s+= "username: " + this.getUsername() + ", ";
				s+= "email: "    + this.getEmail();				
		return s;
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
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
}
