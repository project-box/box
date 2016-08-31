package net.box.db;

import java.sql.Date;

public class ConBoardBean {

	private int id;
	private int concertid;
	private String userid;
	private String content;
	private Date registerdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getConcertid() {
		return concertid;
	}
	public void setConcertid(int concertid) {
		this.concertid = concertid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}
	
	
	
}
