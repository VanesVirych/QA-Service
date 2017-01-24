package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Answer;

public interface AnswerDao {
	public List<Answer> getAnswers(int id);
	public Answer getAnswer(int id);
	//public Number count(Integer id);
	public void add(int id, String username, Answer answer);
	public void edit(int id, Answer answer);
	public void delete(int id);
	public void deleteAll(int id);
}
