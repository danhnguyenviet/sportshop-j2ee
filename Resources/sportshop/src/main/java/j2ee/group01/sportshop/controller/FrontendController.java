package j2ee.group01.sportshop.controller;
import java.io.BufferedReader;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.ResourceBundle;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.NewsDAO;
import j2ee.group01.sportshop.dao.OrderDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.dao.RequestContactDAO;
import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.Category;
import j2ee.group01.sportshop.entity.News;
import j2ee.group01.sportshop.entity.Order;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.RequestContact;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.Cart;
import j2ee.group01.sportshop.model.CategoryModel;
import j2ee.group01.sportshop.model.ContractModel;
import j2ee.group01.sportshop.model.NewsModel;
import j2ee.group01.sportshop.model.ProductCart;
import j2ee.group01.sportshop.model.ProductModel;
import j2ee.group01.sportshop.model.ShoppingCart;
 
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
	private int newsPerPage = 3;
	private int mostViewNews = 8;
	
    @Autowired
    private UserDAO userDAO;
    
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private CategoryDAO categoryDAO;
    
    @Autowired
    private OrderDAO orderDAO;
    
    @Autowired
    private NewsDAO newsDAO;
    
    @Autowired
    private RequestContactDAO requestContactDAO;
 
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public ModelAndView homeNone(Model model, HttpServletRequest request) {
    	return new ModelAndView("redirect:/view/home");
    }
    
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/view" }, method = RequestMethod.GET)
    public ModelAndView homeView(Model model, HttpServletRequest request) {
    	return new ModelAndView("redirect:/view/home");
    }
    
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/home" }, method = RequestMethod.GET)
    public ModelAndView homePage(Model model, HttpServletRequest request) {
    	return new ModelAndView("redirect:/view/home");
    }
    
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/view/home" }, method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
    	
    	// load header infomation
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	
    	// load body content
    	// get list product most purchase
    	List<ProductModel> mostList = new ArrayList<ProductModel>();
    	mostList = productDAO.getMostPurchaseProduct(recommandProduct);
    	// get list product most view
    	List<ProductModel> viewsList = new ArrayList<ProductModel>();
    	viewsList = productDAO.getFeaturedProduct(recommandProduct);
    	// get list product newest update
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProduct(recommandProduct);
    	// get list slide show from most purchase list
    	List<ProductModel> slideShow = new ArrayList<ProductModel>();
    	slideShow = mostList;//.//subList(0, newestItem);
    	// get banner infomation 
    	String leftBanner="";
    	String midBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    		midBanner = bannerProperties.getProperty("MID_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// load footer information
    	// get brand html from static html resource
    	String brandHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Brand.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				brandHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// add information to request
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("MostPurchaseProductList", mostList);
    	model.addAttribute("FeatureProductList", viewsList);
    	model.addAttribute("NewestProductList", newsestList);
    	model.addAttribute("SlideShowProductList", slideShow);
    	model.addAttribute("MiddleBannerImage", midBanner);
    	model.addAttribute("LeftBannerImage", leftBanner);
    	
		model.addAttribute("BrandHtml", brandHtml);
		model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);

		// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
    	// fill data and set to response from 'home.jsp' file
        return "views/home";
    }
 
    // GET: Show Category Page
    // GET: Hiển thị trang Loại sản phẩm
    @RequestMapping(value = { "/view/category" }, method = RequestMethod.GET)
    public String category(Model model, HttpServletRequest request,
    		@RequestParam(value = "id", defaultValue="-1") int categoryId,
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink,
    		@RequestParam(value = "sort", defaultValue="0") int sortMode) throws Exception {
    	// check category if exist
    	CategoryModel category = null;
    	if(categoryId < 1){
    		category = categoryDAO.getCategoryDefault();
    	}else{
    		category = categoryDAO.getCategory(categoryId);
    	}
    	if(category == null){	// cannot find category
    		throw new Exception();
    	}
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	// set title for site map
    	String title = category.getTitle();
    	String siteMapTitle = category.getTitle();
    	String siteMapUrl = "../view/category?id="+category.getId();
    	String pageLinkUrl = "../view/category";
    	//set main title
    	String mainTitle = "Danh sách sản phẩm thuộc '"+category.getTitle()+"'";
    	// get all product from this category
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getProductFromCategory(category.getId(), sortMode, indexPageLink, itemPerPage);
    	// get product newsest in this category
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProductFromCategory(newestItem, category.getId());
    	// get banner infomation 
    	String leftBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	// get all product of this category
    	int countProduct = productDAO.getCountByCategory(category.getId());
    	// calculate page to show all product of this category
    	int countPage = (countProduct/itemPerPage)+1;
    	
    	
    	// load footer information
		// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	model.addAttribute("PageTitle", title);
    	
    	model.addAttribute("CategoryInfoDescription", category.getDescription());
    	model.addAttribute("CategoryInfoImage", category.getImage());
    	model.addAttribute("PageId", category.getId());
    	model.addAttribute("LeftBannerImage", leftBanner);
    	model.addAttribute("PageLinkUrl", pageLinkUrl);
    	model.addAttribute("MainTitle", mainTitle);
    	model.addAttribute("PageTitle", title);
    	model.addAttribute("SiteMapTitle", siteMapTitle);
    	model.addAttribute("SiteMapUrl", siteMapUrl);
    	model.addAttribute("CategoryInformation", category);
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("NewsestProductList", newsestList);
    	model.addAttribute("CountPage", countPage);
    	model.addAttribute("ItemPerPage", itemPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > countPage)?(indexPageLink +1):countPage);
    	model.addAttribute("SortMode", sortMode);
    	model.addAttribute("CurrentPage", indexPageLink);
    	model.addAttribute("CountProduct", countProduct);
    	
		model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
		// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
		// fill data to 'category.jsp' then set to response
        return "views/category";
    }
    
    // GET: Show Product detail Page
    // GET: Hiển thị trang chi tiết sản phẩm
    @RequestMapping(value = { "/view/product" }, method = RequestMethod.GET)
    public String product(Model model, HttpServletRequest request,
    		@RequestParam(value = "id", defaultValue = "1") int productId) throws Exception {
    	// load product if exist
    	ProductModel product = productDAO.getProduct(productId);
    	if(product == null)	// cannot find this product
    	{
    		throw new Exception();
    	}
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	// get list product for recommand
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getNewestProductFromCategory(recommandProduct,product.getIdCategory());
    	// get category include this product
    	CategoryModel category = categoryDAO.getCategory(product.getIdCategory());
    	
    	// load footer information
		// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("ProductInformation", product);
    	model.addAttribute("CategoryInformation", category);
    	
		model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
		// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
		
		// fill data to 'product.jsp' then set to response
        return "views/product";
    }
    
    // GET: Show news Page
    // GET: Hiển thị trang chi tin tức
    @RequestMapping(value = { "/view/news" }, method = RequestMethod.GET)
    public String news(Model model, HttpServletRequest request,
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink) {
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	// get list news newest update
    	List<NewsModel> newsListResult = new ArrayList<NewsModel>();
    	List<News> newsList= new ArrayList<News>();
    	newsList = newsDAO.getNewsForPage(indexPageLink, newsPerPage);
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
    	// get list news have most views
    	List<NewsModel> newsMostViewListResult = new ArrayList<NewsModel>();
    	List<News> newsMostViewList= new ArrayList<News>();
    	newsMostViewList = newsDAO.getNewsForPageMostView(mostViewNews);
    	for (News news : newsMostViewList) {
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
			newsMostViewListResult.add(item);
		}
    	// get count news
    	int newsCount = newsDAO.getCountNews();
    	// calculate page 
    	int pageCount = (newsCount/newsPerPage)+1;
    	// get banner infomation 
    	String leftBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}

    	// load footer information
    	// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    			
    	// set to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("LeftBannerImage", leftBanner);
    	model.addAttribute("NewsListResult", newsListResult);
    	model.addAttribute("NewsMostViewListResult", newsMostViewListResult);
    	model.addAttribute("NewsPerPage", newsPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > pageCount)?(indexPageLink +1):pageCount);
    	model.addAttribute("PageCount", pageCount);
    	model.addAttribute("CurrentPage", indexPageLink);
    	
    	model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
    	// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/news";
    }
    
    // GET: Show read news Page
    // GET: Hiển thị trang chi chi tiết về tin tức
    @RequestMapping(value = { "/view/read_news" }, method = RequestMethod.GET)
    public String readNews(Model model, HttpServletRequest request,
    		@RequestParam(value = "id", defaultValue="-1") int newsId) throws Exception {
    	
    	News currentNews = null;
    	if(newsId < 1){
    		currentNews = newsDAO.getNewsDefault();
    	}else{
    		currentNews = newsDAO.getNewsFromId(newsId);
    	}
    	if(currentNews == null){
    		throw new Exception();
    	}
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
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
    	// get list news most views
    	List<NewsModel> newsMostViewListResult = new ArrayList<NewsModel>();
    	List<News> newsMostViewList= new ArrayList<News>();
    	newsMostViewList = newsDAO.getNewsForPageMostView(mostViewNews);
    	for (News news : newsMostViewList) {
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
			newsMostViewListResult.add(item);
		}
    	// get news before id
    	int theBeforeNewsId = newsDAO.getNewsIdBefore(currentNews);
    	// get news after id
    	int theAfterNewsId = newsDAO.getNewsIdAfter(currentNews);
    	// get banner infomation 
    	String leftBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// load footer information
    	// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}

    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("LeftBannerImage", leftBanner);
    	model.addAttribute("NewsInformation", newsInformation);
    	model.addAttribute("NewsMostViewListResult", newsMostViewListResult);
    	model.addAttribute("NewsPerPage", newsPerPage);
    	model.addAttribute("BeforeNewsId", theBeforeNewsId);
    	model.addAttribute("AfterNewsId", theAfterNewsId);
    	
    	model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
		
    	// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
    	// fill data to 'news_detail.jsp' then set to response
        return "views/news_detail";
    }
    
    // GET: Show about Page
    // GET: Hiển thị trang giới thiệu
    @RequestMapping(value = { "/view/about" }, method = RequestMethod.GET)
    public String about(Model model, HttpServletRequest request) {
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	String aboutHtml = "";
		try {
			Resource resource = new ClassPathResource("document/About.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				aboutHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	// load footer information
    	// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    		
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}

    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("AboutHtml", aboutHtml);
    	
    	model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
		
    	// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
    	// fill data to 'about.jsp' then set to response
        return "views/about";
    }
    
    // GET: Show contact Page
    // GET: Hiển thị trang liên hệ
    @RequestMapping(value = { "/view/contact" }, method = RequestMethod.GET)
    public String contact(Model model, HttpServletRequest request) {
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	
    	
    	// load footer information
    	// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    		
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}

    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
		
    	// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
    	// fill data to 'contact.jsp' then set to response
    	return "views/contact";
    }
    
    // GET: Show cart Page
    // GET: Hiển thị trang giỏ hàng
    @RequestMapping(value = { "/view/cart" }, method = RequestMethod.GET)
    public String cart(Model model, HttpServletRequest request) {
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	
    	
    	// load footer information
    	// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    		
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}

    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	
    	model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
    	
    	// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
        return "views/cart";
    }
    
    // POST: Add to cart
    // POST: Thêm vào giỏ hàng
    @RequestMapping(value = { "/view/addToCart" }, method = RequestMethod.POST)
    public String addToCart(HttpServletRequest request,
    		@RequestParam(value = "id") int productId,
    		@RequestParam(value = "quantity") int quantity) throws Exception {
    	if(quantity < 1){
    		throw new Exception();
    	}
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	Cart cart = new Cart();
    	ProductModel productModel = productDAO.getProduct(productId);
    	if(productModel == null){
    		throw new Exception();
    	}
    	ProductCart productCart = new ProductCart();
    	productCart.setId(productModel.getId());
    	productCart.setImage(productModel.getImages().get(0));
    	productCart.setPrice((productModel.getPricePromotion() != null && productModel.getPricePromotion() < productModel.getPrice())
    			? productModel.getPricePromotion():productModel.getPrice());
    	productCart.setTitle(productModel.getTitle());
    	productCart.setCode(productModel.getCode());
    	cart.setProduct(productCart);
    	cart.setQuantity(quantity);
    	
    	shoppingCart.addProductCart(cart);
    	
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/templates/top-cart";
    }
    
    // POST: Update to cart
    // POST: Cập nhật vào giỏ hàng
    @RequestMapping(value = { "/view/updateToCart" }, method = RequestMethod.POST)
    public String updateToCart(HttpServletRequest request,
    		@RequestParam(value = "id") int productId,
    		@RequestParam(value = "quantity") int quantity) throws Exception {
    	if(quantity < 1){
    		throw new Exception();
    	}
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	Cart cart = new Cart();
    	ProductModel productModel = productDAO.getProduct(productId);
    	if(productModel == null){
    		throw new Exception();
    	}
    	ProductCart productCart = new ProductCart();
    	productCart.setId(productModel.getId());
    	productCart.setImage(productModel.getImages().get(0));
    	productCart.setPrice((productModel.getPricePromotion() != null && productModel.getPricePromotion() < productModel.getPrice())
    			? productModel.getPricePromotion():productModel.getPrice());
    	productCart.setTitle(productModel.getTitle());
    	productCart.setCode(productModel.getCode());
    	cart.setProduct(productCart);
    	cart.setQuantity(quantity);
    	System.out.println("quantity = "+quantity);
    	System.out.println("id = "+productCart.getId());
    	shoppingCart.updateProductCart(cart);
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/templates/cart-content-mid";
    }
    
    // POST: Delete cart
    // POST: Xóa khỏi giỏ hàng
    @RequestMapping(value = { "/view/deleteFromCart" }, method = RequestMethod.POST)
    public String deleteFromCart(HttpServletRequest request,
    		@RequestParam(value = "id") int productId) {
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}else{
    		shoppingCart.removeProductCart(productId);
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/templates/cart-content-mid";
    }
    
    // POST: Delete cart
    // POST: Xóa khỏi giỏ hàng
    @RequestMapping(value = { "/view/removeFromCart" }, method = RequestMethod.POST)
    public String removeFromCart(HttpServletRequest request,
    		@RequestParam(value = "id") int productId) {
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}else{
    		shoppingCart.removeProductCart(productId);
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/templates/top-cart";
    }

    // POST: checkout cart
    // POST: Đặt hàng và lưu vào db
    @RequestMapping(value = { "/view/checkoutCart" }, method = RequestMethod.POST)
    public String checkoutCart(HttpServletRequest request,
    		@RequestParam(value = "fullName") String fullName,
    		@RequestParam(value = "phone") String phone,
    		@RequestParam(value = "email") String email,
    		@RequestParam(value = "province") String province,
    		@RequestParam(value = "district") String district,
    		@RequestParam(value = "wards") String wards,
    		@RequestParam(value = "street") String street) throws Exception {
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null || shoppingCart.getAllProduct().size() < 1){
    		throw new Exception();
    	}
    	
    	Order order = new Order();
    	order.setAddress(street+" "+wards+" "+district+" "+ province);
    	order.setDateCreate(new Date());
    	order.setDateDelivery(null);
    	order.setEmail(email);
    	order.setFullname(fullName);
    	order.setId(null);
    	order.setIsActive(0);
    	order.setNote(null);
    	order.setPhone(phone);
    	order.setPhone(phone);
    	order.setShipAddress(street+" "+wards+" "+district+" "+ province);
    	order.setShipName(fullName);
    	order.setShipPhone(phone);
    	order.setTotalAmount(shoppingCart.getFeePurchase());
    	order.setTotalAmountReal(shoppingCart.getRealFeePurschase());
    	
    	orderDAO.insertOder(order, shoppingCart.getAllProduct());
    	
    	shoppingCart = new ShoppingCart();
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);	
        return "views/templates/cart-content";
    }

    // POST: save contact request
    // POST: Lưu lại phản hồi cần liên lạc từ khách hàng
    @RequestMapping(value = { "/view/saveContactRequest" }, method = RequestMethod.POST)
    public void saveContactRequest(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam(value = "fullName") String fullName,
    		@RequestParam(value = "email") String email,
    		@RequestParam(value = "content") String content) throws Exception {
    	try {
    		RequestContact contact = new RequestContact();
        	contact.setContent(content);
        	contact.setDateCreate(new Date());
        	contact.setEmail(email);
        	contact.setFullname(fullName);
        	contact.setId(null);
        	contact.setRepsonse(false);
        	
        	requestContactDAO.addRequestContact(contact);
        	response.setStatus(200);
		} catch (Exception e) {
			response.setStatus(403);
		}
    }

    // GET: Show sale Page
    // GET: Hiển thị trang danh sách sản phẩm đang khuyến mãi
    @RequestMapping(value = { "/view/sale" }, method = RequestMethod.GET)
    public String sale(Model model, HttpServletRequest request,
    		@RequestParam(value = "id", defaultValue="1") int id,
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink,
    		@RequestParam(value = "sort", defaultValue="0") int sortMode) throws Exception {
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	// set title for site map
    	String title = "Khuyến Mãi";
    	String siteMapTitle = "Sản Phẩm Đang Khuyến Mãi";
    	String siteMapUrl = "../view/sale";
    	String pageLinkUrl = "../view/sale";
    	//set main title
    	String mainTitle = "Danh sách sản phẩm khuyến mãi";
    	// get all product sale off
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getSaleListProduct(sortMode, indexPageLink, itemPerPage);
    	// get product newsest in this category
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProduct(newestItem);
    	// get all product of this category
    	int countProduct = productDAO.getCountBySale();
    	// calculate page to show all product of this category
    	int countPage = (countProduct/itemPerPage)+1;
    	// get banner infomation 
    	String leftBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	
    	// load footer information
		// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	model.addAttribute("PageTitle", title);

    	model.addAttribute("PageId", id);
    	model.addAttribute("LeftBannerImage", leftBanner);
    	model.addAttribute("PageLinkUrl", pageLinkUrl);
    	model.addAttribute("MainTitle", mainTitle);
    	model.addAttribute("PageTitle", title);
    	model.addAttribute("SiteMapTitle", siteMapTitle);
    	model.addAttribute("SiteMapUrl", siteMapUrl);
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("NewsestProductList", newsestList);
    	model.addAttribute("CountPage", countPage);
    	model.addAttribute("ItemPerPage", itemPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > countPage)?(indexPageLink +1):countPage);
    	model.addAttribute("SortMode", sortMode);
    	model.addAttribute("CurrentPage", indexPageLink);
    	model.addAttribute("CountProduct", countProduct);
    	
		model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
		// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
		// fill data to 'category.jsp' then set to response
        return "views/category";
    }
    
    // GET: Show search Page
    // GET: Hiển thị trang danh sách sản phẩm đang khuyến mãi
    @RequestMapping(value = { "/view/search" }, method = RequestMethod.GET)
    public String search(Model model, HttpServletRequest request,
    		@RequestParam(value = "id", defaultValue="1") String keyword,
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink,
    		@RequestParam(value = "sort", defaultValue="0") int sortMode) throws Exception {
    	
    	// load header information
    	// get list product sale off
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	// get list category 
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	// load body content
    	// set title for site map
    	String title = "Tìm Kiếm";
    	String siteMapTitle = "Tìm Kiếm Sản Phẩm";
    	String siteMapUrl = "../view/search?id="+keyword;
    	String pageLinkUrl = "../view/search";
    	//set main title
    	String mainTitle = "Kết quả cho từ khóa '"+keyword+"'";
    	// get all product sale off
    	List<ProductModel> productListResult = new ArrayList<ProductModel>();
    	productListResult = productDAO.getSearchProduct(keyword,sortMode, indexPageLink, itemPerPage);
    	// get product newsest in this category
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProduct(newestItem);
    	// get all product of this category
    	int countProduct = productDAO.getCountBySearch(keyword);
    	// calculate page to show all product of this category
    	int countPage = (countProduct/itemPerPage)+1;
    	// get banner infomation 
    	String leftBanner="";
    	Properties bannerProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/banner.properties");
    		bannerProperties.load(new FileInputStream(resource.getURI().getPath()));
    		leftBanner = bannerProperties.getProperty("LEFT_BANNER");
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	
    	// load footer information
		// get service html from static resource
		String serviceHtml = "";
		try {
			Resource resource = new ClassPathResource("document/Services.html");
	    	BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(resource.getURI().getPath()),"UTF8"));
			String str  = null;
			while((str = in.readLine()) != null){
				serviceHtml += str;
			}
			in.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// get contract information
		ContractModel contract = new ContractModel();
    	Properties aboutProperties = new Properties();
    	try {
    		Resource resource = new ClassPathResource("properties/about.properties");
    		FileInputStream  stream = new FileInputStream(resource.getURI().getPath());
    		aboutProperties.load(new InputStreamReader(stream, "UTF-8"));
    		stream.close();
    		contract.setName(aboutProperties.getProperty("NAME"));
    		contract.setSlogun(aboutProperties.getProperty("SLOGUN"));
    		contract.setAddress(aboutProperties.getProperty("ADDRESS"));
    		contract.setEmail(aboutProperties.getProperty("EMAIL"));
    		contract.setFax(aboutProperties.getProperty("FAX"));
    		contract.setPhone(aboutProperties.getProperty("PHONE"));
    		contract.setFbAddress(aboutProperties.getProperty("FB"));
    		contract.setTwtAddress(aboutProperties.getProperty("TWT"));
    		stream.close();
    	} catch (IOException e) {	// error then write log
    	  e.printStackTrace();
    	}
    	
    	// set information to request content
    	model.addAttribute("SaleProductList", saleList);
    	model.addAttribute("CategoryList", categoryList);
    	model.addAttribute("PageTitle", title);

    	model.addAttribute("PageId", keyword);
    	model.addAttribute("LeftBannerImage", leftBanner);
    	model.addAttribute("PageLinkUrl", pageLinkUrl);
    	model.addAttribute("MainTitle", mainTitle);
    	model.addAttribute("PageTitle", title);
    	model.addAttribute("SiteMapTitle", siteMapTitle);
    	model.addAttribute("SiteMapUrl", siteMapUrl);
    	model.addAttribute("ProductListResult", productListResult);
    	model.addAttribute("NewsestProductList", newsestList);
    	model.addAttribute("CountPage", countPage);
    	model.addAttribute("ItemPerPage", itemPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > countPage)?(indexPageLink +1):countPage);
    	model.addAttribute("SortMode", sortMode);
    	model.addAttribute("CurrentPage", indexPageLink);
    	model.addAttribute("CountProduct", countProduct);
    	
		model.addAttribute("ServiceHtml", serviceHtml);
		model.addAttribute("ContractInformation", contract);
    	
		// check session: if not exist that create it
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
		// fill data to 'category.jsp' then set to response
        return "views/category";
    }
    
}
