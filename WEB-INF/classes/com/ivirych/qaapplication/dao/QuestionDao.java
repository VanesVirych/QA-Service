package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Question;

public interface QuestionDao {
	public List<Question> getQuestions();
	public List<Question> getQuestionsByVotes();
	public List<Question> getQuestions(int limit);
	public Question getQuestion(Integer id);
	
	public void add(String username, Question question);
	public void update(Question question);//
	public void delete(int id);
}
