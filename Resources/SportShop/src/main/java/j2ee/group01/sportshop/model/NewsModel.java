package j2ee.group01.sportshop.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import j2ee.group01.sportshop.entity.News;

public class NewsModel {

	private Integer id;
	private String author;
	private String title;
	private String shortDetail;
	private String longDetail;
	private String image;
	private int isActive;
	private String dateCreate;
	private String dateUpdate;
	private int isSavedraft;
	private int views;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShortDetail() {
		return shortDetail;
	}
	public void setShortDetail(String shortDetail) {
		this.shortDetail = shortDetail;
	}
	public String getLongDetail() {
		return longDetail;
	}
	public void setLongDetail(String longDetail) {
		this.longDetail = longDetail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(String dateCreate) {
		this.dateCreate = dateCreate;
	}
	public String getDateUpdate() {
		return dateUpdate;
	}
	public void setDateUpdate(String dateUpdate) {
		this.dateUpdate = dateUpdate;
	}
	public int getIsSavedraft() {
		return isSavedraft;
	}
	public void setIsSavedraft(int isSavedraft) {
		this.isSavedraft = isSavedraft;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}
