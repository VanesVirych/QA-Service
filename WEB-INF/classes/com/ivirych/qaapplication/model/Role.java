package com.ivirych.qaapplication.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="roles")
public class Role {
	@Id
	@Column
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column
	private String name;
	
	@ManyToMany(mappedBy="roles")
	private List<User> users;
	
	public Role() {}
	
	public Role(int id) {
		super();
		this.id = id;
	}

	public Role(int id, String name, List<User> users) {
		super();
		this.id = id;
		this.name = name;
		this.users = users;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
}
