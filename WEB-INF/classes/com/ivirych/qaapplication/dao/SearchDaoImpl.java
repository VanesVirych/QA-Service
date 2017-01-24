package com.ivirych.qaapplication.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ivirych.qaapplication.model.Question;

@Repository
public class SearchDaoImpl implements SearchDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getSearch(String text) {
		return sessionFactory.getCurrentSession().createCriteria(Question.class).
				add(Restrictions.sqlRestriction("MATCH (title, description) AGAINST ('" + text + "' IN BOOLEAN MODE)")).list();
	}
}
