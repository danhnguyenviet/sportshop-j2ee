package j2ee.group01.sportshop.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.User;
 
@Controller
// Enable Hibernate Transaction.
// Cần thiết cho Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class BackendController {
 
    @Autowired
    private UserDAO userDAO;
 
    // GET: Show Login Page
    // GET: Hiển thị trang login
    @RequestMapping(value = { "/admin/helloX" }, method = RequestMethod.GET)
    public String hello(Model model) {
    	List<User> result = new  ArrayList<User>();
    	result = userDAO.getAllUser();
    	for (User user : result) {
    		System.out.println(user.getUsername());
		}
    	
    	model.addAttribute("listUser", result);
    	
        return "admins/Sample01";
    }
 
}
