package net.box.db;

public class BoxPreferenceBean {
	private int id;
	private int musicid;
	private String userid;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
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
