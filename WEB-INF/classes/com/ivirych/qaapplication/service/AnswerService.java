package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Answer;

public interface AnswerService {
	public List<Answer> getAnswers(Integer id);
	public Answer getAnswer(Integer id);
	//public Number count(Integer id);
	
	public void add(Integer id, String username, Answer answer);
	public void edit(Integer id, Answer answer);
	public void delete(Integer id);
	public void deleteAll(Integer id);
}
