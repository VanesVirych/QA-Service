package com.ivirych.qaapplication.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ivirych.qaapplication.dao.QuestionDao;
import com.ivirych.qaapplication.model.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	@Override
	@Transactional
	public List<Question> getQuestions() {
		return questionDao.getQuestions();
	}
	
	@Override
	@Transactional
	public Question getQuestion(Integer id) {
		return questionDao.getQuestion(id);
	}

	@Override
	@Transactional
	public void add(String username, Question question) {
		questionDao.add(username, question);

	}

	@Override
	@Transactional
	public void edit(Question question) {
		questionDao.update(question);
	}

	@Override
	@Transactional
	public void delete(Integer id) {
		questionDao.delete(id);

	}

	@Override
	@Transactional
	public List<Question> getQuestions(Integer limit) {
		return questionDao.getQuestions(limit);
	}

	@Override
	@Transactional
	public List<Question> getQuestionsByVotes() {
		return questionDao.getQuestionsByVotes();
	}

}
