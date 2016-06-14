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

import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.OrderDetail;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.Cart;
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
	public List<ProductModel> getMostPurchaseProduct(int max) {

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

	public List<ProductModel> getFeaturedProduct(int max) {
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

	public List<ProductModel> getNewestProduct(int max) {
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
	
	public List<ProductModel> getSlideshowProduct(int max) {
		String sql = "select p from Product p order by p.id asc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public List<ProductModel> getNewestProductFromCategory(int max, int categoryId) {
		String sql = "select p from Product p where p.idCategory=? order by p.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, categoryId)
				.setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public List<ProductModel> getProductFromCategory(int categoryId, int sortMode, int indexPage, int itemPerPage) {

		String sql = "select p from Product p where p.idCategory=?";

		switch (sortMode) {
		case 1:
			sql += " order by p.title asc";
			break;
		case 2:
			sql += " order by p.title desc";
			break;
		case 3:
			sql += " order by p.price asc";
			break;
		case 4:
			sql += " order by p.price desc";
			break;
		case 5:
			sql += " order by p.purchase asc";
			break;
		case 6:
			sql += " order by p.purchase desc";
			break;
		default:
			break;
		}

		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, categoryId);
		criteria.setFirstResult((indexPage - 1) * itemPerPage).setMaxResults(itemPerPage);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public int getCountByCategory(int categoryId) {
		String sql = "select count(p.id) from Product p where p.idCategory=?";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, categoryId);
		return ((Long) criteria.uniqueResult()).intValue();
	}

	public ProductModel getProduct(int id) {
		String sql = "select p from Product p where p.id=?";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, id);
		return (new ProductModel((Product) criteria.uniqueResult()));
	}

	public List<ProductModel> getSaleProduct(int max) {
		String sql = "select p from Product p where p.pricePromotion is not null order by p.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(max);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public int getCountBySearch(String keyword) {
		keyword = "%" + keyword + "%";
		String sql = "select count(p.id) from Product p where (p.title like ?) or (p.description like ?) or (p.alias like ?)";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, keyword)
				.setParameter(1, keyword).setParameter(2, keyword);
		return ((Long) criteria.uniqueResult()).intValue();
	}

	public List<ProductModel> getSearchProduct(String keyword, int sortMode, int indexPage, int itemPerPage) {

		keyword = "%" + keyword + "%";
		String sql = "select p from Product p where (p.title like ?) or (p.description like ?) or (p.alias like ?)";

		switch (sortMode) {
		case 1:
			sql += " order by p.title asc";
			break;
		case 2:
			sql += " order by p.title desc";
			break;
		case 3:
			sql += " order by p.price asc";
			break;
		case 4:
			sql += " order by p.price desc";
			break;
		case 5:
			sql += " order by p.purchase asc";
			break;
		case 6:
			sql += " order by p.purchase desc";
			break;
		default:
			break;
		}

		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, keyword)
				.setParameter(1, keyword).setParameter(2, keyword);
		criteria.setFirstResult((indexPage - 1) * itemPerPage).setMaxResults(itemPerPage);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public int getCountBySale() {
		String sql = "select count(p.id) from Product p where (p.pricePromotion is not null ) and (p.pricePromotion < p.price)";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(1);
		return ((Long) criteria.uniqueResult()).intValue();
	}

	public List<ProductModel> getSaleListProduct(int sortMode, int indexPage, int itemPerPage) {

		String sql = "select p from Product p where (p.pricePromotion is not null ) and (p.pricePromotion < p.price)";

		switch (sortMode) {
		case 1:
			sql += " order by p.title asc";
			break;
		case 2:
			sql += " order by p.title desc";
			break;
		case 3:
			sql += " order by p.price asc";
			break;
		case 4:
			sql += " order by p.price desc";
			break;
		case 5:
			sql += " order by p.purchase asc";
			break;
		case 6:
			sql += " order by p.purchase desc";
			break;
		default:
			break;
		}

		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setFirstResult((indexPage - 1) * itemPerPage).setMaxResults(itemPerPage);
		List<Product> allProduct = (List<Product>) criteria.list();
		List<ProductModel> result = new ArrayList<ProductModel>();
		for (Product product : allProduct) {
			ProductModel item = new ProductModel(product);
			result.add(item);
		}
		return result;
	}

	public int insertProduct(Product product) {
		int id = -1;
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			id = ((Integer)(session.save(product))).intValue();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e; // or display error message
		} finally {
			session.close();
		}
		return id;
	}
	
	public boolean saveUpdateImage(int id, String img){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
		    tx = session.beginTransaction();
		    Product news = (Product)session.createQuery("select n from Product n where n.id=?")
		    		.setParameter(0, id).uniqueResult();
		    news.setImages(img);
		    session.save(news);
		    tx.commit();
		}
		catch (RuntimeException e) {
		    if (tx != null) tx.rollback();
		    return false;
		}
		finally {
			session.close();
		}
		return true;
	}

	public void deleteProduct(int id) {
		String sql = "delete from Product p where p.id= ?";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setParameter(0, id);
		criteria.executeUpdate();
	}

	public void updateProduct(Product product) {
		String hql = "update Product set alias = :alias," + "code = :code," + "dateCreate = :dateCreate,"
				+ "dateUpdate = :dateUpdate," + "description = :description," + "idAccount = :idAccount,"
				+ "idCategory = :idCategory," + "images = :images," + "isActive = :isActive,"
				+ "isSavedraft = :isSavedraft," + "price = :price," + "pricePromotion = :pricePromotion,"
				+ "purchase = :purchase," + "quantity = :quantity," + "title = :title," + "views = :views"
				+ " where id = :id";
		Query criteria = sessionFactory.getCurrentSession().createQuery(hql);
		criteria.setParameter("alias", product.getAlias());
		criteria.setParameter("code", product.getCode());
		criteria.setParameter("dateCreate", product.getDateCreate());
		criteria.setParameter("dateUpdate", product.getDateUpdate());
		criteria.setParameter("description", product.getDescription());
		criteria.setParameter("idAccount", product.getIdAccount());
		criteria.setParameter("idCategory", product.getIdCategory());
		criteria.setParameter("images", product.getImages());
		criteria.setParameter("isActive", product.getIsActive());
		criteria.setParameter("isSavedraft", product.getIsSavedraft());
		criteria.setParameter("price", product.getPrice());
		criteria.setParameter("pricePromotion", product.getPricePromotion());
		criteria.setParameter("purchase", product.getPurchase());
		criteria.setParameter("quantity", product.getQuantity());
		criteria.setParameter("title", product.getTitle());
		criteria.setParameter("views", product.getViews());
		criteria.setParameter("id", product.getId());
		int result = criteria.executeUpdate();
		
		System.out.println("Rows affected: " + result);
	}
}
