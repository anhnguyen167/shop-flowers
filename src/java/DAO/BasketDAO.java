package DAO;

import BEAN.Basket;
import BEAN.BasketDetail;
import BEAN.User;
import DB.connectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;



public class BasketDAO extends DAOConnector{
	private Connection con;
	private BasketDetailDAO basketDetailDAO;
	public BasketDAO(){
		getInstance();
		con = connectDB.connectDB();
		basketDetailDAO = new BasketDetailDAO();
	}
	
	// Thêm mới 1 giỏ hàng
	public boolean createBasket(Basket basket) {
		String sql = "INSERT INTO `baskets`(`user_id`, `booking_date`, `total`) VALUES (?, ?, 0)";
		try {   
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String date = "1000-10-10";
                        java.util.Date utilDate = sdf.parse(date);
                        java.sql.Date sqlDate = new Date(utilDate.getTime());
			PreparedStatement ps = con.prepareStatement(sql);
                        System.out.println(sqlDate);
			ps.setInt(1, basket.getUser().getId());
                        ps.setDate(2, sqlDate);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
                } catch (ParseException ex) {
                Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
		return false;
	}
	
	
	// Cập nhật giỏ hàng
	public boolean updateBasket(Basket basket) {
		String sql = "UPDATE `baskets` SET `booking_date`=?,`total`=? WHERE `id`=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDate(1, (Date) basket.getBooking_date());
			ps.setInt(2, basket.getTotal());
			ps.setInt(3, basket.getId());
			ps.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Khi bắt đầu mỗi lần đăng nhập mới cần kiểm tra xem giỏ hàng của khách hàng này đã có chưa
	// Nếu có rồi thì booking_date của giỏ hàng sẽ ở dạng 1000-10-10 và trả về giỏ hàng này
	// Nếu chưa có thì tạo một giỏ hàng mới
	public Basket getBasketByUserId(User user) {
		Basket basket = null;
		String sql = "SELECT * FROM `baskets` WHERE `user_id`=? AND `booking_date`='1000-10-10'";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int id = rs.getInt(1);

                                ArrayList<BasketDetail> listBasketDetail = basketDetailDAO.getBasketDetailByBasketId(id);
				basket = new Basket(id, user, rs.getDate(3), listBasketDetail, rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return basket;
	}
        public static void main(String[] args) {
        UserDAO daoU = new UserDAO();
        User user = daoU.getUserById(4);
        BasketDAO dao = new BasketDAO();
        Basket basket = new Basket();
        basket.setUser(user);
        dao.createBasket(basket);
    }
}
