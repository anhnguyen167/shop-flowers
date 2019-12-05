package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOConnector {
	public static Connection con;
	public static void getInstance() {
		if(con == null) {
			String dbName = "shop";
			String username = "root";
			String password = "";
			String className = "com.mysql.jdbc.Driver";
			String urlConnection = "jdbc:mysql://localhost:3306/" + dbName + "?useUniCode=yes&characterEncoding=UTF-8";
			try {
				Class.forName(className);
				con = DriverManager.getConnection(urlConnection, username, password);
				System.out.println("Connect successfully!");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	public static void close() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		getInstance();
	}
}
