package fr.epita.quiz.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map.Entry;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import fr.epita.quiz.datamodel.Question;
import fr.epita.quiz.datamodel.Users;

/**
 * 
 * @author Vaaruni
 *
 * @param <T>
 */
public abstract class GenericORMDao<T> {

	@Inject
	SessionFactory sf;

	public final void create(T entity) {
		if (!beforeCreate(entity)) {
			return;
		}

		final Session session = sf.openSession();
		final Transaction tran = session.beginTransaction();
		session.saveOrUpdate(entity);
		tran.commit();
		session.close();
	}

	protected boolean beforeCreate(T entity) {
		return entity != null;
	}

	public final void delete(T entity) {
		final Session session = sf.openSession();
		final Transaction tran = session.beginTransaction();
		session.delete(entity);
		tran.commit();
		session.close();
	}



	public final List<T> getQuizTitle(T entity) {
		final Session session = sf.openSession();
		final WhereClauseBuilder<T> wcb = getWhereClauseBuilder(entity);
		final Query getTypeQuery = session.createQuery(wcb.getQueryString()).setProperties(wcb.getParameters());
		for (final Entry<String, Object> parameterEntry : wcb.getParameters().entrySet()) {
			getTypeQuery.setParameter(parameterEntry.getKey(), parameterEntry.getValue());
		}

		return getTypeQuery.list();
	}

	public final List<Question> getQuestions(Question entity) {
		final Session session = sf.openSession();
		String hql = "from Question q where q.quizTitle = :quizTitle";
		Query<Question> query = session.createQuery(hql);
		query.setParameter("quizTitle", entity.getQuizTitle());
		List<Question> result = query.getResultList();
		return result;
	}

	public Collection<T> searchAll(T entity) {
		List<T> list = new ArrayList<>();
		final Session session = sf.openSession();
		list = (List<T>) session.createQuery("from Question", Question.class).list();
		return list;
	}

	public Collection<T> searchUsers(T entity) {
		final Session session = sf.openSession();
		return (List<T>) session.createQuery("from Users", Users.class).list();
	}

	public Users getUsersById(int id) {
		final Session session = sf.openSession();
		return session.get(Users.class, id);
	}

	public Question getById(int id) {
		final Session session = sf.openSession();
		return session.get(Question.class, id);
	}

	public final List<T> search(T entity) {
		final Session session = sf.openSession();
		final WhereClauseBuilder<T> wcb = getWhereClauseBuilder(entity);
		final Query searchQuery = session.createQuery(wcb.getQueryString());
		for (final Entry<String, Object> parameterEntry : wcb.getParameters().entrySet()) {
			searchQuery.setParameter(parameterEntry.getKey(), parameterEntry.getValue());
		}

		return searchQuery.list();
	}

	protected abstract WhereClauseBuilder getWhereClauseBuilder(T entity);

	// Old conception
	// protected abstract String getSearchQuery(T entity);
	//
	// protected abstract void completeQuery(T entity, Query toBeCompleted);

}
