package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

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
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.Cart;
import j2ee.group01.sportshop.model.ShoppingCart;

//Transactional for Hibernate
@Transactional
public class OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void insertOder(Order insertItem, List<Cart> listCart) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			int id = ((Integer) (session.save(insertItem))).intValue();

			for (Cart cart : listCart) {
				OrderDetail detail = new OrderDetail();
				detail.setId(null);
				detail.setIdOrder(id);
				detail.setIdProduct(cart.getProduct().getId());
				detail.setPrice(cart.getProduct().getPrice());
				detail.setPricePromotion(null);
				detail.setQuantity(cart.getQuantity());
				detail.setTotal(detail.getPrice() * detail.getQuantity());
				session.save(detail);
			}
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e; // or display error message
		} finally {
			session.close();
		}
	}
}
