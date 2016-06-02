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

import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.ProductModel;

//Transactional for Hibernate
@Transactional
public class ProductDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	/*
	 * 
	 * */
	
	@SuppressWarnings("unchecked")
	public List<ProductModel> getMostPurchaseProduct(int max){
		
		String sql = "select p from Product p order by p.purchase desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}
	
	public List<ProductModel> getFeaturedProduct(int max){
		String sql = "select p from Product p order by p.views desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}
	
	
	public List<ProductModel> getNewestProduct(int max){
		String sql = "select p from Product p order by p.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}
	
}
