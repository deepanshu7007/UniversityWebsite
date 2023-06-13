package com.uni.web.dao;

import com.uni.web.entities.User;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		try {
			con.setAutoCommit(true);
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		this.con = con;
	}
	// method to insert user to data base;
	public boolean updateProfilePic(String fileName,String uid)
	{
		boolean f = false;
		try {
			String query = "UPDATE USER_DETAILS SET PROFILE_PICTURE=? WHERE UID=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,fileName);
			pstmt.setString(2,uid);
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean saveUser(User user) {
		
     

      
		boolean f = false;
		try {
			String query = "INSERT INTO USER_DETAILS(FIRST_NAME,LAST_NAME,UID,PASSWORD,DATE_OF_BIRTH,ABOUT,EMAIL,ROLE) values (?,?,?,?,?,?,?,?)";
			String query1="INSERT INTO BASIC_DETAIL(UID) VALUES(?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(2, user.getLastName());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getPassword());
			pstmt.setDate(5, user.getDateOfBirth());
			pstmt.setString(6, user.getAbout());
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getRole());
			pstmt.executeUpdate();
			pstmt = this.con.prepareStatement(query1);
			pstmt.setString(1,user.getUserName());
			pstmt.executeUpdate();
			f = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}
	public User getActiveUser(String uid)
	{
	User user = null;
		try {
			String query = "SELECT * FROM USER_DETAILS WHERE UID=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			System.out.println(uid);
			ResultSet set = pstmt.executeQuery();
			set.next();
				user = new User();
				user.setFirstName(set.getString("FIRST_NAME"));
				user.setLastName(set.getString("LAST_NAME"));
				user.setEmail(set.getString("EMAIL"));
				user.setUserName(set.getString("UID"));
				user.setVisible(set.getBoolean("VIEW"));
				user.setDateOfBirth(set.getDate("DATE_OF_BIRTH"));
				user.setRole(set.getString("ROLE"));
				user.setAbout(set.getString("ABOUT"));
				user.setProfilePic(set.getString("PROFILE_PICTURE"));
				
				
user.setEnabled(set.getBoolean("ENABLED"));
		}
	catch(Exception exp)
		{
			exp.printStackTrace();
	}
	return user;
	
	}
public ArrayList<User> getAllUsers()
{

	ArrayList<User> listOfUsers = new ArrayList<User>();
User user = null;
		try {
			String query = "SELECT * FROM USER_DETAILS WHERE VIEW=TRUE";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				user = new User();
				user.setFirstName(set.getString("FIRST_NAME"));
				user.setLastName(set.getString("LAST_NAME"));
				user.setEmail(set.getString("EMAIL"));
				user.setUserName(set.getString("UID"));
				user.setVisible(set.getBoolean("VIEW"));
				user.setDateOfBirth(set.getDate("DATE_OF_BIRTH"));
				user.setRole(set.getString("ROLE"));
				user.setAbout(set.getString("ABOUT"));
				user.setProfilePic(set.getString("PROFILE_PICTURE"));
				user.setEnabled(set.getBoolean("ENABLED"));
				
				
			listOfUsers.add(user);
			
			}
			
		}
	catch(Exception exp)
		{
			exp.printStackTrace();
	}
	return listOfUsers;
}
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "SELECT * FROM USER_DETAILS WHERE UID=? AND PASSWORD  = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				user = new User();
				user.setFirstName(set.getString("FIRST_NAME"));
				user.setLastName(set.getString("LAST_NAME"));
				user.setEmail(set.getString("EMAIL"));
				user.setUserName(set.getString("UID"));
				user.setVisible(set.getBoolean("VIEW"));
				user.setDateOfBirth(set.getDate("DATE_OF_BIRTH"));
				user.setRole(set.getString("ROLE"));
				user.setAbout(set.getString("ABOUT"));
				user.setProfilePic(set.getString("PROFILE_PICTURE"));
				
			}

		}
	catch(Exception exp)
		{
			exp.printStackTrace();
	}
	return user;	
}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "UPDATE USER_DETAILS SET FIRST_NAME=?,LAST_NAME=?,DATE_OF_BIRTH=?,ABOUT=? WHERE UID=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(2, user.getLastName());
			
			pstmt.setDate(3, user.getDateOfBirth());
//		pstmt.setString(8,user.getProfilePic());
			pstmt.setString(4, user.getAbout());
			
			pstmt.setString(5, user.getUserName());
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateWorkDetail(String workDetail,String uid) {
		PreparedStatement pstmt;
		try {
			
			pstmt = this.con.prepareStatement("update BASIC_DETAIL set workdetail=? where uid=?");
			pstmt.setString(1, workDetail);
			pstmt.setString(2, uid);
			System.out.print(pstmt.executeUpdate());
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}
}
