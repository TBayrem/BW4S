package de.hwg_lu.bw.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AppInstallAccountTable {
	
	Connection dbConn;

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		AppInstallAccountTable myApplication = new AppInstallAccountTable();
		
		myApplication.dbConn = new PostgreSQLAccess().getConnection();
		myApplication.doSomething();
	}
	
//	public void createConnection() throws ClassNotFoundException, SQLException {
//		Class.forName("org.postgresql.Driver");
//									);
//		System.out.println("JDBC-Connection hergestellt");
//	}
	public void doSomething() throws SQLException, ClassNotFoundException{
//		dropAccountTable(dbConn);
		createAccountTable();
//		insertFirstAccount();
//		insertSecondAccountStatisch();
//		insertThirdAccountFromVariables();
//		insertFourthAccountFromVariablesRetro();
//		insertSeveralAccounts();
		showAllAccounts();
		
	}
	public void showAllAccounts() throws SQLException{
		String sql = "select userid, password, active, admin, username, email " +
						"from account";
		System.out.println(sql);
		Statement stmt = this.dbConn.createStatement();
		ResultSet dbRes = stmt.executeQuery(sql);
		
//		dbRes.next(); //auf die erste Zeile, return true (gefunden) oder false (nicht gefunden)
		while(dbRes.next()){
			String myUserid   = dbRes.getString("userid");
			String myPassword = dbRes.getString("password");
			String myActive   = dbRes.getString("active");
			String myAdmin    = dbRes.getString("admin");
			String myUsername = dbRes.getString("username");
			String myEmail    = dbRes.getString("email");
			System.out.println(myUserid + myPassword + myActive + myAdmin + myUsername + myEmail);
		}
		
	}
	public void createAccountTable() throws SQLException{
		String sql = "create table bw440_654321.account                ("
				+ "				userid   CHAR(16) NOT NULL PRIMARY KEY,"
				+ "				password CHAR(32) NOT NULL            ,"
				+ "				active   CHAR(1)  NOT NULL DEFAULT 'Y',"
				+ "				admin    CHAR(1)  NOT NULL DEFAULT 'N',"
				+ "				username VARCHAR(256)                 ,"
				+ "				email    VARCHAR(256)                 )";
		System.out.println(sql);
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
		System.out.println("Tabelle account angelegt");
	}
	public void dropAccountTable(Connection dbConn) throws SQLException{
		String sql = "drop table bw440_654321.account";
		System.out.println(sql);
		Statement stmt = this.dbConn.createStatement();
		try{
			stmt.executeUpdate(sql);
			System.out.println("Tabelle account gedroppt");
		}catch(SQLException se){
			System.out.println("Tabelle account konnte nicht gedroppt werden weil sie nicht da war");
		}
	}
	public void insertFirstAccount() throws SQLException{
		String sql = "insert into bw440_654321.account "
						+ "(userid, password, active, admin, username, email) "
						+ "values"
						+ "(?,?,?,?,?,?)";
		System.out.println(sql);
		//Statement jetzt mit Daten!!! -> PreparedStatement
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, "testus1");
		prep.setString(2, "geheim");
		prep.setString(3, "Y");
		prep.setString(4, "N");
		prep.setString(5, "Testuser 1 wenn alles klappt");
		prep.setString(6, "testus1@abc.de");
		prep.executeUpdate();
		System.out.println("Erster Account angelegt");
	}
	public void insertSecondAccountStatisch() throws SQLException{
		String sql = "insert into bw440_654321.account "
						+ "(userid, password, active, admin, username, email) "
						+ "values"
						+ "('testus2','geheim','Y','N','Testuser 2','testus2@abc.de')";
		System.out.println(sql);
		//Statement jetzt mit Daten!!! -> PreparedStatement
		this.dbConn.createStatement().executeUpdate(sql);
		System.out.println("Zweiter Account angelegt");
	}
	public void insertThirdAccountFromVariables() throws SQLException{
		String userid = "testus3";
		String password = "geheim";
		String active = "Y";
		String admin = "N";
		String username = "Testuser 3";
		String email = "testus3@abc.de";
		
		String sql = "insert into bw440_654321.account "
				+ "(userid, password, active, admin, username, email) "
				+ "values"
				+ "(?,?,?,?,?,?)";
		System.out.println(sql);
		
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, userid);
		prep.setString(2, password);
		prep.setString(3, active);
		prep.setString(4, admin);
		prep.setString(5, username);
		prep.setString(6, email);
		prep.executeUpdate();
		
		System.out.println("Dritter Account angelegt");
	}
	public void insertFourthAccountFromVariablesRetro() throws SQLException{
		String userid = "testus4";
		String password = "geheim";
		String active = "Y";
		String admin = "N";
		String username = "Testuser 4";
		String email = "testus4@abc.de";
		String sql = "insert into bw440_654321.account "
				+ "(userid, password, active, admin, username, email) "
				+ "values "
				+ "('" + userid + "','" + password + "','" + active + "','" + admin + "','" + username + "','" + email + "')"; 
		System.out.println(sql);
		this.dbConn.createStatement().executeUpdate(sql);
		System.out.println("Vierter Account angelegt");
	}
	public void insertSeveralAccounts() throws SQLException{
		String sql = "insert into bw440_654321.account "
				+ "(userid, password, active, admin, username, email) "
				+ "values"
				+ "(?,?,?,?,?,?)";
		System.out.println(sql);

		String userid = "testus";
		String password = "geheim";
		String active = "Y";
		String admin = "N";
		String username = "Testuser ";
		String email = "testusx@abc.de";

		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		for (int myNumber = 5; myNumber <= 10; myNumber++){
			String myNumberString = Integer.toString(myNumber);
			prep.setString(1, userid + myNumberString);
			prep.setString(2, password);
			prep.setString(3, active);
			prep.setString(4, admin);
			prep.setString(5, username + myNumberString);
			prep.setString(6, email.replace("x", myNumberString));
			prep.executeUpdate();
			
			System.out.println("Account testus " + myNumberString + " angelegt");

			
		}
	}

}
