package com.vit.JavaEE.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vit.JavaEE.model.Product;
import com.vit.JavaEE.util.HibernateUtil;

import java.util.List;

public class ProductDAO {

	public List<Product> listProducts() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Product> productList = session.createQuery("FROM Product", Product.class).list();
		session.close();
		return productList;
	}

	public void addProduct(Product product) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(product);
			transaction.commit();
		} catch (Exception ex) {
			transaction.rollback();
		} finally {
			if (session != null)
				session.close();
		}

	}

	public Product getProduct(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Product product = session.get(Product.class, id);
		session.close();
		return product;
	}

	public void updateProduct(Product product) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.update(product);
		try {
			transaction.commit();
		} catch (Exception ex) {
			transaction.rollback();
		} finally {
			session.close();
		}

	}

	public void deleteProduct(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Product product = session.get(Product.class, id);
		try {
			if (product != null) {
				session.delete(product);
			}
			transaction.commit();
		} catch (Exception ex) {
			transaction.rollback();
		} finally {
			if (session != null)
				session.close();
		}
	}
}
