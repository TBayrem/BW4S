package de.hwg_lu.bw4s.beans;

import java.sql.SQLException;

import de.hwg_lu.bw.jdbc.NoConnectionException;

public class TestAccountBean {

	public static void main(String[] args) throws NoConnectionException, SQLException {
		AccountBean myAccountBean = new AccountBean();

		myAccountBean.setUserid("apptestus31234567890abcgdfetrziujfhsgsf");
		myAccountBean.setPassword("geheim");
		myAccountBean.setActive("Y");
		myAccountBean.setAdmin("N");

//try {
		myAccountBean.insertAccountIfNotExists();
//}catch(Exception e) {
//	
//}
		myAccountBean.checkAccountExists3();
		System.out.println(myAccountBean.toString());
		
		
	}

}
