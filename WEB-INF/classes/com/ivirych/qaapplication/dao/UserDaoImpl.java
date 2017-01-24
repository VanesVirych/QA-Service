package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void editUser(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void deleteUser(int userId) {
		sessionFactory.getCurrentSession().delete(findUser(userId));
	}

	@Override
	public User findUser(int userId) {
		return (User) sessionFactory.getCurrentSession().get(User.class, userId);
	}

	@Override
	public User findUserByName(String username) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		return (User) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		return sessionFactory.getCurrentSession().
				createQuery("from users").list();
	}

	@Override
	public User findUserByEmail(String email) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		return (User) criteria.uniqueResult();
	}
}
