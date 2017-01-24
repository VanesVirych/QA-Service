package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ivirych.qaapplication.dao.SearchDao;
import com.ivirych.qaapplication.model.Question;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	
	public List<Question> searchQuestion(String text) {
		return searchDao.getSearch(text);
	}

}
