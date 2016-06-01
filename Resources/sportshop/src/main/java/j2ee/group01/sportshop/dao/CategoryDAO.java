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

import j2ee.group01.sportshop.entity.Category;
import j2ee.group01.sportshop.entity.Product;

//Transactional for Hibernate
@Transactional
public class CategoryDAO {

	@Autowired
    private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Category> getAllCategory(int max){
		
		String sql = "select c from Category c order by c.dateCreate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		return (List<Category>) criteria.list();
	}
	
}
