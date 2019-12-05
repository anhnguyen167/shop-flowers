package DAO;

import BEAN.User;
import DB.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import tools.EncryptionSHA1;


public class UserDAO extends DAOConnector{
	private Connection con;
	private EncryptionSHA1 encrypt;
	public UserDAO(){
		getInstance();
		con = connectDB.connectDB();
		encrypt = new EncryptionSHA1();
	}
	
	// Tạo mới người dùng
	public boolean insertUser(User user) {
		String sql = "INSERT INTO `users`(`username`, `password`, `full_name`, `address`, `email`, `phone`, `role`) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, encrypt.encryptPassword(user.getPassword()));
			ps.setString(3, user.getFull_name());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPhone());
			ps.setInt(7, user.getRole());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	
	// Cập nhật thông tin người dùng
	public boolean updateUser(User user) {
		String sql = "UPDATE `users` SET `username`=?,`password`=?,`full_name`=?,`address`=?,`email`=?,`phone`=?,`role`=? WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFull_name());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPhone());
			ps.setInt(7, user.getRole());
			ps.setInt(8, user.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	// Xóa người dùng
	public boolean deleteUser(User user) {
		String sql = "DELETE FROM `usesr` WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	// Kiểm tra đăng nhập
	public User checkUser(String username, String password) {
                User user = null;
		String sql = "SELECT * FROM `users` WHERE username=? AND password=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, encrypt.encryptPassword(password));
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
                            user = new User();
                            user.setId(rs.getInt(1));
                            user.setUsername(rs.getString(2));
                            user.setPassword(rs.getString(3));
                            user.setFull_name(rs.getString(4));
                            user.setAddress(rs.getString(5));
                            user.setEmail(rs.getString(6));
                            user.setPhone(rs.getString(7));
                            user.setRole(rs.getInt(8));
                        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
        
        public boolean checkUserExist(String username){
            String sql = "SELECT id FROM users WHERE username=?";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    return true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
        }
        
        public User getUserById(int id){
            User user = new User();
		String sql = "SELECT * FROM `users` WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
                        user = new User();
			if(rs.next()){
                            user.setId(rs.getInt(1));
                            user.setUsername(rs.getString(2));
                            user.setPassword(rs.getString(3));
                            user.setFull_name(rs.getString(4));
                            user.setAddress(rs.getString(5));
                            user.setEmail(rs.getString(6));
                            user.setPhone(rs.getString(7));
                            user.setRole(rs.getInt(8));
                        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
        }
      
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		User user = new User("admin", "12345", "Nguyen Thi Minh Phuong", "Ha Noi", "phuong@gmail.com", "0389615656", 0);
		if(dao.insertUser(user) == true) {
			System.out.println("OK");
		}
		else {
			System.out.println("Not OK");
		}
	}

}
