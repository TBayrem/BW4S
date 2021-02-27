//alert("hallo extern");
function switchIt(){
//	alert("switchIt() gestartet");
	var myImage = document.images[0];
	var myImageSrc = myImage.src;
	var lastSlashPos = myImageSrc.lastIndexOf('/');
	var myImagePath = myImageSrc.substring(0, lastSlashPos + 1);
	var myImageFile = myImageSrc.substring(lastSlashPos + 1);
	var newImageFile;
	var newClass;
	var isDonald = (myImageSrc.indexOf("Donald") >= 0);
	if (isDonald){
		newImageFile = "MickyMaus.jpg";
		newClass = "mickyLog";
	}else{
		newImageFile = "DonaldDuck.jpg";
		newClass = "donaldLog";
	}
	myImage.src = myImagePath + newImageFile;

	var myLogArea = document.getElementById("mickyLogArea");
	var myTimeString = new Date().toString();
	var newLogString = myTimeString + ": switched from " + myImageFile + " to " + newImageFile;
/*	
	var newLogEntry = "<span class='"+ newClass + "'>" + newLogString + "</span><br>\n";
	
	myLogArea.innerHTML = newLogEntry + myLogArea.innerHTML;
*/

	var newElement = document.createElement("span");
	newElement.setAttribute("class", newClass);
	var newElement1 = document.createElement("br"); 
	
	var newTextNode = document.createTextNode(newLogString);
	newElement.appendChild(newTextNode);

	var referenceElement = myLogArea.firstChild;
//alert("hier lebt mein Script noch");
//alert(referenceElement);
	myLogArea.insertBefore(newElement1, referenceElement);
	myLogArea.insertBefore(newElement, newElement1);
	

//	myLogArea.prepend(newElement1);
//	myLogArea.prepend(newElement);

//	alert("hier lebt mein Script noch");
	
	
	
	
	
		
	
}

function hello(text){
	alert(text);
//	var antwort = confirm("JavaScript ist lustig");
//	var antwort = prompt("Wie heisst Du?", "Donald Duck");
//	alert(antwort);
//	document.write('test');
}