package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDao userDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getQuestions() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Question.class);
		criteria.addOrder(Order.desc("created_at"));
		return criteria.list();
	}
	@Override
	public List<Question> getQuestionsByVotes() {
		return null;
	}

	@Override
	public Question getQuestion(Integer id) {
		Question question = (Question)sessionFactory.getCurrentSession().
				get(Question.class, id);
		return question;
	}

	@Override
	public void add(String username, Question question) {
		question.setUser(userDao.findUserByName(username));
		sessionFactory.getCurrentSession().save(question);
	}

	@Override
	public void update(Question question) {
		Session session = sessionFactory.getCurrentSession();
		Question existingQuestion = (Question) session.get(Question.class, question.getId());
		existingQuestion.setTitle(question.getTitle());
		existingQuestion.setDescription(question.getDescription());
		existingQuestion.setUpdated_at(question.getUpdated_at());
		session.update(existingQuestion);
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Question existingQuestion = (Question) session.get(Question.class, id);
		session.delete(existingQuestion);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getQuestions(int limit) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Question.class);
		criteria.addOrder(Order.desc("created_at"));
		return criteria.setFirstResult(0).setMaxResults(limit).list();
	}
}
