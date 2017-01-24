package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ivirych.qaapplication.model.Question;
import com.ivirych.qaapplication.model.QuestionLike;
import com.ivirych.qaapplication.model.User;

@Repository
public class QuestionLikeDaoImpl implements QuestionLikeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserDao userDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<QuestionLike> getQuestionLikes() {
		return sessionFactory.getCurrentSession().
				createCriteria(QuestionLike.class).list();
	}

	@Override
	public QuestionLike getQuestionLikeByQuestionId(Question question, User user) {
		return (QuestionLike) sessionFactory.getCurrentSession().createCriteria(QuestionLike.class).
				add(Restrictions.eq("question", question)).
				add(Restrictions.eq("user", user)).uniqueResult();
	}

	@Override
	public void addQuestionLike(QuestionLike questionLike) {
		sessionFactory.getCurrentSession().save(questionLike);

	}

	@Override
	public void deleteQuestionLike(Question question, User user) {
		QuestionLike existingQuestionLike = this.getQuestionLikeByQuestionId(question, user);
		sessionFactory.getCurrentSession().delete(existingQuestionLike);
	}

}
