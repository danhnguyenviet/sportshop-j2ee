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

import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.OrderDetail;
import j2ee.group01.sportshop.model.OrderDetailModel;
import j2ee.group01.sportshop.model.OrderModel;

//Transactional for Hibernate
@Transactional
public class OrderDetailDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<OrderDetailModel> getOrderDetailList(int id) {
		String sql = "select p from OrderDetail p where p.idOrder=:id";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(500);
		criteria.setParameter("id", id);
		
		List<OrderDetail> allOrder = (List<OrderDetail>) criteria.list();
		List<OrderDetailModel> result = new ArrayList<OrderDetailModel>();
		for (OrderDetail order : allOrder) {
			OrderDetailModel item = new OrderDetailModel(order);
			result.add(item);
		}
		return result;
	}
}
