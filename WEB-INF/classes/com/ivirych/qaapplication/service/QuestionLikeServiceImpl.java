package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.QuestionLikeDao;
import com.ivirych.qaapplication.model.Question;
import com.ivirych.qaapplication.model.QuestionLike;
import com.ivirych.qaapplication.model.User;

@Service
public class QuestionLikeServiceImpl implements QuestionLikeService {
	@Autowired
	private QuestionLikeDao questionLikeDao;
	
	@Transactional
	public List<QuestionLike> getQuestionLikes() {
		return questionLikeDao.getQuestionLikes();
	}

	@Transactional
	public void addQuestionLike(QuestionLike questionLike) {
		questionLikeDao.addQuestionLike(questionLike);
	}

	@Transactional
	public void deleteQuestionLike(Question question, User user) {
		questionLikeDao.deleteQuestionLike(question, user);
	}

}
