function checkUserInput(myForm){
	var myUserid = myForm.userid.value;
	var myPassword = myForm.password.value;
	var myUsername = myForm.username.value;
	var myEmail = myForm.email.value;
	
	var myUseridMsg = this.checkUserid(myUserid);
	var myUseridOk  = !(myUseridMsg);
//	if (myUseridMsg) myUseridOk = false; else myUseridOk = true;
//	myUseridOk  = (myUseridMsg)?false:true;

	var myPasswordMsg = this.checkPassword(myPassword);
	var myPasswordOk  = !(myPasswordMsg);
	
	var myUsernameMsg = this.checkUsername(myUsername);
	var myUsernameOk  = !(myUsernameMsg);
	
	var myEmailMsg = this.checkEmail(myEmail);
	var myEmailOk  = !(myEmailMsg);

	return myUseridOk && myPasswordOk && myUsernameOk && myEmailOk;
}
function checkUserid(myUserid){
	var msg = "";
	if (myUserid) msg = ""; else msg = "Die Userid darf nicht leer sein";
	var msgField = document.getElementById("useridMsgField");
	msgField.textContent = msg;
//alt:	msgField.innerHTML = msg;
//kurz:	document.getElementById("useridMsgField").textContent = msg;
	return msg;
}
function checkPassword(myPassword){
	var msg = "";
	if (myPassword){
		if (myPassword.length < 6) msg = "Das Passwort muss mindestens 6 Zeichen lang sein";
	}else{
		msg = "Das Passwort darf nicht leer sein";
	}
	document.getElementById("passwordMsgField").textContent = msg;
	return msg;
}
function checkUsername(myUsername){
	var msg = "";
	if (myUsername) msg = ""; else msg = "Der Username darf nicht leer sein";
	document.getElementById("usernameMsgField").textContent = msg;
	return msg;
}
function checkEmail(myEmail){
	var msg = "";
	if (myEmail) msg = ""; else msg = "Die Email darf nicht leer sein";
	document.getElementById("emailMsgField").textContent = msg;
	return msg;
}
