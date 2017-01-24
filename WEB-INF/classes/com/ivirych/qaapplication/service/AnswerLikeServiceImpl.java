package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.AnswerLikeDao;
import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.AnswerLike;
import com.ivirych.qaapplication.model.User;
@Service
public class AnswerLikeServiceImpl implements AnswerLikeService {
	@Autowired
	private AnswerLikeDao answerLikeDao;
	
	@Override
	@Transactional
	public List<AnswerLike> getAnswerLikes() {
		return answerLikeDao.getAnswerLikes();
	}

	@Override
	@Transactional
	public void addAnswerLike(AnswerLike answerLike) {
		answerLikeDao.addAnswerLike(answerLike);
	}

	@Override
	@Transactional
	public void deleteAnswerLike(Answer answer, User user) {
		answerLikeDao.deleteAnswerLike(answer, user);
	}

}
