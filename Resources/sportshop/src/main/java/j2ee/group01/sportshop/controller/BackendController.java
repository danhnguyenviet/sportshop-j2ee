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
import j2ee.group01.sportshop.entity.News;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.NewsModel;
import j2ee.group01.sportshop.model.OrderDetailModel;
import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.OrderDAO;
import j2ee.group01.sportshop.dao.OrderDetailDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.model.CategoryModel;
import j2ee.group01.sportshop.model.OrderModel;
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

	private String uploadImage(String fileName, String savePath, String rootPath, MultipartFile file)
			throws IOException {
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
}
