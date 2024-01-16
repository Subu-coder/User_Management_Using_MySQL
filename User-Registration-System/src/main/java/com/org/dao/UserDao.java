package com.org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.dto.Admin;
import com.org.dto.User;
import com.org.utilities.HelperClass;

public class UserDao {
	PreparedStatement prst;
	
	private static UserDao userdao=null;
	private UserDao() {
		
	}
	
	public void SaveDetails(Object obj, String person) {
		Connection con = HelperClass.getDBConnection();
		try {
			if(person.equals("User")) {
				prst = con.prepareStatement("insert into user(name,age,mobile,gender,email,password) values(?,?,?,?,?,?)");
				User user = (User) obj;
				prst.setString(1, user.getName());
				prst.setInt(2, user.getAge());
				prst.setLong(3, user.getMobile());
				prst.setString(4, user.getGender());
				prst.setString(5, user.getEmail());
				prst.setString(6, user.getPassword());
			} else {
				prst = con.prepareStatement("insert into admin(name,age,mobile,email,password) values(?,?,?,?,?)");
				Admin admin = (Admin) obj;
				prst.setString(1, admin.getName());
				prst.setInt(2, admin.getAge());
				prst.setLong(3, admin.getMobile());
				prst.setString(4,admin.getEmail());
				prst.setString(5, admin.getPassword());
			}
			prst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<User> fetchAllUsers() {

		Connection con = HelperClass.getDBConnection();
		User user=null;
		List<User> userlist = new ArrayList<User>();
		try {
			prst = con.prepareStatement("select * from user");

			ResultSet rs = prst.executeQuery();
			
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setAge(rs.getInt("age"));
				user.setMobile(rs.getLong("mobile"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				userlist.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userlist;
	}

	public Admin fetchAdminByMail(String mail) {
		Admin admin=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = HelperClass.getDBConnection();
			prst = con.prepareStatement("select * from admin where email=?");
			prst.setString(1, mail);
			ResultSet rs = prst.executeQuery();
			rs.next();
			admin = new Admin();
			admin.setId(rs.getInt("id"));
			admin.setName(rs.getString("name"));
			admin.setAge(rs.getInt("age"));
			admin.setMobile(rs.getLong("mobile"));
			admin.setEmail(rs.getString("email"));
			admin.setPassword(rs.getString("password"));
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return admin;
	}

	public void updateUserById(Object obj, String person, int id) {
		Connection con = HelperClass.getDBConnection();
		
		try {
			if(person.equals("user")) {
				prst = con.prepareStatement("UPDATE `user` SET `name` = ?, `age` = ?, `mobile` = ?, `gender` = ?, `email` = ? WHERE (`id` = ?)");
				User user = (User) obj;
				prst.setString(1, user.getName());
				prst.setInt(2, user.getAge());
				prst.setLong(3, user.getMobile());
				prst.setString(4, user.getGender());
				prst.setString(5, user.getEmail());
				prst.setInt(6, id);
				System.out.println(user.getEmail());
			} if(person.equals("admin")) {
				prst = con.prepareStatement("UPDATE `admin` SET `name` = ?, `age` = ?, `mobile` = ?, `email` = ?, `password` = ? WHERE (`id` = ?)");
				Admin admin = (Admin) obj;
				prst.setString(1, admin.getName());
				prst.setInt(2, admin.getAge());
				prst.setLong(3, admin.getMobile());
				prst.setString(4,admin.getEmail());
				prst.setString(5, admin.getPassword());
				prst.setInt(6, id);
			}
			prst.executeUpdate();
		}  catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteUserById(int id) {
		Connection con = HelperClass.getDBConnection();
		User user = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			prst = con.prepareStatement("delete from user where id=?");
			prst.setInt(1, id);
			prst.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public Admin fetchAdminByEmailAndPassword(String email, String password) {
		Connection con = HelperClass.getDBConnection();
		Admin admin = null;
		try {
			prst = con.prepareStatement("select * from admin where email=? and password=?");

			prst.setString(1, email);
			prst.setString(2, password);

			ResultSet rs = prst.executeQuery();

			boolean isAvail = rs.next();

			if (isAvail) {

				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setName(rs.getString("name"));
				admin.setAge(rs.getInt("age"));
				admin.setMobile(rs.getLong("mobile"));
				admin.setEmail(rs.getString("email"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
	
	public User fetchUserById(int id) {

		User user=null;
		try {
			System.out.println(id);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = HelperClass.getDBConnection();
			prst = con.prepareStatement("select * from user where id=?");
			prst.setInt(1, id);
			ResultSet rs = prst.executeQuery();
			rs.next();
			user = new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setAge(rs.getInt("age"));
			user.setGender(rs.getString("gender"));
			user.setMobile(rs.getLong("mobile"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		return user;
	}
	
	public static UserDao getUserDao() {
		if(userdao==null) {
			return new UserDao();
		}
		return userdao;
	}
	
}
