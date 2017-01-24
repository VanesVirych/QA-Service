package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Question;

public interface SearchDao {
	public List<Question> getSearch(String text);
}
