package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.AnswerDao;
import com.ivirych.qaapplication.model.Answer;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDao answerDao;
	
	@Override
	@Transactional
	public List<Answer> getAnswers(Integer id) {
		return answerDao.getAnswers(id);
	}

	@Override
	@Transactional
	public Answer getAnswer(Integer id) {
		return answerDao.getAnswer(id);
	}

	@Override
	@Transactional
	public void add(Integer id, String username, Answer answer) {
		answerDao.add(id, username, answer);
	}

	@Override
	@Transactional
	public void edit(Integer id, Answer answer) {
		answerDao.edit(id, answer);
	}

	@Override
	@Transactional
	public void delete(Integer id) {
		answerDao.delete(id);
	}

	@Override
	@Transactional
	public void deleteAll(Integer id) {
		answerDao.deleteAll(id);
		
	}

}
