package j2ee.group01.sportshop.model;

import java.util.Date;

import j2ee.group01.sportshop.entity.Category;

public class CategoryModel {
	private Integer id;
	private String title;
	private String description;
	private Integer idParent;
	private int isActive;
	private Date dateCreate;
	private String slug;
	private String image;
	public CategoryModel(){
		
	}
	public CategoryModel(Category category){
		this.id = category.getId();
		this.dateCreate = category.getDateCreate();
		this.description = category.getDescription();
		this.idParent = category.getIdParent();
		this.isActive = category.getIsActive();
		this.slug = category.getSlug();
		this.title = category.getTitle();
		this.image = category.getImage();
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getIdParent() {
		return idParent;
	}
	public void setIdParent(Integer idParent) {
		this.idParent = idParent;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
