/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.userdetail.Conference;
import com.uni.web.entities.userdetail.Publication;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PublicationDao {

	Connection con;

	public PublicationDao(Connection con) {
		this.con = con;
	}

	public boolean deletePublication(String uid,String doiNumber)
{
	System.out.println(uid+"DOI====>"+doiNumber);
	String query = "DELETE FROM USER_PUBLICATION WHERE DOI_NUMBER=? AND UID=?";
		try {
			PreparedStatement pstmt= con.prepareStatement(query);
			pstmt.setString(2,uid);
			pstmt.setString(1,doiNumber);
			pstmt.executeUpdate();
			System.out.println("");
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
}
	
	
	
	public boolean savePublication(Publication publication) throws SQLException {
		CallableStatement stmt=null;
	
			try{
			System.out.println("This is DAO for publication:");
			stmt = con.prepareCall("{call insert_into_publication(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			System.out.println(publication.getDoiNumber());
			stmt.setString(1, publication.getDoiNumber());
			stmt.setString(2, publication.getTitle());
			stmt.setString(3, publication.getJournalName());
			stmt.setString(4, publication.getAbstract());
			stmt.setString(5, publication.getKeyword());
			stmt.setString(6, publication.getVolumeNumber());
			stmt.setDate(7, publication.getPublicationYear());
			stmt.setString(8, publication.getReference());
			stmt.setString(9, "");
			stmt.setInt(10, publication.getPageNumber());
			stmt.setBoolean(11, publication.getIndexing().get("esi"));
			stmt.setBoolean(12, publication.getIndexing().get("peerpaper"));
			stmt.setBoolean(13, publication.getIndexing().get("scopus"));
			stmt.setBoolean(14, publication.getIndexing().get("sci"));
			stmt.setBoolean(15, publication.getIndexing().get("others"));
			stmt.setInt(16, publication.getCitation());
			stmt.setString(17, publication.getAuthor());
			stmt.setString(18, publication.getCoAuthor_1());
			stmt.setString(19, publication.getCoAuthor_2());
			stmt.setString(20, publication.getCoAuthor_3());
			stmt.setString(21, publication.getCoAuthor_4());
			stmt.setString(22, publication.getCoAuthor_5());
			stmt.setString(23, publication.getCoAuthorName_1());
			stmt.setString(24, publication.getCoAuthorName_2());
			stmt.setString(25, publication.getCoAuthorName_3());
			stmt.setString(26, publication.getCoAuthorName_4());
			stmt.setString(27, publication.getCoAuthorName_5());
			
			stmt.setString(28, publication.getAuthorName());
			stmt.setString(29, publication.getUid());
			stmt.executeUpdate();
			System.out.println("Submitted Successfully");
			System.out.println("successfully inserted publication");
		} catch (SQLException ex) {
			stmt.close();
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

		
		return true;
	}
	
	public ArrayList<Publication> getPublication(String uid)
	{	
		Publication publication=null;
		ArrayList<Publication> publicationList = new ArrayList<Publication>();
		try {
			System.out.println("THIS IS FOR PUBLICATION");
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM USER_PUBLICATION INNER JOIN PUBLICATION ON USER_PUBLICATION.DOI_NUMBER=PUBLICATION.DOI_NUMBER WHERE USER_PUBLICATION.UID=? OR USER_PUBLICATION.AUTHOR=? OR user_publication.COAUTHOR_1=? OR user_publication.COAUTHOR_2=? OR user_publication.COAUTHOR_3=? OR user_publication.COAUTHOR_4=? OR user_publication.COAUTHOR_5=?");
			pstmt.setString(1,uid);
			pstmt.setString(2,uid);
			pstmt.setString(3,uid);
			pstmt.setString(4,uid);
			pstmt.setString(5,uid);
			pstmt.setString(6,uid);
			pstmt.setString(7,uid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				publication = new Publication();
				publication.setDoiNumber(rs.getString("DOI_NUMBER"));
				publication.setJournalName(rs.getString("JOURNAL_NAME"));
				publication.setTitle(rs.getString("TITLE"));
				publication.setCitation(rs.getInt("CITATION_NO"));
				publication.setVolumeNumber(rs.getString("VOLUME_NUMBER"));
				publication.setAuthor(rs.getString("AUTHOR"));
				publication.setAuthorName(rs.getString("AUTHOR_NAME"));
				publication.setESI(rs.getBoolean("ESI"));
				publication.setSCI(rs.getBoolean("SCI"));
				publication.setPeerpaper(rs.getBoolean("PEERPAPER"));
				publication.setOther(rs.getBoolean("OTHER"));
				publication.setScopus(rs.getBoolean("SCOPUS"));
				publicationList.add(publication);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	return publicationList;
	}
}
