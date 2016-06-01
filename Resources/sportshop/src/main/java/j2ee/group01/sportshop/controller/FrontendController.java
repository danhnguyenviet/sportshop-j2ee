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

import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.Category;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
 
@Controller
// Enable Hibernate Transaction.
// Cần thiết cho Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class FrontendController {
 
    @Autowired
    private UserDAO userDAO;
    
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private CategoryDAO categoryDAO;
 
    // GET: Show Login Page
    // GET: Hiển thị trang login
    @RequestMapping(value = { "/view/home" }, method = RequestMethod.GET)
    public String hello(Model model) {
    	
    	/*List<Product> mostList = new ArrayList<Product>();
    	mostList = productDAO.getMostPurchaseProduct(10);
    	
    	List<Product> viewsList = new ArrayList<Product>();
    	viewsList = productDAO.getFeaturedProduct(10);*/
    	
    	List<Product> newsestList = new ArrayList<Product>();
    	newsestList = productDAO.getNewestProduct(10);
    	
    	/*List<Category> categoryList = new ArrayList<Category>();
    	categoryList = categoryDAO.getAllCategory(10);*/
    	
    	//model.addAttribute("mostList", mostList);
    	//model.addAttribute("viewsList", viewsList);
    	model.addAttribute("newsestList", newsestList);
    	//model.addAttribute("categoryList", categoryList);
        return "views/home";
    }
 
}
