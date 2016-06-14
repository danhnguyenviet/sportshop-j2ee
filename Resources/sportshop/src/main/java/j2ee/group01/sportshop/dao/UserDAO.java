package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.ProductModel;
import j2ee.group01.sportshop.model.UserModel;

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
	public List<UserModel> getAllUser(){
		String sql = "select u from User u";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		List<User> allUser = (List<User>) criteria.list();
		List<UserModel> result = new ArrayList<UserModel>();
		for (User user : allUser) {
			UserModel item = new UserModel(user);
			result.add(item);
		}
		return result;
	}
	
	public UserModel getUser(String userName){
		 Session session = sessionFactory.getCurrentSession();
	        Criteria crit = session.createCriteria(User.class);
	        crit.add(Restrictions.eq("userName", userName));
	        return (UserModel) crit.uniqueResult();
	}
	
	public void AddUser(User user){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			tx.begin();
			
			session.save(user);
			
			tx.commit();
			
		}catch(RuntimeException e){
			if (tx != null) tx.rollback();
		    throw e; // or display error message
		}
		finally{
			session.close();
		}
	}
	
}
