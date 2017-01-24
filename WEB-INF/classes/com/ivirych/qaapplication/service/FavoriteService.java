package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Favorite;

public interface FavoriteService {
	public List<Favorite> getFavorites();
	
	public void addFavorite(Favorite favorite);
	public void deleteFavotite(int questionId, String username);
}
