package de.hwg_lu.bw4s.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

//import de.hwg_lu.bw.jdbc.NoConnectionException;
import de.hwg_lu.bw.jdbc.PostgreSQLAccess;

public class ShowAllAccountsBean {
	
	Vector<Account> allAccounts; //ist jetzt erst mal null -> im Konstr. initialisieren

	public ShowAllAccountsBean() throws SQLException {
		super();
		this.allAccounts = new Vector<Account>();
		this.readAllAccountsFromDB();
	}
	
	public void readAllAccountsFromDB() throws SQLException {
		this.allAccounts.clear();
		String sql = "SELECT userid, password,  active, admin, username, email "
				+ "from account";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while(dbRes.next()) {
			Account newAccount = new Account(
										dbRes.getString("userid"),
										dbRes.getString("password"),
										dbRes.getString("active"),
										dbRes.getString("admin"),
										dbRes.getString("username"),
										dbRes.getString("email")
									);
			this.allAccounts.add(newAccount);
		}
	}
	
	public void deleteAllAccountsFromDB() throws SQLException {
		String sql = "DELETE from account";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		dbConn.createStatement().executeUpdate(sql);
		System.out.println("alle Accounts gelöscht");
		this.readAllAccountsFromDB();
	}
	
	
	public boolean deleteAccountFromDB(String userid) throws SQLException {
		String sql = "delete * from account where userid = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, userid);
		ResultSet dbRes = prep.executeQuery();
		boolean geloescht = dbRes.next();

		return geloescht;
	}

	public String getAccountsAsHtml() {
		String html = "";
		html += "<table>\n";
		html += "<tr>\n";
		html += "<th>userid</th>\n";
		html += "<th>password</th>\n";
		html += "<th>active</th>\n";
		html += "<th>admin</th>\n";
		html += "<th>username</th>\n";
		html += "<th>email</th>\n";
		html += "</tr>\n";
		//durchlaufe Vector!!
		for(Account myAccount : this.allAccounts) {
			html += "<tr>\n";
			html += "<td>" + myAccount.getUserid() + "</td>\n";
			html += "<td>" + myAccount.getPassword() + "</td>\n";
			html += "<td>" + myAccount.getActive() + "</td>\n";
			html += "<td>" + myAccount.getAdmin() + "</td>\n";
			html += "<td>" + myAccount.getUsername() + "</td>\n";
			html += "<td>" + myAccount.getEmail() + "</td>\n";
		///	html += "<td><a href='./ShowAllAccountsAppl.jsp?show=ShowAllAccountsView.jsp'></td>\n";
			html += "</tr>\n";
		}
		html += "</table>\n";
		return html;
		
//Alternativen zur for each Schleife:		
//		for (int index = 0; index < this.allAccounts.size(); index++) {
//			Account myAccount = this.allAccounts.get(index);
//			
//		}
//		Iterator<Account> iter = this.allAccounts.iterator();
//		while(iter.hasNext()) {
//			Account myAccount = iter.next();
//			
//		}
	}
}




/*
	Legen Sie eine zusätzliche Klasse Account an, 
	die dieselben Attribute besitzt wie die Account-Tabelle, 
	die aber selbst keine Bean sein muss.
	
	Legen Sie in Ihrer Bean einen Vector an, der nur Account-Objekte enthalten kann.
	
	Initialisieren Sie den Vector im Konstruktor Ihrer Bean.
	
	Entwickeln Sie in Ihrer Bean eine Methode public void readAllAccountsFromDB(),
	 in der Sie per SQL-SELECT alle Account-Einträge lesen
	  und diese anschließend in Ihren Vector eintragen. 
	  Evtl. ist es sinnvoll, den Vector vorher zu leeren.
	  
	Entwickeln Sie in Ihrer Bean eine Methode public String getAccountsAsHtml(),
	 in der Sie den Vector auslesen und daraus html erzeugen.
*/