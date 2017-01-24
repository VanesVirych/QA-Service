package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.FavoriteDao;
import com.ivirych.qaapplication.model.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao favoriteDao;
	
	@Override
	@Transactional
	public List<Favorite> getFavorites() {
		return favoriteDao.getFavorites();
	}

	@Override
	@Transactional
	public void addFavorite(Favorite favorite) {
		favoriteDao.addFavorite(favorite);

	}

	@Override
	@Transactional
	public void deleteFavotite(int questionId, String username) {
		favoriteDao.deleteFavotite(questionId, username);

	}

}
