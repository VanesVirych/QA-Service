package com.ivirych.qaapplication.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="answers_likes")
public class AnswerLike {
	@Id
    @Column
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="answerid")
	private Answer answer;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	
	public AnswerLike() {
	}

	public AnswerLike(int id, Answer answer, User user) {
		super();
		this.id = id;
		this.answer = answer;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
