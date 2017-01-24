package com.ivirych.qaapplication.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User implements Serializable{
	private static final long serialVersionUID = 3946150536565686522L;
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(unique=true)
	private String username;
	@Column(unique=true)
	private String email;
	@Column
	private String password;
	@Column
	private Date created_at;

	@ManyToMany
	@JoinTable(name="users_roles",
			joinColumns=@JoinColumn(name="userid"),
			inverseJoinColumns=@JoinColumn(name="roleid"))
	private List<Role> roles;
	
	@OneToMany(targetEntity=Question.class, mappedBy="user", 
	cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Question> questions;
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
	
	@OneToMany(targetEntity=Answer.class, mappedBy="user", 
	cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Answer> answers;
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	///cascade
	@OneToMany(targetEntity=Favorite.class, mappedBy="user", 
	fetch=FetchType.LAZY)
	private List<Favorite> favorites;
		public List<Favorite> getFavorites() {
		return favorites;
	}
	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	
	@OneToMany(targetEntity=AnswerLike.class, mappedBy="user", 
			fetch=FetchType.LAZY)
	private List<AnswerLike> answerLikes;
	public List<AnswerLike> getAnswerLikes() {
		return answerLikes;
	}
	public void setAnswerLikes(List<AnswerLike> answerLikes) {
		this.answerLikes = answerLikes;
	}
	
	//cascade
	@OneToMany(targetEntity=QuestionLike.class, mappedBy="user", 
			fetch=FetchType.LAZY)
	private List<QuestionLike> questionLikes;
	public List<QuestionLike> getQuestionLikes() {
		return questionLikes;
	}
	public void seQuestionLikes(List<QuestionLike> questionLikes) {
		this.questionLikes = questionLikes;
	}


	@Column
	@Enumerated(EnumType.STRING)
	private UserStatus status;
	
	public User() {}
	
	public User(int id, String username, String password, List<Role> roles,
			UserStatus status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.roles = roles;
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public UserStatus getStatus() {
		return status;
	}
	public void setStatus(UserStatus status) {
		this.status = status;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
