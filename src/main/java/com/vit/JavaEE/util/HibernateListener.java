package com.vit.JavaEE.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vit.JavaEE.model.User;

@WebListener
public class HibernateListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		HibernateUtil.getSessionFactory();
		this.initilizeUsers();
		System.out.println("Hibernate initialized.");
	}

	private void initilizeUsers() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		User adminUser = new User("admin@email.com", "Alex Dougalas", "ADMIN", "1234");
		User clientUser = new User("client@email.com", "Brian Lary", "CLIENT", "abcd");

		try {
			session.save(adminUser);
			session.save(clientUser);
			transaction.commit();
		} catch (Exception ex) {
			System.out.println("Hibernate eissue.");
			transaction.rollback();
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		HibernateUtil.shutdown();
		System.out.println("Hibernate shut down.");
	}
}
