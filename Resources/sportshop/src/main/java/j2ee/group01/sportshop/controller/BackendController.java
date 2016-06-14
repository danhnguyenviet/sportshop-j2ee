package j2ee.group01.sportshop.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.HttpStatus;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import j2ee.group01.sportshop.dao.NewsDAO;
import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.RequestContact;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.ProductModel;
import j2ee.group01.sportshop.model.UserModel;
import j2ee.group01.sportshop.entity.News;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.NewsModel;
import j2ee.group01.sportshop.model.OrderDetailModel;
import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.OrderDAO;
import j2ee.group01.sportshop.dao.OrderDetailDAO;
import j2ee.group01.sportshop.dao.ContactDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.model.CategoryModel;
import j2ee.group01.sportshop.model.OrderModel;
import j2ee.group01.sportshop.model.ContractModel;
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
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	@Autowired
    private NewsDAO newsDAO;
	@Autowired
	private ContactDAO contactDAO;

	private int itemPerPage = 12;
	private int newestItem = 5;
	private int maxCategorySelect = 20;
	private int recommandProduct = 10;
	private int newsPerPage = 3;
	private int mostViewNews = 8;
 
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
	public String saveProductInfo(Model model, HttpServletRequest request,
			@RequestParam(value = "title") String title_c, @RequestParam(value = "alias") String alias_c,
			@RequestParam(value = "description") String description_c,
			@RequestParam(value = "price") Double price_c,
			@RequestParam(value = "pricePromotion") Double pricePromotion_c,
			@RequestParam(value = "code") String code_c, @RequestParam(value = "quantity") Integer quantity_c,
			@RequestParam(value = "images") MultipartFile images_c,
			@RequestParam(value = "idCategory") Integer idCategory_c, HttpServletResponse response) throws Exception {
		int idAccount = 2;

		if (title_c == null || alias_c == null || price_c == null || pricePromotion_c == null || code_c == null
				|| quantity_c == null || idCategory_c == null) {
			throw new Exception();
		}
		try {
			Product product = new Product();

			product.setId(null); // 122 139
			product.setAlias(alias_c);
			product.setCode(code_c);
			product.setDateCreate(new Date());
			product.setDateUpdate(new Date());
			product.setDescription(description_c);
			product.setIdAccount(idAccount);
			product.setIdCategory(idCategory_c);
			product.setImages("");
			product.setIsActive(1);
			product.setIsSavedraft(0);
			product.setPrice(price_c);
			product.setPricePromotion(pricePromotion_c);
			product.setPurchase(0);
			product.setQuantity(0.0);
			product.setTitle(title_c);
			product.setViews(0);

			int productId = productDAO.insertProduct(product);

			// upload image and udpate to database
			String fileName = productId + ".png";
			String rootPath = request.getServletContext().getRealPath("");
			String savePath = "image/product";
			String fileNameRs = uploadImage(fileName, savePath, rootPath, images_c);

			// update image to db
			if (!productDAO.saveUpdateImage(productId, fileNameRs)) {
				response.setStatus(403);
				model.addAttribute("msg", "Thất bại. Đã xảy ra lỗi trong quá trình upload ảnh.");
				model.addAttribute("error", "error");
			} else {
				model.addAttribute("msg", "Thành công. Đã thêm sản phẩm xuống hệ thống!");
			}
		} catch (Exception e) {
			model.addAttribute("msg", "Thất bại! Đã xảy ra lỗi trong quá trình upload ảnh.");
			model.addAttribute("error", "error");
		}

		return "redirect:/admin/productlist";
	}

	@RequestMapping(value = { "/admin/deleteproduct" }, method = RequestMethod.POST)
	public String deleteProduct(HttpServletRequest request, @RequestParam(value = "productId") int productId)
			throws Exception {

		productDAO.deleteProduct(productId);

		return "admin/tempJSP";
	}

	@RequestMapping(value = { "/admin/editproduct" }, method = RequestMethod.GET)
	public String getProduct(Model model, HttpServletRequest request, @RequestParam(value = "id") int productId)
			throws Exception {
		List<CategoryModel> activeCategoryList = new ArrayList<CategoryModel>();
		activeCategoryList = categoryDAO.getAllActiveCategory(maxNumOfCategory);
		ProductModel productModel = productDAO.getProduct(productId);

		// add information to request
		model.addAttribute("activeCategoryList", activeCategoryList);
		model.addAttribute("productModel", productModel);

		return "admin/editproductpage";
	}

	// POST: save product information
	@RequestMapping(value = { "/admin/updateproductinfo" }, method = RequestMethod.POST)
	public String updateProductInfo(Model model, HttpServletRequest request,
			@RequestParam(value = "title") String title_c,
			@RequestParam(value = "id") Integer id_c, @RequestParam(value = "dateCreate") String dateCreate_c,
			@RequestParam(value = "alias") String alias_c,
			@RequestParam(value = "description") String description_c,
			@RequestParam(value = "price") Double price_c,
			@RequestParam(value = "pricePromotion") Double pricePromotion_c,
			@RequestParam(value = "code") String code_c, @RequestParam(value = "quantity") Double quantity_c,
			@RequestParam(value = "images") MultipartFile images_c,
			@RequestParam(value = "idCategory") Integer idCategory_c, HttpServletResponse response) throws Exception {
		int idAccount = 2;

		if (id_c == null || title_c == null || alias_c == null || price_c == null || pricePromotion_c == null
				|| code_c == null || quantity_c == null || idCategory_c == null) {
			throw new Exception();
		}
		
		try {
			Product product = new Product();

			product.setId(null); // 122 139
			product.setAlias(alias_c);
			product.setCode(code_c);
			product.setDateCreate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateCreate_c));
			product.setDateUpdate(new Date());
			product.setDescription(description_c);
			product.setIdAccount(idAccount);
			product.setIdCategory(idCategory_c);
			product.setImages("");
			product.setIsActive(1);
			product.setIsSavedraft(0);
			product.setPrice(price_c);
			product.setPricePromotion(pricePromotion_c);
			product.setPurchase(0);
			product.setQuantity(0.0);
			product.setTitle(title_c);
			product.setViews(0);

			productDAO.updateProduct(product);

			// upload image and udpate to database
			String fileName = id_c + ".png";
			String rootPath = request.getServletContext().getRealPath("");
			String savePath = "image/product";
			String fileNameRs = uploadImage(fileName, savePath, rootPath, images_c);

			// update image to db
			if (!productDAO.saveUpdateImage(id_c, fileNameRs)) {
				response.setStatus(403);
				model.addAttribute("msg", "Thất bại. Đã xảy ra lỗi trong quá trình upload ảnh.");
				model.addAttribute("error", "error");
			} else {
				model.addAttribute("msg", "Thành công. Đã thêm sản phẩm xuống hệ thống!");
			}
		} catch (Exception e) {
			model.addAttribute("msg", "Thất bại! Đã xảy ra lỗi trong quá trình upload ảnh.");
			model.addAttribute("error", "error");
		}

		return "redirect:/admin/productlist";

	}

	@RequestMapping(value = { "/admin/orderlist" }, method = RequestMethod.GET)
	public String getOrderList(Model model) {
		List<OrderModel> orderList = new ArrayList<OrderModel>();
		orderList = orderDAO.getOrderList(maxNumOfProduct);
		List<OrderModel> shippedOrderList = new ArrayList<OrderModel>();
		shippedOrderList = orderDAO.getShippedOrderList(maxNumOfProduct);

		// add information to request
		model.addAttribute("orderList", orderList);
		model.addAttribute("shippedOrderList", shippedOrderList);

		return "admin/orderlist";
	}

    @RequestMapping(value = { "/admin/news" }, method = RequestMethod.GET)
    public String news(Model model) {
    	
    	// load body content
    	// get list news newest update
    	List<NewsModel> newsListResult = new ArrayList<NewsModel>();
    	List<News> newsList= new ArrayList<News>();
    	newsList = newsDAO.getAllNews();
    	for (News news : newsList) {
			NewsModel item = new NewsModel();
			item.setAuthor(userDAO.getUserName(news.getIdUser()));
			item.setDateCreate((new SimpleDateFormat("dd/MM/yyyy")).format(news.getDateCreate()));
			item.setDateUpdate((new SimpleDateFormat("dd/MM/yyyy")).format(news.getDateUpdate()));
			item.setId(news.getId());
			item.setImage(news.getImage());
			item.setIsActive(news.getIsActive());
			item.setIsSavedraft(news.getIsSavedraft());
			item.setLongDetail(news.getLongDetail());
			item.setShortDetail(news.getShortDetail());
			item.setTitle(news.getTitle());
			item.setViews(news.getViews());
			newsListResult.add(item);
		}
    	
    	model.addAttribute("NewsListResult", newsListResult);
    	
        return "admin/news_list";
    }
    
    @RequestMapping(value = { "/admin/addNews" }, method = RequestMethod.GET)
    public String addNews(Model model) {
    	
        return "admin/add_news";
    }
    
    @RequestMapping(value = { "/admin/doAddNews" }, method = RequestMethod.POST)
    //@ResponseStatus(value = HttpStatus.OK)
    public String doAddNews(Model model,HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam(value = "title", defaultValue="") String title,
    		@RequestParam(value = "shortContent", defaultValue="") String shortContent,
    		@RequestParam(value = "longContent", defaultValue="") String longContent,
			@RequestParam(value = "file") MultipartFile file) throws IOException {
    	try {
    		// get current user id
        	int userId = 1;//((User)(request.getAttribute("loginUser"))).getId();
        	// create news item for insert
        	News insertItem = new News();
        	insertItem.setId(null);
        	Date currentDate = new Date();
        	insertItem.setDateCreate(currentDate);
        	insertItem.setDateUpdate(currentDate);
        	insertItem.setIdUser(userId);
        	insertItem.setImage("");
        	insertItem.setIsActive(1);
        	insertItem.setIsSavedraft(0);
        	insertItem.setLongDetail(longContent);
        	insertItem.setShortDetail(shortContent);
        	insertItem.setTitle(title);
        	insertItem.setViews(0);
        	int newsId = newsDAO.insertNews(insertItem);
        	
        	// upload image and udpate to database
        	String fileName = newsId+".png";
        	String rootPath = request.getServletContext().getRealPath("");
        	String savePath = "image/news";
        	String fileNameRs = uploadImage(fileName, savePath, rootPath, file);
        	
        	// update image to db
        	if(!newsDAO.saveUpdateImage(newsId, fileNameRs)){
        		response.setStatus(403);
        		model.addAttribute("msg", "Thất bại. Đã xảy ra lỗi trong quá trình upload ảnh.");
        		model.addAttribute("error", "error");
        	}else{
        		model.addAttribute("msg", "Thành công. Đã thêm bài viết xuống hệ thống!");
        	}
        	
		} catch (Exception e) {
			model.addAttribute("msg", "Thất bại! Đã xảy ra lỗi trong quá trình upload ảnh.");
    		model.addAttribute("error", "error");
		}
    	
    	return "admin/only_message_result";
    }

    private String uploadImage(String fileName, String savePath, 
    		String rootPath, MultipartFile file)throws IOException{
    	String fileNamers = "";
    	if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				
				File dir = new File(rootPath + File.separator + savePath);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				fileNamers = fileName;
				stream.close();
			} catch (Exception e) {
				return "";
			}
		} else {
			return "";
		}
		return fileNamers;

	}

	@RequestMapping(value = { "/admin/orderdetaillist" }, method = RequestMethod.GET)
	public String showOrderDetailList(Model model, HttpServletRequest request,
    		@RequestParam(value = "id") int id) throws Exception {
		List<OrderDetailModel> orderDetailModel = new ArrayList<OrderDetailModel>();
		orderDetailModel = orderDetailDAO.getOrderDetailList(id);

		// add information to request
		model.addAttribute("orderDetailList", orderDetailModel);

		return "admin/orderdetaillist";
	}
	
	@RequestMapping(value = { "/admin/confirmorder" }, method = RequestMethod.POST)
	public String confirmOrder(Model model, HttpServletRequest request,
			@RequestParam(value = "id") int id, HttpServletResponse response) throws Exception {
		
		orderDAO.updateOrder(id, new Date());
		
		return "admin/tempJSP";
	}
	
	
	// Getting all contact and show to admin GUI and pagination
	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
	public String getContact(Model model) {
		List<ContractModel> ContactList = new ArrayList<ContractModel>();
			
		ContactList = contactDAO.getAllContact();
		// add information to request
		model.addAttribute("ContactList", ContactList);
		
		
		List<Integer> countContact = new ArrayList<Integer>();
		
		countContact.add(contactDAO.countContactList());
		countContact.add(contactDAO.countContactState("new"));
		countContact.add(contactDAO.countContactState("nonereply"));
		countContact.add(contactDAO.countContactState("deleted"));
		countContact.add(contactDAO.countContactState("reply"));
		
		model.addAttribute("countContact", countContact);
		
		

		return "admin/contact";
	}
	
	@RequestMapping(value = { "/admin/contact" }, params = {"state"} ,method = RequestMethod.GET)
	public String getContactState(Model model, @RequestParam("state") String state) {
		List<ContractModel> ContactList = new ArrayList<ContractModel>();
			
		ContactList = contactDAO.getContactState(state);
		// add information to request
		model.addAttribute("ContactList", ContactList);
		
		List<Integer> countContact = new ArrayList<Integer>();
		
		countContact.add(contactDAO.countContactList());
		countContact.add(contactDAO.countContactState("new"));
		countContact.add(contactDAO.countContactState("nonereply"));
		countContact.add(contactDAO.countContactState("deleted"));
		countContact.add(contactDAO.countContactState("reply"));
		
		model.addAttribute("countContact", countContact);
				
		return "admin/contact";
	}
	
