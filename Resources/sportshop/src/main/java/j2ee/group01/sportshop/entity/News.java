package j2ee.group01.sportshop.entity;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * News generated by hbm2java
 */
@Entity
@Table(name = "news", catalog = "sportshop")
public class News implements java.io.Serializable {

	private Integer id;
	private int idUser;
	private String title;
	private String shortDetail;
	private String longDetail;
	private String image;
	private int isActive;
	private Date dateCreate;
	private Date dateUpdate;
	private int isSavedraft;
	private int views;

	public News() {
	}

	public News(int idUser, String title, String shortDetail, String longDetail, String image, int isActive,
			Date dateCreate, Date dateUpdate, int isSavedraft, int views) {
		this.idUser = idUser;
		this.title = title;
		this.shortDetail = shortDetail;
		this.longDetail = longDetail;
		this.image = image;
		this.isActive = isActive;
		this.dateCreate = dateCreate;
		this.dateUpdate = dateUpdate;
		this.isSavedraft = isSavedraft;
		this.views = views;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "id_user", nullable = false)
	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	@Column(name = "title", nullable = false, length = 65535)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "short_detail", nullable = false, length = 65535)
	public String getShortDetail() {
		return this.shortDetail;
	}

	public void setShortDetail(String shortDetail) {
		this.shortDetail = shortDetail;
	}

	@Column(name = "long_detail", nullable = false, length = 65535)
	public String getLongDetail() {
		return this.longDetail;
	}

	public void setLongDetail(String longDetail) {
		this.longDetail = longDetail;
	}

	@Column(name = "image", nullable = false, length = 65535)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "is_active", nullable = false)
	public int getIsActive() {
		return this.isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_create", nullable = false, length = 19)
	public Date getDateCreate() {
		return this.dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_update", nullable = false, length = 19)
	public Date getDateUpdate() {
		return this.dateUpdate;
	}

	public void setDateUpdate(Date dateUpdate) {
		this.dateUpdate = dateUpdate;
	}

	@Column(name = "is_savedraft", nullable = false)
	public int getIsSavedraft() {
		return this.isSavedraft;
	}

	public void setIsSavedraft(int isSavedraft) {
		this.isSavedraft = isSavedraft;
	}

	@Column(name = "views", nullable = false)
	public int getViews() {
		return this.views;
	}

	public void setViews(int views) {
		this.views = views;
	}

}