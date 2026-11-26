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
				System.getenv().getOrDefault("DB_URL", "jdbc:postgresql://localhost:5432/postgres"),
				System.getenv().getOrDefault("DB_USER", "postgres"),
				 System.getenv().getOrDefault("DB_PASSWORD", ""));
											
		System.out.println("Datenbankverbindung erfolgreich angelegt");
		String sql = "create table public.account                ("
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