//	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
//	public String getContact(Model model, String state) {
//		List<ContractModel> ContactList = new ArrayList<ContractModel>();
//		ContactList = contactDAO.getContactState(state);
//
//		// add information to request
//		model.addAttribute("ContactList", ContactList);
//
//		return "admin/contact";
//	}
	
	
	//Get contact detail
	@RequestMapping(value = { "/admin/contact-detail" }, method = RequestMethod.GET)
	public String getContactDetail(Model model, Integer id) {
		this.getContact(model);
		
		ContractModel contactdetail = new ContractModel();
		contactdetail = contactDAO.getContactById(id);
		
		model.addAttribute("ContactDetail", contactdetail);
		
		return "admin/contact-detail";
	}
	
	
	//Get contact reply
	@RequestMapping(value = { "/admin/contact-reply" }, method = RequestMethod.GET)
	public String getContactReply(Model model, Integer id) {
		this.getContact(model);
		
		ContractModel contactdetail = new ContractModel();
		contactdetail = contactDAO.getContactById(id);
		
		model.addAttribute("ContactDetail", contactdetail);
		
		return "admin/contact-reply";
	}
	
	
	
	@RequestMapping(value = { "/admin/contact-reply" }, method = RequestMethod.POST)
	public String postContactReply(Model model, Integer id, HttpServletRequest req) {
		this.getContact(model);

		ContractModel contactdetail = new ContractModel();
		contactdetail = contactDAO.getContactById(id);
		
		model.addAttribute("ContactDetail", contactdetail);
		
		
		
//		String response = "Chúng tôi rất hân hạnh được phục vụ quý khách";
		
		String response = req.getParameter("response");
		
		
		boolean is_response = contactDAO.responseContact(id, response);
		
//		if(is_response) {
//			
//		} else {
//			
//		}
		
		return "admin/contact-reply";
	}

    @RequestMapping(value = { "/admin/editNews" }, method = RequestMethod.GET)
    public String editNews(Model model,
    		@RequestParam(value = "id", defaultValue="-1") int newsId) throws Exception {
    	
    	News currentNews = null;
    	if(newsId > 0){
    		currentNews = newsDAO.getNewsFromId(newsId);
    		if(currentNews == null){
        		throw new Exception();
        		}
    	}else{
    		throw new Exception();
    	}
    	// get this news information
    	NewsModel newsInformation = new NewsModel();
    	newsInformation.setAuthor(userDAO.getUserName(currentNews.getIdUser()));
    	newsInformation.setDateCreate((new SimpleDateFormat("dd/MM/yyyy")).format(currentNews.getDateCreate()));
    	newsInformation.setDateUpdate((new SimpleDateFormat("dd/MM/yyyy")).format(currentNews.getDateUpdate()));
    	newsInformation.setId(currentNews.getId());
    	newsInformation.setImage(currentNews.getImage());
    	newsInformation.setIsActive(currentNews.getIsActive());
    	newsInformation.setIsSavedraft(currentNews.getIsSavedraft());
    	newsInformation.setLongDetail(currentNews.getLongDetail());
    	newsInformation.setShortDetail(currentNews.getShortDetail());
    	newsInformation.setTitle(currentNews.getTitle());
    	newsInformation.setViews(currentNews.getViews());
    	
    	model.addAttribute("NewsInformation", newsInformation);
    	
        return "admin/edit_news";
    }
    
    @RequestMapping(value = { "/admin/doEditNews" }, method = RequestMethod.POST)
    public String doEditNews(Model model,HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam(value = "id", defaultValue="-1") int newsId,
    		@RequestParam(value = "title", defaultValue="") String title,
    		@RequestParam(value = "shortContent", defaultValue="") String shortContent,
    		@RequestParam(value = "longContent", defaultValue="") String longContent) throws IOException {
    	try {
    		News currentNews = null;
    		currentNews = newsDAO.getNewsFromId(newsId);
    		if(currentNews == null){
    			throw new Exception();
    		}
    		
    		currentNews.setTitle(title);
    		currentNews.setShortDetail(shortContent);
    		currentNews.setLongDetail(longContent);
    		currentNews.setDateUpdate(new Date());
    		
    		if(newsDAO.updateNews(currentNews)){
    			model.addAttribute("msg", "Thành công. Đã cập nhật bài viết xuống hệ thống!");
    		}else{
    			response.setStatus(403);
        		model.addAttribute("msg", "Thất bại! Đã xảy ra lỗi trong quá trình cập nhật.");
        		model.addAttribute("error", "error");
    		}
		} catch (Exception e) {
			model.addAttribute("msg", "Thất bại! Đã xảy ra lỗi trong quá trình cập nhật.");
    		model.addAttribute("error", "error");
		}
    	
    	return "admin/only_message_result";
    }

    @RequestMapping(value = { "/admin/deleteNews" }, method = RequestMethod.POST)
    public String deleteNews(Model model,HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam(value = "id", defaultValue="-1") int newsId) throws IOException {
    	try {
    		if(newsId < 0){
    			throw new Exception();
    		}
    		
    		if(newsDAO.deleteNews(newsId)){
    			response.setStatus(200);
    			model.addAttribute("msg", "success");
    		}else{
    			response.setStatus(403);
        		model.addAttribute("failed");
    		}
		} catch (Exception e) {
			response.setStatus(403);
    		model.addAttribute("failed");
		}
    	
    	return "admin/only_message_result";
    }

}
