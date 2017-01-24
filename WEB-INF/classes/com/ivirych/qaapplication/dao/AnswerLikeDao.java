package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.AnswerLike;
import com.ivirych.qaapplication.model.User;

public interface AnswerLikeDao {
	public List<AnswerLike> getAnswerLikes();
	public AnswerLike getAnswerLikeByAnswerId(Answer answer, User user);
	
	public void addAnswerLike(AnswerLike answerLike);
	public void deleteAnswerLike(Answer answer, User user);
}
