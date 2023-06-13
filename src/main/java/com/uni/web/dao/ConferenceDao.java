/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.userdetail.Conference;
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
public class ConferenceDao {

	Connection con;

	public ConferenceDao(Connection con) {
		this.con = con;
		
	}
public boolean deleteConference(String uid,String conferenceAlias)
{
	System.out.println(uid+"====>"+conferenceAlias);
	String query = "DELETE FROM CONFERENCE_ATTENDED WHERE UID=? AND CONFERENCE_ALIAS=?";
		try {
			PreparedStatement pstmt= con.prepareStatement(query);
			pstmt.setString(1,uid);
			pstmt.setString(2,conferenceAlias);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
}
	public boolean saveConference(Conference  conference) throws SQLException {
		CallableStatement stmt=null;
		try {
			
			stmt = con.prepareCall("{call insert_into_conference(?,?,?,?,?,?,?,?,?,?,?,?)}");
			
				System.out.println("This is DAO:"+conference.getConferenceAlias());
			System.out.println(conference.getConferenceUID());
			stmt.setString(1, conference.getConferenceAlias());
			stmt.setString(2, conference.getConferenceName());
			stmt.setString(3, conference.getConferenceLocation());
			stmt.setDate(4, conference.getConferenceDate());
			stmt.setString(5, conference.getConferenceTopic());
			stmt.setString(6, conference.getConferenceOrganiser());
			stmt.setString(7, conference.getConferenceAbstract());
			stmt.setString(8, conference.getConferencePoster());
			stmt.setString(9, "");
			stmt.setString(10, conference.getConferenceMode());
			stmt.setString(11, conference.getConferenceOther());
			stmt.setString(12, conference.getConferenceUID());
			stmt.executeUpdate();
			System.out.println("Submitted Successfully");
			System.out.println("successfully inserted conference");
		} catch (SQLException ex) {
			stmt.close();
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

		
		return true;
	}
	
	public ArrayList<Conference> getConference(String uid)
	{	
		Conference conference=null;
		ArrayList<Conference> conferenceList = new ArrayList<Conference>();
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM CONFERENCE_ATTENDED INNER JOIN CONFERENCE ON CONFERENCE_ATTENDED.CONFERENCE_ALIAS=CONFERENCE.CONFERENCE_ALIAS WHERE CONFERENCE_ATTENDED.UID=?");
			pstmt.setString(1,uid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				conference = new Conference();
				conference.setConferenceAlias(rs.getString("CONFERENCE_ALIAS"));
				conference.setConferenceUID(rs.getString("UID"));
				conference.setConferenceMode(rs.getString("CONFERENCE_MODE"));
				conference.setConferenceName(rs.getString("CONFERENCE_NAME"));
				conference.setConferenceLocation(rs.getString("CONFERENCE_LOCATION"));
				conference.setConferenceDate(rs.getDate("CONFERENCE_DATE"));
				conference.setConferenceOther(rs.getString("OTHER_DETAIL"));
				conference.setConferenceCertificate(rs.getString("CERTIFICATE_LINK"));
				conference.setConferencePoster(rs.getString("POSTER_LINK"));
				conference.setConferenceOrganiser(rs.getString("ORGANISER"));
				conference.setConferenceTopic(rs.getString("TOPIC"));
				conferenceList.add(conference);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	return conferenceList;
	}
}
