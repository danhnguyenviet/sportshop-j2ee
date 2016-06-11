package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
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
import j2ee.group01.sportshop.model.CategoryModel;

//Transactional for Hibernate
@Transactional
public class CategoryDAO {

	@Autowired
    private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<CategoryModel> getAllCategory(int max){
		String sql = "select c from Category c order by c.dateCreate desc, c.title desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Category> allCategory = (List<Category>)criteria.list();
		List<CategoryModel> result = new ArrayList<CategoryModel>();
		for (Category category : allCategory) {
			result.add(new CategoryModel(category));
		}
		return result;
	}
	
	public CategoryModel getCategoryDefault(){
		String sql = "select c from Category c order by c.dateCreate desc, c.title desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(1);
		return (new CategoryModel((Category)criteria.uniqueResult()));
	}
	
	public CategoryModel getCategory(int id){
		String sql = "select c from Category c where c.id = :id";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter("id", id);
		return (new CategoryModel((Category) criteria.uniqueResult()));
	}
	
}
