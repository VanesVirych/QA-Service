package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.Favorite;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDao userDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Favorite> getFavorites() {
		return sessionFactory.getCurrentSession().
				createCriteria(Favorite.class).list();
	}
	
	//edit
	@Override
	public Favorite getFavoriteByQuestionId(int id, String username) {
		Favorite favorite = (Favorite) sessionFactory.getCurrentSession().
				createQuery("from Favorite where questionid=" + id + "and userid=" + userDao.findUserByName(username).getId()).uniqueResult();
		return favorite;
	}

	@Override
	public void addFavorite(Favorite favorite) {
		sessionFactory.getCurrentSession().save(favorite);
	}

	@Override
	public void deleteFavotite(int id, String username) {
		Favorite existingFavorite = this.getFavoriteByQuestionId(id, username);
		sessionFactory.getCurrentSession().delete(existingFavorite);
	}

}
