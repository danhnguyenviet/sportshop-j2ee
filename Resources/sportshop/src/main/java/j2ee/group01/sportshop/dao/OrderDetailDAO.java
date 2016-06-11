package j2ee.group01.sportshop.dao;
// Generated Jun 1, 2016 9:27:59 AM by Hibernate Tools 4.3.1.Final

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

//Transactional for Hibernate
@Transactional
public class OrderDetailDAO {
	@Autowired
    private SessionFactory sessionFactory;
}
