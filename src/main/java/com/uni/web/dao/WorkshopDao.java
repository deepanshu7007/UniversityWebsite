package com.uni.web.dao;

import com.uni.web.entities.userdetail.Workshop;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class WorkshopDao {

	Connection con;

	public WorkshopDao(Connection con) {
		this.con = con;
	}

	public boolean deleteWorkshop(String uid, String workshop_id) {
		String query = "DELETE FROM WORKSHOP_ATTENDED WHERE UID=? AND WORKSHOP_ALIAS=?";
		System.out.println("workshop details "+uid+workshop_id);
		PreparedStatement pstmt;
		try {
			pstmt = this.con.prepareStatement(query);
			pstmt.setString(2, workshop_id);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(WorkshopDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}

	public boolean saveWorkshop(Workshop workshop) throws SQLException {
		CallableStatement stmt = null;
		try {
			stmt = con.prepareCall("{call insert_into_workshop(?,?,?,?,?,?,?,?,?,?)}");

			stmt.setString(1, workshop.getWorkshopAlias());
			stmt.setString(2, workshop.getWorkshopName());
			stmt.setDate(3, workshop.getWorkshopDate());
			stmt.setString(4, workshop.getWorkshopLocation());
			stmt.setString(5, workshop.getWorkshopTopic());
			stmt.setString(6, workshop.getWorkshopOrganiser());
			stmt.setString(7, workshop.getWorkshopSchedule());
			stmt.setString(8, workshop.getWorkshopMaterial());
			stmt.setString(9, workshop.getWorkshopWebsite());
			stmt.setString(10, workshop.getWorkshopUID());

			stmt.execute();

			System.out.println("Submitted Successfully");
			System.out.println("successfully inserted conference");
		} catch (SQLException ex) {
			stmt.close();
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

		return true;
	}

	public ArrayList<Workshop> getWorkshop(String uid) {
		Workshop workshop = null;
		ArrayList<Workshop> workshopList = new ArrayList<Workshop>();
		try {
			System.out.println("workshop uid"+uid);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM WORKSHOP_ATTENDED INNER JOIN WORKSHOP ON WORKSHOP_ATTENDED.WORKSHOP_ALIAS=WORKSHOP.WORKSHOP_ALIAS WHERE WORKSHOP_ATTENDED.UID=?");
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				workshop = new Workshop();
				workshop.setWorkshopAlias(rs.getString("WORKSHOP_ALIAS"));
				workshop.setWorkshopName(rs.getString("WORKSHOP_NAME"));
				workshop.setWorkshopTopic(rs.getString("WORKSHOP_TOPIC"));
				workshop.setWorkshopOrganiser(rs.getString("WORKSHOP_ORGANISER"));
				workshop.setWorkshopDate(rs.getDate("WORKSHOP_DATE"));
				workshop.setWorkshopUID(uid);
				workshopList.add(workshop);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return workshopList;
	}
}
