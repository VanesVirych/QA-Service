package com.ivirych.qaapplication.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="questions")
public class Question {
	@Id
    @Column
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column
	private String title;
	@Column
	private String description;
	@Column
	private Date created_at;
	@Column
	private Date updated_at;
		
	@OneToMany(targetEntity=Answer.class, mappedBy="question", 
		cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Answer> answers;
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@OneToMany(targetEntity=Favorite.class, mappedBy="question", 
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Favorite> favorites;
	public List<Favorite> getFavorites() {
		return favorites;
	}
	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	
	@OneToMany(targetEntity=QuestionLike.class, mappedBy="question", 
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<QuestionLike> questionLikes;
	public List<QuestionLike> getQuestionLikes() {
		return questionLikes;
	}
	public void setQuestionLikes(List<QuestionLike> questionLikes) {
		this.questionLikes = questionLikes;
	}
	
	public Question() {}
	
	public Question(int id, String title, String description) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
}
