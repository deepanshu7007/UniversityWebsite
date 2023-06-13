/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.userdetail.FDP;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FdpDao {

	Connection con;

	public FdpDao(Connection con) {
		this.con = con;
	}

	public boolean deleteFdp(String uid, String fdp_id) {
		System.out.println(uid+"is UID");
		System.out.println(fdp_id+"is FDP id");
		String query = "DELETE FROM FDP_ATTENDED WHERE UID=? AND FDP_ALIAS=?";
		PreparedStatement pstmt;
		try {
			pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, fdp_id);
			pstmt.executeUpdate();
			System.out.println("Something went wrong");
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(FdpDao.class.getName()).log(Level.SEVERE, null, ex);
		return false;
		}
	}

	public boolean saveFdp(FDP fdp) throws SQLException {
		CallableStatement stmt = null;
		try {
			stmt = con.prepareCall("{call insert_into_fdp(?,?,?,?,?,?,?,?,?,?)}");
			stmt.setString(1, fdp.getFdpAlias());
			stmt.setString(2, fdp.getFdpName());
			stmt.setString(3, fdp.getFdpDuration());
			stmt.setString(4, fdp.getFdpLocation());
			stmt.setString(5, fdp.getFdpTheme());
			stmt.setString(6, fdp.getFdpWebsite());
			stmt.setString(7, fdp.getFdpOutcome());
			stmt.setString(8, fdp.getFdpCertificate());
			stmt.setString(9, fdp.getFdpOther());
			stmt.setString(10, fdp.getFdpUid());
			stmt.executeUpdate();
			System.out.println("Submitted Successfully");
			System.out.println("successfully inserted FDP");
		} catch (SQLException ex) {
			stmt.close();
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

		return true;
	}

	public ArrayList<FDP> getFdp(String uid) {
		FDP fdp = null;
		ArrayList<FDP> fdpList = new ArrayList<FDP>();
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM FDP_ATTENDED INNER JOIN FDP ON FDP_ATTENDED.FDP_ALIAS=FDP.FDP_ALIAS WHERE FDP_ATTENDED.UID=?");
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				fdp = new FDP();
				fdp.setFdpAlias(rs.getString("FDP_ALIAS"));
				fdp.setFdpName(rs.getString("FDP_NAME"));
				fdp.setFdpUid(rs.getString("UID"));
				fdp.setFdpCertificate(rs.getString("FDP_CERTIFICATE"));
				fdp.setFdpWebsite(rs.getString("FDP_WEBSITE"));
				fdp.setFdpOther(rs.getString("FDP_OTHER"));
				fdp.setFdpLocation(rs.getString("FDP_LOCATION"));
				fdp.setFdpDuration(rs.getString("FDP_DURATION"));
				fdpList.add(fdp);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ConferenceDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return fdpList;
	}
}
