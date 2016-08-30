package net.box.db;

public class BoxPreferenceBean {
	private int id;
	private int musicid;
	private int userid;
	private float rate;
	private int similarity;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMusicid() {
		return musicid;
	}
	public void setMusicid(int musicid) {
		this.musicid = musicid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public int getSimilarity() {
		return similarity;
	}
	public void setSimilarity(int similarity) {
		this.similarity = similarity;
	}
	
	
}
