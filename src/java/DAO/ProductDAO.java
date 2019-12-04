package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import BEAN.Product;
import DB.connectDB;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO extends connectDB{
	// Tạo mới sản phẩm
	public boolean insertProduct(Product product) {
            Connection con= connectDB.connectDB();
		String sql = "INSERT INTO `products`(`product_name`, `image`, `type`, `color`, `state`,  `price`, `description`) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getProduct_name());
			ps.setString(2, product.getImage());
			ps.setInt(3, product.getType());
			ps.setInt(4, product.getColor());
			ps.setInt(5, product.getState());
			ps.setInt(6, product.getPrice());
			ps.setString(7, product.getDescription());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Cập nhật thông tin sản phẩm
	public boolean updateProduct(Product product) {
            Connection con= connectDB.connectDB();
		String sql = "UPDATE `products` SET `product_name`=?,`image`=?,`type`=?, `color`=?, `state`=?,`price`=? ,`description`=? WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getProduct_name());
			ps.setString(2, product.getImage());
			ps.setInt(3, product.getType());
			ps.setInt(4, product.getColor());
			ps.setInt(5, product.getState());
			ps.setInt(6, product.getPrice());
			ps.setString(7, product.getDescription());
			ps.setInt(8, product.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Xóa sản phẩm
	public boolean deleteProduct(int id) {
            Connection con= connectDB.connectDB();
		String sql = "DELETE FROM `products` WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	// Lấy tất cả sản phẩm
	public static ArrayList<Product> getAllProduct(){
            Connection con= connectDB.connectDB();
		ArrayList<Product> listProduct = new ArrayList<Product>();
		String sql = "SELECT * FROM `products`";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String product_name = rs.getString(2);
				String image = rs.getString(3);
				int type = rs.getInt(4);
				int color = rs.getInt(5);
				int state = rs.getInt(6);
				int price = rs.getInt(7);
				String description = rs.getString(8);
				Product product = new Product(id, product_name, image, type, color, state, price, description);
				                       
                                listProduct.add(product);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listProduct;
	}
	
	
	// Lấy sản phẩm theo Id
	public Product getProductById(int id){
		Product product = null;
		String sql = "select * from products where id=" + id;
            try {
                Statement st = connectDB.connectDB().createStatement();
                ResultSet rs = st.executeQuery(sql);
                if(rs.next()){
                    product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
		return product;
	}
	
	// Lấy sản phẩm theo loại
	public ArrayList<Product> getProductsByType(int input_type){
            Connection con= connectDB.connectDB();
		ArrayList<Product> listProduct = new ArrayList<Product>();
		String sql = "SELECT * FROM `products` WHERE `type`=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, input_type);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String product_name = rs.getString(2);
				String image = rs.getString(3);
				int type = rs.getInt(4);
				int color = rs.getInt(5);
				int state = rs.getInt(6);
				int price = rs.getInt(7);
				String description = rs.getString(8);
				Product product = new Product(id, product_name, image, type, color, state, price, description);
				listProduct.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listProduct;
	}
 	// lấy sản phẩm trên trang chủ theo loại LIMIT 4
        public ArrayList<Product> getProductsByTypeLimit(int input_type){
            Connection con= connectDB.connectDB();
		ArrayList<Product> listProduct = new ArrayList<Product>();
		String sql = "SELECT * FROM `products` WHERE `type`=? LIMIT 4";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, input_type);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String product_name = rs.getString(2);
				String image = rs.getString(3);
				int type = rs.getInt(4);
				int color = rs.getInt(5);
				int state = rs.getInt(6);
				int price = rs.getInt(7);
				String description = rs.getString(8);
				Product product = new Product(id, product_name, image, type, color, state, price, description);
				listProduct.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listProduct;
	}
 	
	
	// Lấy sản phẩm theo màu sắc
	public ArrayList<Product> getProductsByColor(int input_color){
            Connection con= connectDB.connectDB();
		ArrayList<Product> listProduct = new ArrayList<Product>();
		String sql = "SELECT * FROM `products` WHERE `color`=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, input_color);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String product_name = rs.getString(2);
				String image = rs.getString(3);
				int type = rs.getInt(4);
				int color = rs.getInt(5);
				int state = rs.getInt(6);
				int price = rs.getInt(7);
				String description = rs.getString(8);
				Product product = new Product(id, product_name, image, type, color, state, price, description);
				listProduct.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listProduct;
	}
        // Lấy sản phẩm theo tên
	public ArrayList<Product> getProductsByName(String input_name){
            Connection con= connectDB.connectDB();
		ArrayList<Product> listProduct = new ArrayList<Product>();
		String sql = "SELECT * FROM products WHERE product_name LIKE ?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+ input_name + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String product_name = rs.getString(2);
				String image = rs.getString(3);
				int type = rs.getInt(4);
				int color = rs.getInt(5);
				int state = rs.getInt(6);
				int price = rs.getInt(7);
				String description = rs.getString(8);
				Product product = new Product(id, product_name, image, type, color, state, price, description);
				listProduct.add(product);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listProduct;
	}
 	
	public static void main(String[] args) {
		ProductDAO productDAO = new ProductDAO();
//                ArrayList<Product> listSP = productDAO.getProductsByType(1);
//                for(int i=0;i<listSP.size();i++)
//                    System.out.println(listSP.get(i).getId());
//                Product p = productDAO.getProductById(12);
//                p.setProduct_name(p.getProduct_name() + "ANHHH");
//                productDAO.updateProduct(p);
                  Product product= new Product("anh", "/Hoa/Basket/12.jpg", 1, 1, 1, 1, "1");
                  if(productDAO.insertProduct(product)==true){
                      System.out.println("YESSSS");
                  }
                  
	}
        
}
