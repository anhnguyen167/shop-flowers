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

public class BasketDAO extends DAOConnector {

    private Connection con;
    private BasketDetailDAO basketDetailDAO;

    public BasketDAO() {
        getInstance();
        con = connectDB.connectDB();
        basketDetailDAO = new BasketDetailDAO();
    }

    // Thêm mới 1 giỏ hàng
    public boolean insertBasket(Basket basket) {
        String sql = "INSERT INTO `baskets`(`user_id`, `booking_date`, `total`, `address`, `state`) VALUES (?,?,?,?,?)";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = basket.getBooking_date().toString();
            java.util.Date utilDate = sdf.parse(date);
            java.sql.Date sqlDate = new Date(utilDate.getTime());
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println(sqlDate);
            ps.setInt(1, basket.getUser().getId());
            ps.setDate(2, sqlDate);
            ps.setInt(3, basket.getTotal());
            ps.setString(4, basket.getAddress());
            ps.setInt(5, basket.getState());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public int getLastId(){
        int last_id = 0;
        String sql = "SELECT MAX(id) FROM `baskets`";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                last_id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return last_id;
    }
    public Basket getLastBasket(int last_id) {
        Basket basket = null;
        String sql = "SELECT * FROM `baskets` WHERE `id`=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, last_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                int user_id = rs.getInt(2);
                Date booking_date = rs.getDate(3);
                int total = rs.getInt(4);
                String address = rs.getString(5);
                int state = rs.getInt(6);
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserById(user_id);
                BasketDetailDAO basketDetailDAO = new BasketDetailDAO();
                ArrayList<BasketDetail> listBasketDetails = basketDetailDAO.getBasketDetailByBasketId(id);
                basket = new Basket(id, user, booking_date, listBasketDetails, total,state, address);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return basket;
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
            return true;
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
            if (rs.next()) {
                int id = rs.getInt(1);

                ArrayList<BasketDetail> listBasketDetail = basketDetailDAO.getBasketDetailByBasketId(id);
                //basket = new Basket(id, user, rs.getDate(3), listBasketDetail, rs.getInt(4));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return basket;
    }

    public static ArrayList<Basket> getAllBasket() {
        Connection con = connectDB.connectDB();
        ArrayList<Basket> listBasket = new ArrayList<Basket>();
        String sql = "SELECT * FROM `baskets` WHERE state=1";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int user_id = rs.getInt(2);
                Date booking_date = rs.getDate(3);
                int total = rs.getInt(4);
                String address = rs.getString(5);
                int state = rs.getInt(6);
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserById(user_id);
                BasketDetailDAO basketDetailDAO = new BasketDetailDAO();
                ArrayList<BasketDetail> listBasketDetails = basketDetailDAO.getBasketDetailByBasketId(id);
                Basket basket = new Basket(user, booking_date, listBasketDetails, total,state, address);
                listBasket.add(basket);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return listBasket;

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
