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

import j2ee.group01.sportshop.entity.Contact;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.ContractModel;
import j2ee.group01.sportshop.model.ProductModel;

//Transactional for Hibernate
@Transactional
public class ContactDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<ContractModel> getAllContact() {

		String sql = "select c from Contact c";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		List<Contact> allContact = (List<Contact>) criteria.list();
		List<ContractModel> result = new ArrayList<ContractModel>();
		for (Contact contact : allContact) {
			ContractModel item = new ContractModel(contact);
			result.add(item);
		}
		return result;
	}
	
	//Get new contact
	public List<ContractModel> getNewContact() {
		String sql = "select c from Contact c where c.date_create = NOW()";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		List<Contact> allContact = (List<Contact>) criteria.list();
		List<ContractModel> result = new ArrayList<ContractModel>();
		for (Contact contact : allContact) {
			ContractModel item = new ContractModel(contact);
			result.add(item);
		}
		return result;
	}
	
	//Get none reply contact
	public List<ContractModel> getContactState(String state) {
		String sql = "select c from Contact c where c.state = :state";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter("state", state);
		List<Contact> allContact = (List<Contact>) criteria.list();
		List<ContractModel> result = new ArrayList<ContractModel>();
		for (Contact contact : allContact) {
			ContractModel item = new ContractModel(contact);
			result.add(item);
		}
		return result;
	}
	
	//Get contact by ID
	public ContractModel getContactById(Integer id) {
		String sql = "select c from Contact c where c.id = :id";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter("id", id);;
		Contact contact = (Contact)criteria.uniqueResult();
		ContractModel contractModel = new ContractModel(contact);
		return contractModel;
	}
	
	// Get contact by ID
	public Contact getContactId(int id){
		 Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("select u from Contact u where id=?")
				 .setParameter(0, id);
	        return (Contact) query.uniqueResult();
	}
	
	//Count contact list
	public Integer countContactList() {
		Integer total;
		total = this.getAllContact().size();
		return total;
	}
	
	//Count Contact State
	public Integer countContactState(String state) {
		Integer total;
		total = this.getContactState(state).size();
		return total;
	}
	
	
//	//Delete contact by id
//	public boolean deleteContact(Integer id) {
//		String sql = "delete c from Contact c where c.id = :id";
//		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter("id", id);
//		
//		if(criteria.executeUpdate() == 1) {
//			return true;
//		} else {
//			return false;
//		}
//	}
	
	public void deleteContact(int id){
	
		
		Contact contact = getContactId(id);
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			tx.begin();
			
			session.delete(contact);
			
			tx.commit();
			
		}catch(RuntimeException e){
			if (tx != null) tx.rollback();
		    throw e; // or display error message
		}
		finally{
			session.close();
		}
	}
	
	//Response contact
	public boolean responseContact(Integer id, String response) {
		String sql = "select c from Contact c where c.id = :id";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter("id", id);
		Contact contact = (Contact)criteria.uniqueResult();
		ContractModel responseContact = new ContractModel(contact);
		
		//Response contact empty
		if(responseContact.getResponse() != null) {
			response += responseContact.getResponse();
		}
		
		String sql1 = "update Contact set response = :response " + " where id = :id";
		Query criteria1 = sessionFactory.getCurrentSession().createQuery(sql1);
		criteria1.setParameter("response", response);
		criteria1.setParameter("id", id);
		Integer result = criteria1.executeUpdate();
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
		
		
	}
	
}