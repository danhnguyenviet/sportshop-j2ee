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
import j2ee.group01.sportshop.model.CategoryModel;
import j2ee.group01.sportshop.model.ProductModel;
 
@Controller
// Enable Hibernate Transaction.
// Cần thiết cho Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class FrontendController {
 
	private int itemPerPage = 12;
	private int newestItem = 5;
	private int maxCategorySelect = 20;
	private int recommandProduct = 10;
	
    @Autowired
    private UserDAO userDAO;
    
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private CategoryDAO categoryDAO;
 
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/view/home" }, method = RequestMethod.GET)
    public String home(Model model) {
    	
    	List<ProductModel> mostList = new ArrayList<ProductModel>();
    	mostList = productDAO.getMostPurchaseProduct(10);
    	
    	List<ProductModel> viewsList = new ArrayList<ProductModel>();
    	viewsList = productDAO.getFeaturedProduct(10);
    	
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProduct(10);
    	
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	CategoryModel category1 = new CategoryModel();
    	category1.setId(1);
    	category1.setTitle("Title 01");
    	categoryList.add(category1);
    	 category1 = new CategoryModel();
    	category1.setId(1);
    	category1.setTitle("Title 02");
    	categoryList.add(category1);
    	 category1 = new CategoryModel();
    	category1.setId(1);
    	category1.setTitle("Title 03");
    	categoryList.add(category1);
    	 category1 = new CategoryModel();
    	category1.setId(1);
    	category1.setTitle("Title 04");
    	categoryList.add(category1);
    	
    	model.addAttribute("MiddleBannerImage", "5-1170x124.png");
    	model.addAttribute("LeftBannerImage", "6-279x410.png");
    	model.addAttribute("SlideShowProductList", mostList.subList(0, 5));
    	model.addAttribute("MostPurchaseProductList", mostList);
    	model.addAttribute("FeatureProductList", viewsList);
    	model.addAttribute("NewestProductList", newsestList);
    	model.addAttribute("CategoryList", categoryList);
        return "views/home";
    }
 
    // GET: Show Category Page
    // GET: Hiển thị trang Loại sản phẩm
    @RequestMapping(value = { "/view/category" }, method = RequestMethod.GET)
    public String category(Model model,
    		@RequestParam(value = "id") int categoryId,
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink,
    		@RequestParam(value = "sort", defaultValue="0") int sortMode) {
    	CategoryModel category = categoryDAO.getCategory(categoryId);
    	if(category == null)
    	{
    		// error
    	}
    	
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getProductFromCategory(category.getId(), sortMode, indexPageLink, itemPerPage);
    	
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProductFromCategory(newestItem, categoryId);
    	
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	int countProduct = productDAO.getCountByCategory(categoryId);
    	int countPage = (countProduct/itemPerPage)+1;
    	model.addAttribute("LeftBannerImage", "6-279x410.png");
    	model.addAttribute("CategoryInformation", category);
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("NewsestProductList", newsestList);
    	model.addAttribute("CategoryList", categoryList);
    	model.addAttribute("CountPage", countPage);
    	model.addAttribute("ItemPerPage", itemPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > countPage)?(indexPageLink +1):countPage);
    	model.addAttribute("SortMode", sortMode);
    	model.addAttribute("CurrentPage", indexPageLink);
    	model.addAttribute("CountProduct", countProduct);
        return "views/category";
    }
    
    // GET: Show Product detail Page
    // GET: Hiển thị trang chi tiết sản phẩm
    @RequestMapping(value = { "/view/product" }, method = RequestMethod.GET)
    public String product(Model model,
    		@RequestParam(value = "id") int productId) {
    	ProductModel product = productDAO.getProduct(productId);
    	if(product == null)
    	{
    		// error
    	}
    	
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getNewestProductFromCategory(recommandProduct,product.getIdCategory());
    	
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	model.addAttribute("ProductInformation", product);
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("CategoryList", categoryList);
        return "views/product";
    }


}
