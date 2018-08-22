package it.unisasvapo.DBAccess;
import java.util.ArrayList;

import it.unisasvapo.javabean.CartBean;
import it.unisasvapo.javabean.OrderBean;
import it.unisasvapo.javabean.ProductBean;
import it.unisasvapo.javabean.UserBean;


public interface GetInformation {
	public ArrayList<String> getCategories();
	public ArrayList<ProductBean> getAllProduct();
	public ArrayList<ProductBean> getProductByCategory(String category);
	public UserBean checkUser(String username, String password);
	public ArrayList<OrderBean> getOrderByUserId(int userId);
	public ProductBean getProductById(String id);
	public boolean createNewUser(UserBean user,String password);
	public boolean createNewProduct(ProductBean product);
	public ArrayList<ProductBean> getAllProductInList();
	public boolean updateProduct(String idProduct,String idMag,float quant);
	public boolean buy(String userId, CartBean cart);
	public ArrayList<OrderBean> getOrderForAdmin();
	public boolean updateState(String id, int value);
	public boolean DeleteProduct(String id);
	public ArrayList<UserBean> GetUserForAdmin();
	
}
