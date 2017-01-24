package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Question;

public interface SearchService {
	public List<Question> searchQuestion(String text);
}
