package DAO;

import BEAN.Basket;
import BEAN.BasketDetail;
import BEAN.Product;
import DB.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BasketDetailDAO extends DAOConnector{
	private Connection con;
	private ProductDAO productDAO;
	public BasketDetailDAO(){
		getInstance();
		con = connectDB.connectDB();
		productDAO = new ProductDAO();
	}
	
	
	// Thêm một sản phẩm vào trong giỏ hàng
	public boolean insertProductIntoBasket(BasketDetail basketDetail, Basket basket) {
		String sql = "INSERT INTO `basket_details`(`product_id`, `quantity`, `basket_id`) VALUES (?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, basketDetail.getProduct().getId());
			ps.setInt(2, basketDetail.getQuantity());
			ps.setInt(3, basket.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	// Cập nhật số lượng của sản phẩm
	public boolean updateBasketDetail(BasketDetail basketDetail) {
		String sql = "UPDATE `basket_details` SET `quantity`=? WHERE `id`=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, basketDetail.getQuantity());
			ps.setInt(2, basketDetail.getId());
			ps.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Xóa sản phẩm khỏi giỏ hàng
	public boolean deleteBasketDetail(BasketDetail basketDetail) {
		String sql = "DELETE FROM `basket_details` WHERE `id`=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, basketDetail.getId());
			ps.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	// Lấy các sản phẩm thuộc cùng 1 giỏ hàng
	public ArrayList<BasketDetail> getBasketDetailByBasketId(int basketId){
		ArrayList<BasketDetail> listBasketDetails = new ArrayList<BasketDetail>();
		String sql = "SELECT * FROM `basket_details` WHERE `basket_id`=?";
		try {
                    System.out.println("sao null");
                    System.out.println(con);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, basketId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				int product_id = rs.getInt(2);
				int quantity = rs.getInt(3);
				Product product = productDAO.getProductById(product_id);
				BasketDetail basketDetail = new BasketDetail(id, product, quantity);
				listBasketDetails.add(basketDetail);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listBasketDetails;
	}
        public static void main(String[] args) {
            BasketDetailDAO dao = new BasketDetailDAO();
            
    }
}
