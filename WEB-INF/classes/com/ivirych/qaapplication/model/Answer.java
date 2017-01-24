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
@Table(name="answers")
public class Answer {
	@Id
    @Column
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column
	private String description;
	@Column
	private Date created_at;
	@Column
	private Date updated_at;
	
	
	@ManyToOne
	@JoinColumn(name="questionid")
	private Question question;//mapped
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
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
	
	@OneToMany(targetEntity=AnswerLike.class, mappedBy="answer", 
			cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<AnswerLike> answerLikes;
	public List<AnswerLike> getAnswerLikes() {
		return answerLikes;
	}
	public void setAnswerLikes(List<AnswerLike> answerLikes) {
		this.answerLikes = answerLikes;
	}
	
	public Answer(){}
	
	public Answer(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
