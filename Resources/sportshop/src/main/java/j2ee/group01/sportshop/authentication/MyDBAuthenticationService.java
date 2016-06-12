package j2ee.group01.sportshop.authentication;
import java.util.ArrayList;
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import j2ee.group01.sportshop.dao.UserDAO;
import j2ee.group01.sportshop.entity.User;
 
@Service
public class MyDBAuthenticationService implements UserDetailsService {
 
    @Autowired
    private UserDAO accountDAO;
 

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       /* User account = new User();//accountDAO.findAccount(username);
        System.out.println("Account= " + account);
 
        if (account == null) {
            throw new UsernameNotFoundException("User " //
                    + username + " was not found in the database");
        }
 
        // EMPLOYEE,MANAGER,..
        String role = account.getUserRole();*/
 
        /*List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
 
        // ROLE_EMPLOYEE, ROLE_MANAGER
        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
 
        grantList.add(authority);
 
        boolean enabled = account.isActive();
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;*/
        
    	
    	// cho nay m lay user de so sanh
 
        UserDetails userDetails = (UserDetails) new User();
 
        return userDetails;
    }
 
}