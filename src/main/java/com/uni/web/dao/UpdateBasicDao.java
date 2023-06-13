/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.dao;

import com.uni.web.entities.BasicDetails;
import com.uni.web.entities.Degree;
import com.uni.web.entities.Exam;
import com.uni.web.entities.Supervisor;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Deepanshu
 */
public class UpdateBasicDao {

	private Connection con;
	private String supervisor;
	private String cosupervisor;
	private String thesis;
	private String linktoprofile;

	public UpdateBasicDao(Connection con) {
		this.con = con;
	}

	public boolean UpdateBasicProfile(String uid, String supervisor, String cosupervisor, HashMap<String, Boolean> checkboxSelections, String thesistitle, Date reregdate, Date regdate, Date srfdate, Date prephddate, Date phddate, String linktoprofile) {

		boolean f = false;
		try {
			String query = "UPDATE BASIC_DETAIL SET REGDATE=?,SRFDATE=?,REREGDATE=?,PREPHDDATE=?,PHDDATE=?,SUPERVISOR=?,COSUPERVISOR=?,THESIS=?,LINKTOPROFILE=? WHERE UID=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setDate(1, regdate);
			pstmt.setDate(2, srfdate);
			pstmt.setDate(3, reregdate);
			pstmt.setDate(4, prephddate);
			pstmt.setDate(5, phddate);
			pstmt.setString(6, supervisor);
			pstmt.setString(7, cosupervisor);
			pstmt.setString(8, thesistitle);
			pstmt.setString(9, linktoprofile);
			pstmt.setString(10, uid);
			pstmt.executeUpdate();
			f = true;

			for (String keys : checkboxSelections.keySet()) {
				query = "UPDATE EXAM_QUALIFIED SET `" + keys + "` = ? WHERE (UID = ?)";
				pstmt = con.prepareStatement(query);
				pstmt.setBoolean(1, checkboxSelections.get(keys));
				pstmt.setString(2, uid);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}

	public BasicDetails GetBasicProfile(String uid) {
		BasicDetails obj = null;
		boolean f = false;
		 boolean gate,na,jrf,set,net;
		java.util.Date regDate = null;
		java.util.Date reRegDate = null;
		java.util.Date srfDate = null;
		java.util.Date prePhdDate = null;
		java.util.Date phdDate = null;
		String workdetail = null;
		try {
			System.out.println("======================>" + uid);
			String query = "SELECT  BASIC_DETAIL.*,SUPERVISOR.FIRST_NAME,SUPERVISOR.LAST_NAME,EXAM_QUALIFIED.* FROM BASIC_DETAIL inner join supervisor on BASIC_DETAIL.SUPERVISOR=SUPERVISOR.SUP_ID INNER JOIN EXAM_QUALIFIED ON EXAM_QUALIFIED.UID=BASIC_DETAIL.UID WHERE BASIC_DETAIL.UID=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			{
				phdDate = rs.getDate("PHDDATE");
				prePhdDate = rs.getDate("PREPHDDATE");
				reRegDate = rs.getDate("REREGDATE");
				srfDate = rs.getDate("SRFDATE");
				regDate = rs.getDate("REGDATE");
				supervisor = rs.getString("FIRST_NAME") + " " + rs.getString("LAST_NAME");
				cosupervisor = rs.getString("COSUPERVISOR");
				thesis = rs.getString("THESIS");
				linktoprofile = rs.getString("LINKTOPROFILE");
				workdetail = rs.getString("WORKDETAIL");
				 net = rs.getBoolean("N.E.T.");
				 set = rs.getBoolean("S.E.T.");
				 jrf = rs.getBoolean("J.R.F.");
				 na = rs.getBoolean("NA");
				 gate = rs.getBoolean("G.A.T.E.");

			}
			obj = new BasicDetails(regDate, supervisor, cosupervisor, "", "", thesis, srfDate, reRegDate, prePhdDate, phdDate, linktoprofile, workdetail);
			obj.setGate(gate);
			obj.setSet(set);
			obj.setJrf(jrf);
			obj.setNet(net);
			obj.setNa(na);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obj;
	}

	public ArrayList<Degree> getListOfDegree(String uid) {
		Degree degree = new Degree();
		ArrayList<Degree> listOfDegree = new ArrayList<Degree>();
		String query = "SELECT degree.*,UID FROM mydb.degree LEFT JOIN degree_achieved ON degree.DEGREE_ID = degree_achieved.DEGREE_ID AND degree_ACHIEVED.UID = ?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				degree = new Degree();
				degree.setDegreeId(rs.getInt("DEGREE_ID"));
				degree.setDegreeName(rs.getString("DEGREE_NAME"));
				degree.setDesignation(rs.getString("DESIGNATION"));
				degree.setActive((rs.getString("UID") != null));
				System.out.println("------>" + degree.getActive());
				listOfDegree.add(degree);
			}
		} catch (SQLException ex) {
			Logger.getLogger(UpdateBasicDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return listOfDegree;

	}

	public ArrayList<Exam> getListOfExam(String uid) {
		Exam exam = new Exam();
		ArrayList<Exam> listOfExam = new ArrayList<Exam>();
		String query = "SELECT `N.E.T.`,`S.E.T.`,`G.A.T.E.`,`NA`,`J.R.F.` from exam_qualified where exam_qualified.UID = ?";
		PreparedStatement pstmt;
		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			String[] array = {"S.E.T.", "N.E.T.", "NA", "G.A.T.E.", "J.R.F."};
			List<String> list = Arrays.asList(array);
			Iterator<String> iterator = list.iterator();
			while (rs.next()) {
				exam = new Exam();
				String columnName = iterator.next();
				exam.setExamName(columnName);
				exam.setActive(rs.getBoolean(columnName));
				listOfExam.add(exam);
			}
		} catch (SQLException ex) {
			Logger.getLogger(UpdateBasicDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return listOfExam;
	}

	public ArrayList<Supervisor> getListOfSupervisor(String uid) {
		Supervisor supervisor = new Supervisor();
		ArrayList<Supervisor> listOfSupervisor = new ArrayList<Supervisor>();
		String query = "SELECT supervisor.*,UID FROM mydb.supervisor LEFT JOIN basic_detail ON basic_detail.SUPERVISOR = supervisor.SUP_ID AND BASIC_DETAIL.UID = ?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				supervisor = new Supervisor();
				supervisor.setAffilication(rs.getString("AFFILIATION"));
				supervisor.setContact(rs.getString("CONTACT"));
				supervisor.setFirstName(rs.getString("FIRST_NAME"));
				supervisor.setLastName(rs.getString("LAST_NAME"));
				supervisor.setSUP_ID(rs.getString("SUP_ID"));
				supervisor.setDesignation(rs.getString("DESIGNATION"));
				supervisor.setActive((rs.getString("UID") != null));
				listOfSupervisor.add(supervisor);

				System.out.println("QUERY EXECUTED" + supervisor.getFirstName());
			}
		} catch (SQLException ex) {
			Logger.getLogger(UpdateBasicDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return listOfSupervisor;
	}
}
