package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.UserDao;
import com.ivirych.qaapplication.model.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		userDao.editUser(user);
	}

	@Override
	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);

	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	@Transactional
	public User findUser(int id) {
		return userDao.findUser(id);
	}

	@Override
	@Transactional
	public User findUserByName(String username) {
		return userDao.findUserByName(username);
	}

	@Override
	@Transactional
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserByEmail(email);
	}

}
