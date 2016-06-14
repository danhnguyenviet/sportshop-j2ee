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
    private UserDAO userDAO;
 
    private String adminRole = "ADMIN";
    private String subAdminRole = "SUB_ADMIN";

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	j2ee.group01.sportshop.entity.User user = userDAO.getUserFromUsername(username);
        
        System.out.println("Account= " + user);
 
        if (user == null) {
            throw new UsernameNotFoundException("User "
                    + username + " was not found in the database");
        }
 
        // EMPLOYEE,MANAGER,..
        String role = "ROLE_"+((user.isIdRole())?adminRole:subAdminRole);
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
 
        // ROLE_EMPLOYEE, ROLE_MANAGER
        GrantedAuthority authority = new SimpleGrantedAuthority(role);
 
        grantList.add(authority);
 
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        
        UserDetails userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(user.getUsername(), //
        		user.getPassword(), true, accountNonExpired, //
                credentialsNonExpired, accountNonLocked, grantList);
 
        return userDetails;
    }
 
}