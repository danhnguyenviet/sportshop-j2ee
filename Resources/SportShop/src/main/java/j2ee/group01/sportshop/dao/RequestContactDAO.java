package j2ee.group01.sportshop.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import j2ee.group01.sportshop.entity.RequestContact;

public class RequestContactDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	public void addRequestContact(RequestContact reqContact){
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			tx.begin();
			
			session.save(reqContact);
			
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
