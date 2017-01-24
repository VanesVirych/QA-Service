package com.ivirych.qaapplication.service;

import java.util.List;

import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.AnswerLike;
import com.ivirych.qaapplication.model.User;

public interface AnswerLikeService {
	public List<AnswerLike> getAnswerLikes();
	
	public void addAnswerLike(AnswerLike answerLike);
	public void deleteAnswerLike(Answer answer, User user);
}
