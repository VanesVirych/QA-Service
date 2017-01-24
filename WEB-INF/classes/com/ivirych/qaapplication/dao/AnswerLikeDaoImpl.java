package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.AnswerLike;
import com.ivirych.qaapplication.model.User;

@Repository
public class AnswerLikeDaoImpl implements AnswerLikeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDao userDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerLike> getAnswerLikes() {
		return sessionFactory.getCurrentSession().
				createCriteria(AnswerLike.class).list();
	}

	@Override
	public AnswerLike getAnswerLikeByAnswerId(Answer answer, User user) {
		return (AnswerLike) sessionFactory.getCurrentSession().createCriteria(AnswerLike.class).
				add(Restrictions.eq("answer", answer)).
				add(Restrictions.eq("user", user)).uniqueResult();
	}


	@Override
	public void addAnswerLike(AnswerLike answerLike) {
		sessionFactory.getCurrentSession().save(answerLike);
	}

	@Override
	public void deleteAnswerLike(Answer answer, User user) {
		AnswerLike existingAnswerLike = this.getAnswerLikeByAnswerId(answer, user);
		sessionFactory.getCurrentSession().delete(existingAnswerLike);
	}

}
