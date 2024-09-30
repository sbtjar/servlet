package com.vit.JavaEE.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vit.JavaEE.model.User;
import com.vit.JavaEE.util.HibernateUtil;

public class UserDAO {

	public User authenticateUser(String email, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		User user = null;
		
		try {
			tx = session.beginTransaction();
			user = (User) session.createQuery("FROM User WHERE email = :email AND password = :password")
					.setParameter("email", email).setParameter("password", password).uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}
}
