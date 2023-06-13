/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.LoginUserData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDao {
	
	private Connection con;

	public AdminDao(Connection con) {
		this.con = con;
		try {
			this.con.setAutoCommit(false);
		} catch (SQLException ex) {
			Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	

	public boolean updateAdmin(ArrayList<LoginUserData> user) {
		
		try {  
			PreparedStatement ps=con.prepareStatement("update  user_basic_details set VIEW=?,ENABLED=? where uid=?");
			for(LoginUserData allUsers:user)
		{
			System.out.print(allUsers.isView());
			System.out.print(allUsers.isAction());
			System.out.println(allUsers.getUid());
			ps.setBoolean(1, allUsers.isView());
			ps.setBoolean(2, allUsers.isAction());
			ps.setString(3, allUsers.getUid());
			ps.addBatch();
		}
			ps.executeBatch();
			con.commit();
			ps.close();
			
		} catch (SQLException ex) {
			Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
		
		return true;
	}
	
}
