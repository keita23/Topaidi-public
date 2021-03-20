package fr.epsi.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Idea {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String title;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	private String description;
	private String urlImage;
	private LocalDate subscribe;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany
	private List<Vote> votes;
	
	@OneToMany
	private List<Comment>  commentes;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrlImage() {
		return urlImage;
	}
	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}
	public LocalDate getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(LocalDate subscribe) {
		this.subscribe = subscribe;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Vote> getVotes() {
		return votes;
	}
	public void setVotes( List<Vote> votes) {
		this.votes = votes;
	}
	public List<Comment> getCommentes() {
		return commentes;
	}
	public void setCommentes( List<Comment> commentes) {
		this.commentes = commentes;
	}
}
