package de.hwg_lu.bw4s.beans;

public class MessageBean {
	
	String infoMessage;
	String actionMessage;
	
	public MessageBean() {
		this.setGeneralWelcome();
		//this.setRegistrationWelcome();
	}
	
	public void setNotLoggedIn() {
		this.infoMessage = "Sie sind nicht angemeldet";
		this.actionMessage = "Bitte melden Sie sich an";
	}
	public void setLoggedOff() {
		this.infoMessage = "Sie haben sich abgemeldet";
		this.actionMessage = "Bitte melden Sie sich wieder an";
	}
	public void setLoginFailed() {
		this.infoMessage = "Ihre Nickname/Passwort-Kombination ist falsch";
		this.actionMessage = "Bitte versuchen Sie es noch einmal";
	}
	public void setLoginSuccessful() {
		this.infoMessage = "Willkommen am BW4S-Portal";
		this.actionMessage = "Bitte waehlen Sie eine Anwendung";
	}
	public void setLoginSuccessful(String userid) {
		this.infoMessage = "Willkommen am BW4S-Portal, " + userid;
		this.actionMessage = "Bitte waehlen Sie eine Anwendung";
	}
	public void setGeneralWelcome() {
		this.infoMessage = "Willkommen am BW4S-Portal";
		this.actionMessage = "Bitte melden Sie sich an";
	}
	public void setRegistrationWelcome() {
		this.infoMessage = "Willkommen zur BW4S-Registrierung";
		this.actionMessage = "Bitte registrieren Sie sich";
	}
	public void setUnexpectedError() {
		this.infoMessage = "Es ist ein unerwarteter Fehler aufgetreten";
		this.actionMessage = "Bitte wenden Sie sich an Ihren Administrator";
	}
	public void setAccountInserted() {
		this.infoMessage = "Der Benutzeraccount wurde angelegt";
		this.actionMessage = "Bitte gehen Sie jetzt zur Anmeldung";
	}
	public void setAccountInserted(String userid) {
		this.infoMessage = "Der Benutzeraccount " + userid + " wurde angelegt";
		this.actionMessage = "Bitte gehen Sie jetzt zur Anmeldung";
	}
	public void setAccountAlreadyExists() {
		this.infoMessage = "Dieser Nickname existiert schon";
		this.actionMessage = "Bitte waehlen Sie einen anderen Nickname";
	}
	public void setAccountAlreadyExists(String userid) {
		this.infoMessage = "Der Nickname " + userid + " existiert schon";
		this.actionMessage = "Bitte waehlen Sie einen anderen Nickname";
	}

	
	
	
	
	
	
	public String getMessageHtml() {
		String html = "";
		html += "<h2>" + this.getInfoMessage() + "</h2>\n" ;
		html += "<h4>" + this.getActionMessage() + "</h4>\n" ;
//		<h2><%= messageBean.getInfoMessage() %></h2>
//		<h4><%= messageBean.getActionMessage() %></h4>
		return html;
	}
	
	public String getInfoMessage() {
		return infoMessage;
	}
	public void setInfoMessage(String infoMessage) {
		this.infoMessage = infoMessage;
	}
	public String getActionMessage() {
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}
}
