package net.box.db;

import java.util.Date;

public class BoxConcertBean {
	private int id;
	private String place;
	private Date startdate;
	private Date enddate;
	private String showtime;
	private String title;
	private String posterfilepath;
	private String artist;
	private int similarity;
	private float locationx;	
	private float locationy;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPosterfilepath() {
		return posterfilepath;
	}
	public void setPosterfilepath(String posterfilepath) {
		this.posterfilepath = posterfilepath;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public int getSimilarity() {
		return similarity;
	}
	public void setSimilarity(int similarity) {
		this.similarity = similarity;
	}
	public float getLocationx() {
		return locationx;
	}
	public void setLocationx(float locationx) {
		this.locationx = locationx;
	}
	public float getLocationy() {
		return locationy;
	}
	public void setLocationy(float locationy) {
		this.locationy = locationy;
	}
	
	
}
