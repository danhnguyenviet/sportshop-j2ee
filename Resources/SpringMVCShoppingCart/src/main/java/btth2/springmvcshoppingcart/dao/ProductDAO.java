package btth2.springmvcshoppingcart.dao;
import btth2.springmvcshoppingcart.entity.Product;
import btth2.springmvcshoppingcart.model.PaginationResult;
import btth2.springmvcshoppingcart.model.ProductInfo;
 
public interface ProductDAO {
 
    
    
    public Product findProduct(String code);
    
    public ProductInfo findProductInfo(String code) ;
  
    
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage  );
    
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName);
 
    public void save(ProductInfo productInfo);
    
}
