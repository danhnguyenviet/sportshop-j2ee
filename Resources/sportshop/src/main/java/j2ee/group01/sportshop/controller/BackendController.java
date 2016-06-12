package j2ee.group01.sportshop.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.jni.File;
import org.apache.tomcat.util.http.fileupload.FileItem;
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
import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.CategoryModel;
import j2ee.group01.sportshop.model.ProductModel;
import j2ee.group01.sportshop.model.ShoppingCart;

@Controller
// Enable Hibernate Transaction.
// Cần thiết cho Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class BackendController {
	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "image/product";
	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	boolean uploadFileSuccess = false;

	private int maxNumOfProduct = 500;
	private int maxNumOfCategory = 500;

	@Autowired
	ServletContext context;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		return "admin/home";
	}

	@RequestMapping(value = { "/admin/login" }, method = RequestMethod.GET)
	public String login(Model model) {

		return "admin/login";
	}

	// Getting all product and show to admin GUI and pagination
	@RequestMapping(value = { "/admin/productlist" }, method = RequestMethod.GET)
	public String getProductList(Model model) {
		List<ProductModel> newestProductList = new ArrayList<ProductModel>();
		newestProductList = productDAO.getNewestProduct(maxNumOfProduct);

		// add information to request
		model.addAttribute("newestProductList", newestProductList);

		return "admin/productlist";
	}

	// Show add new product page
	@RequestMapping(value = { "/admin/newproductpage" }, method = RequestMethod.GET)
	public String showNewProductPage(Model model) {
		String pageTitle = "SportShop | Thêm sản phẩm";
		List<CategoryModel> activeCategoryList = new ArrayList<CategoryModel>();
		activeCategoryList = categoryDAO.getAllActiveCategory(maxNumOfCategory);

		// add information to request
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("activeCategoryList", activeCategoryList);

		return "admin/newproductpage";
	}

	// POST: save product information
	@RequestMapping(value = { "/admin/saveproductinfo" }, method = RequestMethod.POST)
	public String checkoutCart(HttpServletRequest request, @RequestParam(value = "title_c") String title_c,
			@RequestParam(value = "alias_c") String alias_c,
			@RequestParam(value = "description_c") String description_c,
			@RequestParam(value = "price_c") Double price_c,
			@RequestParam(value = "pricePromotion_c") Double pricePromotion_c,
			@RequestParam(value = "code_c") String code_c, @RequestParam(value = "quantity_c") Integer quantity_c,
			@RequestParam(value = "images_c") String images_c,
			@RequestParam(value = "idCategory_c") Integer idCategory_c, HttpServletResponse response) throws Exception {
		int idAccount = 2;

		if (title_c == null || alias_c == null || price_c == null || pricePromotion_c == null || code_c == null
				|| quantity_c == null || idCategory_c == null) {
			throw new Exception();
		}

		Product product = new Product();

		product.setId(null); // 122 139
		product.setAlias(alias_c);
		product.setCode(code_c);
		product.setDateCreate(new Date());
		product.setDateUpdate(new Date());
		product.setDescription(description_c);
		product.setIdAccount(idAccount);
		product.setIdCategory(idCategory_c);
		product.setImages(images_c);
		product.setIsActive(1);
		product.setIsSavedraft(0);
		product.setPrice(price_c);
		product.setPricePromotion(pricePromotion_c);
		product.setPurchase(0);
		product.setQuantity(0.0);
		product.setTitle(title_c);
		product.setViews(0);

		productDAO.insertProduct(product);

		return "admin/tempJSP";
	}

	@RequestMapping(value = { "/admin/deleteproduct" }, method = RequestMethod.POST)
	public String deleteProduct(HttpServletRequest request, @RequestParam(value = "productId") int productId)
			throws Exception {
		
		productDAO.deleteProduct(productId);

		return "admin/tempJSP";
	}
}
