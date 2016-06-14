package j2ee.group01.sportshop.config;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import j2ee.group01.sportshop.authentication.MyDBAuthenticationService;
 
@Configuration
// @EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 
   @Autowired
   MyDBAuthenticationService myDBAauthenticationService;
   
   private String adminRole = "ADMIN";
   private String subAdminRole = "SUB_ADMIN";
 
   @Autowired
   public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
 
       // Các User trong Database
       auth.userDetailsService(myDBAauthenticationService);
 
   }
 
   @Override
   protected void configure(HttpSecurity http) throws Exception {
 
	   http.headers().frameOptions().disable();
	   
       http.csrf().disable();
 
       // Các yêu cầu phải login với vai trò EMPLOYEE hoặc MANAGER.
       // Nếu chưa login, nó sẽ redirect tới trang /login.
       http.authorizeRequests().antMatchers("/admin/news",
    		   								"/admin/home",
    		   								"/admin/productlist",
    		   								"/admin/newproductpage",
    		   								"/admin/saveproductinfo",
    		   								"/admin/deleteproduct",
    		   								"/admin/editproduct",
    		   								"/admin/updateproductinfo",
    		   								"/admin/orderlist",
    		   								"/admin/news",
    		   								"/admin/addNews",
    		   								"/admin/doAddNews",
    		   								"/admin/orderdetaillist",
    		   								"/admin/confirmorder",
    		   								"/admin/contact",
    		   								"/admin/contact",
    		   								"/admin/contact-detail",
    		   								"/admin/contact-reply",
    		   								"/admin/contact-reply",
    		   								"/admin/editNews",
    		   								"/admin/doEditNews",
    		   								"/admin/deleteNews"
    		   								)//
               .access("hasRole('ROLE_SUB_ADMIN') or hasRole('ROLE_ADMIN')");
 
  
       // Trang chỉ dành cho MANAGER
       http.authorizeRequests().antMatchers("/admin/user",
    		   								"/admin/addnewuser"
    		   								).access("hasRole('ROLE_ADMIN')");
  
       // Khi người dùng đã login, với vai trò XX.
       // Nhưng truy cập vào trang yêu cầu vai trò YY,
       // Ngoại lệ AccessDeniedException sẽ ném ra.
       http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
 
  
       // Cấu hình cho Login Form.
       http.authorizeRequests().and().formLogin()//
          
               // Submit URL của trang login
               .loginProcessingUrl("/dologin") // Submit URL
               .loginPage("/login")//
               .defaultSuccessUrl("/admin/home")//
               .failureUrl("/login?error=true")//
               .usernameParameter("userName")//
               .passwordParameter("password")
            
               // Cấu hình cho Logout Page.
               // (Sau khi logout, chuyển tới trang home)
               .and().logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout=true");
 
   }
}