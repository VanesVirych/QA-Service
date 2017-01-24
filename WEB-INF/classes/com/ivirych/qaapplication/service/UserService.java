package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.User;

public interface UserService {
	public void addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public List<User> getAllUsers();
	public User findUser(int id);
	public User findUserByName(String username);
	public User findUserByEmail(String email);
	
}
