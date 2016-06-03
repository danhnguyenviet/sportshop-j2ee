package j2ee.group01.sportshop.controller;
import java.io.BufferedReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.NewsDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.Category;
import j2ee.group01.sportshop.entity.News;
import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;
import j2ee.group01.sportshop.model.Cart;
import j2ee.group01.sportshop.model.CategoryModel;
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
    private NewsDAO newsDAO;
 
    // GET: Show Home Page
    // GET: Hiển thị trang chủ
    @RequestMapping(value = { "/view/home" }, method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
    	
    	List<ProductModel> mostList = new ArrayList<ProductModel>();
    	mostList = productDAO.getMostPurchaseProduct(recommandProduct);
    	
    	List<ProductModel> viewsList = new ArrayList<ProductModel>();
    	viewsList = productDAO.getFeaturedProduct(recommandProduct);
    	
    	List<ProductModel> newsestList = new ArrayList<ProductModel>();
    	newsestList = productDAO.getNewestProduct(recommandProduct);
    	
    	List<ProductModel> saleList = new ArrayList<ProductModel>();
    	saleList = productDAO.getSaleProduct(newestItem);
    	
    	List<CategoryModel> categoryList = new ArrayList<CategoryModel>();
    	categoryList = categoryDAO.getAllCategory(maxCategorySelect);
    	
    	//get brand html
    	String brandHtml = "";
    	Resource resource = new ClassPathResource("document/brand.html");
    	try {
			String url = resource.getURI().getPath();
			
			BufferedReader in;
			try {
				in = new BufferedReader(new InputStreamReader(new FileInputStream(url),"UTF8"));
				String str  = null;
				while((str = in.readLine()) != null){
					brandHtml += str;
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		model.addAttribute("BrandHtml", brandHtml);
    	model.addAttribute("MiddleBannerImage", "5-1170x124.png");
    	model.addAttribute("LeftBannerImage", "6-279x410.png");
    	model.addAttribute("SlideShowProductList", mostList.subList(0, 5));
    	model.addAttribute("MostPurchaseProductList", mostList);
    	model.addAttribute("FeatureProductList", viewsList);
    	model.addAttribute("NewestProductList", newsestList);
    	model.addAttribute("CategoryList", categoryList);
    	model.addAttribute("SaleProductList", saleList);
    	
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
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
    		@RequestParam(value = "id", defaultValue = "1") int productId) {
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
    
    // GET: Show news Page
    // GET: Hiển thị trang chi tin tức
    @RequestMapping(value = { "/view/news" }, method = RequestMethod.GET)
    public String news(Model model, 
    		@RequestParam(value = "page", defaultValue="1") int indexPageLink) {
    	
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
    	
    	
    	int newsCount = newsDAO.getCountNews();
    	int pageCount = (newsCount/newsPerPage)+1;
    	
    	model.addAttribute("LeftBannerImage", "6-279x410.png");
    	model.addAttribute("NewsListResult", newsListResult);
    	model.addAttribute("NewsMostViewListResult", newsMostViewListResult);
    	model.addAttribute("NewsPerPage", newsPerPage);
    	model.addAttribute("PrevPage", ((indexPageLink -1) < 1)?1:(indexPageLink -1));
    	model.addAttribute("NextPage", ((indexPageLink +1) > pageCount)?(indexPageLink +1):pageCount);
    	model.addAttribute("PageCount", pageCount);
    	model.addAttribute("CurrentPage", indexPageLink);
        return "views/news";
    }

    // GET: Show read news Page
    // GET: Hiển thị trang chi chi tiết về tin tức
    @RequestMapping(value = { "/view/read_news" }, method = RequestMethod.GET)
    public String readNews(Model model, 
    		@RequestParam(value = "id") int newsId) {
    	
    	News currentNews = null;
    	currentNews = newsDAO.getNewsFromId(newsId);
    	if(currentNews == null){
    		//error
    	}
    	
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
    	int theBeforeNewsId = newsDAO.getNewsIdBefore(currentNews);
    	int theAfterNewsId = newsDAO.getNewsIdAfter(currentNews);
    	
    	model.addAttribute("LeftBannerImage", "6-279x410.png");
    	model.addAttribute("NewsInformation", newsInformation);
    	model.addAttribute("NewsMostViewListResult", newsMostViewListResult);
    	model.addAttribute("NewsPerPage", newsPerPage);
    	model.addAttribute("BeforeNewsId", theBeforeNewsId);
    	model.addAttribute("AfterNewsId", theAfterNewsId);
        return "views/news_detail";
    }

    // GET: Show about Page
    // GET: Hiển thị trang giới thiệu
    @RequestMapping(value = { "/view/about" }, method = RequestMethod.GET)
    public String about(Model model) {
        return "views/about";
    }
    
    // GET: Add to cart
    // GET: Thêm vào giỏ hàng
    @RequestMapping(value = { "/view/addToCart" }, method = RequestMethod.POST)
    public String addToCart(HttpServletRequest request,
    		@RequestParam(value = "id") int productId,
    		@RequestParam(value = "quantity") int quantity) {
    	ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
    	if(shoppingCart == null){
    		shoppingCart = new ShoppingCart();
    	}
    	Cart cart = new Cart();
    	ProductModel productModel = productDAO.getProduct(productId);
    	if(productModel == null){
    		//error
    	}
    	ProductCart productCart = new ProductCart();
    	productCart.setId(productModel.getId());
    	productCart.setImage(productModel.getImages().get(0));
    	productCart.setPrice((productModel.getPricePromotion() != null && productModel.getPricePromotion() < productModel.getPrice())
    			? productModel.getPricePromotion():productModel.getPrice());
    	productCart.setTitle(productModel.getTitle());
    	cart.setProduct(productCart);
    	cart.setQuantity(quantity);
    	
    	shoppingCart.addProductCart(cart);
    	
    	request.getSession().setAttribute("ShoppingCart", shoppingCart);
    	
        return "views/templates/top-cart";
    }
    
    // GET: Delete cart
    // GET: Xóa khỏi giỏ hàng
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
}
