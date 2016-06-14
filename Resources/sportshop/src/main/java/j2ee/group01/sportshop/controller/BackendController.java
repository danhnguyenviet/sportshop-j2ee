package j2ee.group01.sportshop.controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import j2ee.group01.sportshop.entity.RequestContact;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.ProductModel;
import j2ee.group01.sportshop.model.UserModel;
 
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
 
    @RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
    public String home(Model model) {
    	
    	
        return "admin/home";
    }

    @RequestMapping(value = { "/admin/login" }, method = RequestMethod.GET)
    public String login(Model model) {
    	
    	
        return "admin/login";
    }
    
    //GET: get all user
    //GET: Hien thi danh sach user
    @RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
    public String user(Model model, HttpServletRequest request) {
    	
    	List<UserModel> userList = new ArrayList<UserModel>();
    	userList = userDAO.getAllUser();
    	model.addAttribute("UserList",userList);
        return "admin/user";
    }
    //GET: add new user
    //GET: Hien thi trang them moi nguoi dung
    @RequestMapping(value = { "/admin/addnewuser" }, method = RequestMethod.GET)
    public String addnewuser(Model model, HttpServletRequest request) {
    	
        return "admin/addnewuser";
    }
    
    @RequestMapping(value = { "/admin/saveUserRequest" }, method = RequestMethod.POST)
    public String adduser(HttpServletRequest request,HttpServletResponse response, 
    		@RequestParam(value = "username") String username,
    		@RequestParam(value = "password") String password,
    		@RequestParam(value = "fullname") String fullname,
    		@RequestParam(value = "email") String email,
    		@RequestParam(value = "isactive") int isactive
    		)throws Exception
    {
    	try {
    		User user = new User();
        	user.setId(null);
        	user.setUsername(username);
        	user.setPassword(password);
        	user.setFullname(fullname);
        	user.setEmail(email);
        	user.setIdRole(false);
        	user.setIsActive(isactive);
        	
        	userDAO.AddUser(user);
        	response.setStatus(200);
		} catch (Exception e) {
			response.setStatus(403);
		}
        return "admin/home";
    }
}
