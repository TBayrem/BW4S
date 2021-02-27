package de.hwg_lu.bw4s.beans;

import java.util.HashMap;

public class UrlaubBean {

	String aktuUrlaubsziel;
	String aktuBewertung;
	HashMap<String, String> alleUrlaubsziele; //ist erst mal null
	
	//String alleUrlaubsziele;
	
	public UrlaubBean() {
		this.alleUrlaubsziele = new HashMap<String, String>();
//		this.alleUrlaubsziele = "";
	}
	public void merksDir() {
		this.alleUrlaubsziele.put(this.aktuUrlaubsziel, this.aktuBewertung);
//		this.alleUrlaubsziele += this.aktuUrlaubsziel + ": " + this.aktuBewertung + "\n";
	}
	public void merksDir(String urlaubsziel, String bewertung) {
		this.alleUrlaubsziele.put(urlaubsziel, bewertung);
//		this.alleUrlaubsziele += this.aktuUrlaubsziel + ": " + this.aktuBewertung + "\n";
	}
	public void loescheAlles() {
		this.alleUrlaubsziele.clear();
//		this.alleUrlaubsziele = "";
	}
	public String getAlleUrlaubszieleAlsHtml(){
		String html = "";
//		html += this.alleUrlaubsziele.toString();
		for(String myName : this.alleUrlaubsziele.keySet()){
			String myValue = this.alleUrlaubsziele.get(myName);
			html += myName + ": " + myValue + "\n";
		}
		return html;
//		return this.alleUrlaubsziele;
	}
	
	
	
	
	
	public void setAktuUrlaubsziel(String aktuUrlaubsziel) {
		this.aktuUrlaubsziel = aktuUrlaubsziel;
	}

	public void setAktuBewertung(String aktuBewertung) {
		this.aktuBewertung = aktuBewertung;
	}
	
	
	
	
	

}
