package com.ivirych.qaapplication.dao;

import java.util.List;

import com.ivirych.qaapplication.model.Question;
import com.ivirych.qaapplication.model.QuestionLike;
import com.ivirych.qaapplication.model.User;

public interface QuestionLikeDao {
	public List<QuestionLike> getQuestionLikes();
	public QuestionLike getQuestionLikeByQuestionId(Question question, User user);
	
	public void addQuestionLike(QuestionLike questionLike);
	public void deleteQuestionLike(Question question, User user);
}
