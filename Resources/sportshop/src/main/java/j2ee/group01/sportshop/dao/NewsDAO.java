package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.hql.internal.classic.SelectParser;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import j2ee.group01.sportshop.entity.News;
import j2ee.group01.sportshop.entity.OrderDetail;
import j2ee.group01.sportshop.model.Cart;
import j2ee.group01.sportshop.model.NewsModel;

//Transactional for Hibernate
@Transactional
public class NewsDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	public List<News> getNewsForPage(int indexPage, int itemPerPage){
		String sql = "select n from News n order by n.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setFirstResult((indexPage-1)*itemPerPage).setMaxResults(itemPerPage);
		List<News> allNews = (List<News>) criteria.list();
		return allNews;
	}
	
	public List<News> getNewsForPageMostView(int max){
		String sql = "select n from News n order by n.views desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setMaxResults(max);
		List<News> allNews = (List<News>) criteria.list();
		return allNews;
	}
	
	public News getNewsFromId(int id){
		String sql = "select n from News n where n.id=?";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setParameter(0, id);
		return (News)criteria.uniqueResult();
	}
	
	public News getNewsDefault(){
		String sql = "select n from News n order by n.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(1);
		return (News)criteria.uniqueResult();
	}
	
	public int getNewsIdBefore(News currentNews){
		String sql = "select n from News n where n.id < ? and n.id !=? order by n.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setParameter(0, currentNews.getId()).setParameter(1, currentNews.getId()).setMaxResults(1);
		return (((News)criteria.uniqueResult()) != null)?((News)criteria.uniqueResult()).getId():-1;
	}
	
	public int getNewsIdAfter(News currentNews){
		String sql = "select n from News n where n.id > ? and n.id !=? order by n.dateUpdate asc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		criteria.setParameter(0, currentNews.getId()).setParameter(1, currentNews.getId()).setMaxResults(1);
		return (((News)criteria.uniqueResult()) != null)?((News)criteria.uniqueResult()).getId():-1;
	}
	
	public int getCountNews(){
		String sql = "select count(n.id) from News n order by n.views desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		return ((Long)criteria.uniqueResult()).intValue();
	}
	
	public List<News> getAllNews(){
		String sql = "select n from News n order by n.dateUpdate desc";
		Query criteria = sessionFactory.getCurrentSession().createQuery(sql);
		List<News> allNewsrs = (List<News>)criteria.list();
		return allNewsrs;
	}
	
	public int insertNews(News insertItem){
		insertItem.setId(null);
		Session session = sessionFactory.openSession();
		int id = -1;
		Transaction tx = null;
		try {
		    tx = session.beginTransaction();
		    id = ((Integer)(session.save(insertItem))).intValue();
		    tx.commit();
		}
		catch (RuntimeException e) {
		    if (tx != null) tx.rollback();
		    throw e; // or display error message
		}
		finally {
			session.close();
		}
		return id;
	}
	
	public boolean saveUpdateImage(int id, String img){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
		    tx = session.beginTransaction();
		    News news = (News)session.createQuery("select n from News n where n.id=?")
		    		.setParameter(0, id).uniqueResult();
		    news.setImage(img);
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
	
	public boolean updateNews(News itemUpdate){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
		    tx = session.beginTransaction();
		    String sql = "update News set title=?, shortDetail=?, longDetail=? where id=?";
		    Query query = session.createQuery(sql)
		    		.setParameter(0, itemUpdate.getTitle())
		    		.setParameter(1, itemUpdate.getShortDetail())
		    		.setParameter(2, itemUpdate.getLongDetail())
		    		.setParameter(3, itemUpdate.getId());
		    query.executeUpdate();
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
	
	public boolean deleteNews(int newsId){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
		    tx = session.beginTransaction();
		    String sql = "delete News where id=?";
		    Query query = session.createQuery(sql)
		    		.setParameter(0, newsId);
		    query.executeUpdate();
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
	
}
