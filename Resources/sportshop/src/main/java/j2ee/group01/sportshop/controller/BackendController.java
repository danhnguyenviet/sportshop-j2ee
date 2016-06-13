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
 
@Controller
// Enable Hibernate Transaction.
// Cần thiết cho Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class BackendController {
 
	private int itemPerPage = 12;
	private int newestItem = 5;
	private int maxCategorySelect = 20;
	private int recommandProduct = 10;
	private int newsPerPage = 3;
	private int mostViewNews = 8;
	
	private static final String UPLOAD_DIRECTORY = "image/upload";
	 
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	
    @Autowired
    private UserDAO userDAO;
    
    @Autowired
    private NewsDAO newsDAO;
 
    @RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
    public String home(Model model) {
    	
    	
        return "admin/home";
    }

    @RequestMapping(value = { "/admin/login" }, method = RequestMethod.GET)
    public String login(Model model) {
    	
    	
        return "admin/login";
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
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
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
