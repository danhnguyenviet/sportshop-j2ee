package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import j2ee.group01.sportshop.entity.User;

//Transactional for Hibernate
@Transactional
public class UserDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	
	public String getUserName(int id){
		 Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("select u.username from User u where id=?")
				 .setParameter(0, id);
	        return (String)query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<User> getAllUser(){
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		return (List<User>) criteria.list();
	}
	
	public User getUser(String userName){
		 Session session = sessionFactory.getCurrentSession();
	        Criteria crit = session.createCriteria(User.class);
	        crit.add(Restrictions.eq("userName", userName));
	        return (User) crit.uniqueResult();
	}
	
	public void AddUser(String userName){
		 Session session = sessionFactory.getCurrentSession();
		 User us = new User();
		 us.setEmail("aaa");
		 us.setFullname("tao");
		 us.setId(null);
		 us.setIdRole(true);
		 us.setIsActive(0);
		 us.setPassword("aaa");
		 us.setUsername(userName);
		 
		 long id = ((Integer)(session.save(us))).intValue();
		 System.out.println("---------" + id);
	}
	
}
