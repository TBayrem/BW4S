package de.hwg_lu.bw4s.beans;

public class GUIBean {

	public GUIBean() {
		
	}
	
	public String getHeadlineHtml(){
		String html = "";
		html += "	<table>\n";
		html += "		<tr>\n";
		html += "			<td>\n";
		html += "				<h3>BW4S-Portal</h3>\n";
		html += "			</td>\n";
		html += "			<td>\n";
		html += "				<img src='../img/HWGLU_logo.png' width='300' \n";
		html += "					alt='Hier sollte das Logo der HWG Lu stehen' \n";
		html += "					title='Logo der HWG Lu' \n";
		html += "				/>\n";
		html += "			</td>\n";
		html += "		</tr>\n";
		html += "	</table>\n";	
		System.out.println(html);
		return html;
	}

}
