package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Question;

public interface QuestionService {
	public List<Question> getQuestions();
	public List<Question> getQuestionsByVotes();
	public List<Question> getQuestions(Integer limit);
	public Question getQuestion(Integer id);
	
	public void add(String username, Question question);
	public void edit(Question question);//
	public void delete(Integer id);
}
