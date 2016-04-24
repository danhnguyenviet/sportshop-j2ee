package com.sportshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.sportshop.dao.DepartmentDAO;
import com.sportshop.entity.Department;
import org.springframework.transaction.annotation.Transactional;
 
@Transactional
public class DepartmentDAOImpl implements DepartmentDAO {
 
  private SessionFactory sessionFactory;
 
  public void setSessionFactory(SessionFactory sessionFactory) {
      this.sessionFactory = sessionFactory;
  }
 
  @SuppressWarnings("unchecked")
  public List<Department> listDepartment() {
      Session session = this.sessionFactory.getCurrentSession();
 
      List<Department> list = session.createQuery("from Department").list();
 
      return list;
  }
 
  public Integer getMaxDeptId() {
      Session session = this.sessionFactory.getCurrentSession();
      String sql = "Select max(d.deptId) from Department d ";
      Query query = session.createQuery(sql);
      Integer maxDeptId = (Integer) query.uniqueResult();
      if (maxDeptId == null) {
          return 0;
      }
      return maxDeptId;
  }
 
  public void createDepartment(String name, String location) {
      Integer deptId = getMaxDeptId() + 1;
      Department dept = new Department();
      dept.setDeptId(deptId);
      dept.setDeptNo("D" + deptId);
      dept.setDeptName(name);
      dept.setLocation(location);
      Session session = this.sessionFactory.getCurrentSession();
      session.persist(dept);
  }
 
}