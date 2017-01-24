package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.User;

public interface UserDao {
	void addUser(User user);
	void editUser(User user);
	void deleteUser(int userId);
	User findUser(int userId);
	User findUserByName(String username);
	User findUserByEmail(String email);
	List<User> getAllUsers();
}
