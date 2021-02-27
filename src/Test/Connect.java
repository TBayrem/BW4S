package Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Connect {
	static Connection dbConn;
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("org.postgresql.Driver");
		System.out.println("JDBC-Treiber erfolgreich geladen");
		dbConn = DriverManager.getConnection(
				"jdbc:postgresql://143.93.200.243:5432/BWUEBDB",
				"user1",
				 "pgusers");
											
		System.out.println("Datenbankverbindung erfolgreich angelegt");
		String sql = "create table bw440_632996.accountbayrem                ("
				+ "				userid   CHAR(16) NOT NULL PRIMARY KEY,"
				+ "				password CHAR(32) NOT NULL            ,"
				+ "				active   CHAR(1)  NOT NULL DEFAULT 'Y',"
				+ "				admin    CHAR(1)  NOT NULL DEFAULT 'N',"
				+ "				username VARCHAR(256)                 ,"
				+ "				email    VARCHAR(256)                 )";
		
		
		Statement stmt = dbConn.createStatement();
		stmt.executeUpdate(sql);
		System.out.println("Tabelle account angelegt");
	}
	

}
