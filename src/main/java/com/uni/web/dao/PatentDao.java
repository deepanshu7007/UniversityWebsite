/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.userdetail.Patent;
import com.uni.web.entities.userdetail.Publication;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Deepanshu
 */
public class PatentDao {

	Connection con;

	public PatentDao(Connection con) {
		this.con = con;

	}

	public boolean deletePatent(String uid, String patentId) {
		String query = "DELETE FROM USER_PATENT WHERE UID=? AND PATENT_ID=?";
		System.out.println("patent details " + uid);
		PreparedStatement pstmt;
		try {
			pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, patentId);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(PatentDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}

	public boolean savePatent(Patent patent) throws SQLException {
		CallableStatement stmt = null;
		try {

			System.out.println("This is for patent:"+patent.getGrandDate());
			stmt = con.prepareCall("{call insert_into_patent(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			System.out.println("This is patent" + patent);
			System.out.println(patent.getUid());
			stmt.setString(1, patent.getPatentId());
			stmt.setString(2, patent.getPatentTitle());
			stmt.setDate(3, patent.getPatentDate());
			stmt.setDate(4, patent.getPublishDate());
			stmt.setDate(5, patent.getGrandDate());
			stmt.setString(6, patent.getAuthor());
			stmt.setString(7, patent.getAuthorName());
			stmt.setString(8, patent.getCoAuthor1());
			stmt.setString(9, patent.getCoAuthor2());
			stmt.setString(10, patent.getCoAuthor3());
			stmt.setString(11, patent.getCoAuthor4());
			stmt.setString(12, patent.getCoAuthor5());
			stmt.setString(13, patent.getCoAuthor1name());
			stmt.setString(14, patent.getCoAuthor2name());
			stmt.setString(15, patent.getCoAuthor3name());
			stmt.setString(16, patent.getCoAuthor4name());
			stmt.setString(17, patent.getCoAuthor5name());
			stmt.setString(18, patent.getUid());
			stmt.executeUpdate();
			System.out.println("Submitted Successfully");
			System.out.println("successfully inserted patent");
		} catch (SQLException ex) {
			stmt.close();
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

		return true;
	}

	public ArrayList<Patent> getPatent(String uid) {
		Patent patent = null;
		ArrayList<Patent> patentList = new ArrayList<Patent>();
		try {
			System.out.println("THIS IS FOR PATENT");
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM USER_PATENT INNER JOIN PATENT ON PATENT.PATENT_ID=USER_PATENT.PATENT_ID WHERE USER_PATENT.UID=?");
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				patent = new Patent();
				patent.setAuthor(rs.getString("AUTHOR"));
                                System.out.println("<>>>>>><<<<<>>><<<<<<>>><<<<>>>");
				patent.setAuthorName(rs.getString("AUTHOR_NAME"));
				patent.setPatentTitle(rs.getString("TITLE"));
//				patent.setPublishDate(PublishDate);
				patent.setGrandDate(rs.getDate("DATE_OF_GRANTING"));
				patent.setPublishDate(rs.getDate("DATE_OF_PUBLICATIONS"));
				patent.setPatentId(rs.getString("PATENT_ID"));
				patentList.add(patent);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return patentList;
	}
}
