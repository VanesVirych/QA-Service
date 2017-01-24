package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.Question;

@Repository
public class AnswerDaoImpl implements AnswerDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDao userDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> getAnswers(int id) {
		return sessionFactory.getCurrentSession().
				createQuery("from Answer where questionid = " + id).list();
	}

	@Override
	public Answer getAnswer(int id) {
		Answer answer = (Answer)sessionFactory.getCurrentSession().get(Answer.class, id);
		return answer;
	}

	@Override
	public void add(int id, String username, Answer answer) {
		Question  existingQuestion = (Question)sessionFactory.getCurrentSession().
				get(Question.class, id);
		answer.setQuestion(existingQuestion);
		answer.setUser(userDao.findUserByName(username));
		sessionFactory.getCurrentSession().save(answer);
	}

	@Override
	public void edit(int id, Answer answer) {
		Session session = sessionFactory.getCurrentSession();
		Question  existingQuestion = (Question)session.get(Question.class, id);
		Answer existingAnswer = (Answer)session.get(Answer.class, answer.getId());
		
		existingAnswer.setQuestion(existingQuestion);
		existingAnswer.setDescription(answer.getDescription());
		
		session.save(existingAnswer);
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Answer answer = (Answer)session.get(Answer.class, id);
		session.delete(answer);
	}

	@Override
	public void deleteAll(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("DELETE FROM Answer WHERE questionid=" + id).executeUpdate();
		
	}

}
