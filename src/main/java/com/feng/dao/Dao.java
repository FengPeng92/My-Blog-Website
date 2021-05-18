package com.feng.dao;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Dao {

    private static final SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    private Session session = null;

    public Dao() {
    }

    public Session getSession() {
        if (session == null || !session.isOpen()) {
            session = sessionFactory.openSession();
        }
        return session;
    }

    public void beginTransaction() {
        getSession().beginTransaction();
    }

    public void commit() {
        getSession().getTransaction().commit();
    }

    public void rollback() {
        getSession().getTransaction().rollback();
    }

    public void close() {
        getSession().close();
    }
}
