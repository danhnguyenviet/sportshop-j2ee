package j2ee.group01.sportshop.config;
 
import java.util.Properties;
 
import javax.sql.DataSource;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import j2ee.group01.sportshop.dao.CategoryDAO;
import j2ee.group01.sportshop.dao.ContactDAO;
import j2ee.group01.sportshop.dao.NewsDAO;
import j2ee.group01.sportshop.dao.OrderDAO;
import j2ee.group01.sportshop.dao.OrderDetailDAO;
import j2ee.group01.sportshop.dao.ProductDAO;
import j2ee.group01.sportshop.dao.RequestContactDAO;
import j2ee.group01.sportshop.dao.UserDAO;
 
@Configuration
@ComponentScan("j2ee.group01.sportshop.*")
@EnableTransactionManagement
// Load to Environment.
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class ApplicationContextConfig {
 
  
 
   // Lưu trữ các giá thuộc tính load bởi @PropertySource.
   @Autowired
   private Environment env;
 
   @Bean
   public ResourceBundleMessageSource messageSource() {
       ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
       // Load property in message/validator.properties
       rb.setBasenames(new String[] { "messages/validator" });
       return rb;
   }
 
   @Bean(name = "viewResolver")
   public InternalResourceViewResolver getViewResolver() {
       InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
       viewResolver.setPrefix("/WEB-INF/pages/");
       viewResolver.setSuffix(".jsp");
       return viewResolver;
   }
    
  
   // Cấu hình để Upload.
   @Bean(name = "multipartResolver")
   public CommonsMultipartResolver multipartResolver() {
       CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        
       // Set Max Size...
       commonsMultipartResolver.setMaxUploadSize(1024*1024*10);
       commonsMultipartResolver.setDefaultEncoding("UTF-8");
        
       return commonsMultipartResolver;
   }
 
   @Bean(name = "dataSource")
   public DataSource getDataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
 
  
       // Xem: ds-hibernate-cfg.properties
       dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
       dataSource.setUrl(env.getProperty("ds.url"));
       dataSource.setUsername(env.getProperty("ds.username"));
       dataSource.setPassword(env.getProperty("ds.password"));
        
       System.out.println("## getDataSource url: " + dataSource.getUrl());
       System.out.println("## getDataSource: " + dataSource);
        
       return dataSource;
   }
 
   @Autowired
   @Bean(name = "sessionFactory")
   public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
       Properties properties = new Properties();
 
  
       // Xem: ds-hibernate-cfg.properties
       properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
       properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
       properties.put("current_session_context_class", env.getProperty("current_session_context_class"));
        
 
       LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
  
       // Package chứa các entity class.
       factoryBean.setPackagesToScan(new String[] { "j2ee.group01.sportshop.entity" });
       factoryBean.setDataSource(dataSource);
       factoryBean.setHibernateProperties(properties);
       factoryBean.afterPropertiesSet();
       //
       SessionFactory sf = factoryBean.getObject();
       System.out.println("## getSessionFactory: " + sf);
       return sf;
   }
 
   @Autowired
   @Bean(name = "transactionManager")
   public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
       HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
 
       return transactionManager;
   }
 
   @Bean(name = "categoryDAO")
   public CategoryDAO getCategoryDAO() {
       return new CategoryDAO();
   }
   @Bean(name = "contactDAO")
   public ContactDAO getContactDAO() {
       return new ContactDAO();
   }
   @Bean(name = "newsDAO")
   public NewsDAO getNewsDAO() {
       return new NewsDAO();
   }
   @Bean(name = "orderDAO")
   public OrderDAO getOrderDAO() {
       return new OrderDAO();
   }
   @Bean(name = "orderDetailDAO")
   public OrderDetailDAO getOrderDetailDAO() {
       return new OrderDetailDAO();
   }
   @Bean(name = "productDAO")
   public ProductDAO getProductDAO() {
       return new ProductDAO();
   }
   @Bean(name = "userDAO")
   public UserDAO getUserDAO() {
       return new UserDAO();
   }
   @Bean(name = "requestContactDAO")
   public RequestContactDAO getRequestContactDAO() {
       return new RequestContactDAO();
   }
 
   
}