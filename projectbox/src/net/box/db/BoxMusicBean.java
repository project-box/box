package net.box.db;

import java.util.Date;

public class BoxMusicBean {
	private int id;
	private int similarity;
	private String genre;
	private String artist;
	private String title;
	private String album;
	private String lyrics;
	private Date publishdate;   // -> Date - String으로 자료형 변경
	private String albumcoverfilepath; // -> coverfilename 이름 변경 예정
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSimilarity() {
		return similarity;
	}
	public void setSimilarity(int similarity) {
		this.similarity = similarity;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public Date getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}
	public String getAlbumcoverfilepath() {
		return albumcoverfilepath;
	}
	public void setAlbumcoverfilepath(String albumcoverfilepath) {
		this.albumcoverfilepath = albumcoverfilepath;
	}
	
}
