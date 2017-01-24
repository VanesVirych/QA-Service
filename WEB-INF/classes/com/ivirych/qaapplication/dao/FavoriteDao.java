package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Favorite;

public interface FavoriteDao {
	public List<Favorite> getFavorites();
	public Favorite getFavoriteByQuestionId(int id, String username);
	
	public void addFavorite(Favorite favorite);
	public void deleteFavotite(int id, String username);
}
