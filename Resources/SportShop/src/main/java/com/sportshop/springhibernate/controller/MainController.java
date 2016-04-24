package com.sportshop.springhibernate.controller;

import java.util.List;

import com.sportshop.dao.DepartmentDAO;
import com.sportshop.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MainController {
 
 @Autowired
 private DepartmentDAO departmentDAO;
 
 @RequestMapping({ "/", "/home", "/index" })
 public String home(Model model) {
     return "index";
 }
 
 @RequestMapping({ "/deptList" })
 public String deptList(Model model) {
     departmentDAO.createDepartment("Dept Name", "Dept Location");
 
     List<Department> list = departmentDAO.listDepartment();
     for (Department dept : list) {
         System.out.println("Dept No " + dept.getDeptNo());
     }
     model.addAttribute("departments", list);
     return "deptList";
 }
}