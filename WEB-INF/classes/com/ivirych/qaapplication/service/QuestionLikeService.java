package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Question;
import com.ivirych.qaapplication.model.QuestionLike;
import com.ivirych.qaapplication.model.User;

public interface QuestionLikeService {
	public List<QuestionLike> getQuestionLikes();
		
	public void addQuestionLike(QuestionLike questionLike);
	public void deleteQuestionLike(Question question, User user);
}
