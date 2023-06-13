/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets.userdetail;

import com.uni.web.dao.ConferenceDao;
import com.uni.web.dao.PublicationDao;
import com.uni.web.entities.User;
import com.uni.web.entities.userdetail.Conference;
import com.uni.web.entities.userdetail.Publication;
import com.uni.web.helper.ConnectionProvider;
import com.uni.web.servlets.AdminServlets.UpdateUserServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Deepanshu
 */
@MultipartConfig
public class PublicationServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and
	 * <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		String uid = user.getUserName();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Publication publication = new Publication();
		publication.setTitle((String) request.getParameter("publication_name"));
		publication.setAuthor((String) request.getParameter("publication_author"));
		publication.setJournalName((String) request.getParameter("publication_journal"));
		String dateString = ((String) request.getParameter("publication_year"));
		java.util.Date utilDate;
		try {
			utilDate = format.parse(dateString);
			publication.setPublicationYear(new java.sql.Date(utilDate.getTime()));
		} catch (ParseException ex) {
			Logger.getLogger(PublicationServlet.class.getName()).log(Level.SEVERE, null, ex);
		}
		HashMap<String,Boolean> hm = new HashMap();
		hm.put("esi", Boolean.FALSE);
		hm.put("peerpaper", Boolean.FALSE);
		hm.put("scopus", Boolean.FALSE);
		hm.put("others", Boolean.FALSE);
		hm.put("sci", Boolean.FALSE);
		String indexing[] = request.getParameterValues("indexing");
		for(String index: indexing)
		{
			hm.put(index, Boolean.TRUE);
		}
		publication.setIndexing(hm);
		publication.setUid(uid);
		publication.setVolumeNumber((String) request.getParameter("publication_volume"));
		publication.setPublicationYear(Date.valueOf(request.getParameter("publication_year")));	
		publication.setDoiNumber((String) request.getParameter("publication_doi"));
		publication.setImpactFactor(Double.parseDouble(request.getParameter("publication_impact")));
		publication.setPublicationLink((String) request.getParameter("publication_link"));
		publication.setCitation(Integer.parseInt(request.getParameter("publication_citation")));
		publication.setESI(Boolean.parseBoolean((String) request.getParameter("esi")));
		publication.setOther(Boolean.parseBoolean((String) request.getParameter("others")));
		publication.setSCI(Boolean.parseBoolean((String) request.getParameter("sci")));
		publication.setPeerpaper(Boolean.parseBoolean((String) request.getParameter("peerpaper")));
		publication.setScopus(Boolean.parseBoolean((String) request.getParameter("scopus")));
		publication.setAuthor(request.getParameter("publication_author_UID"));
		publication.setAuthorName(request.getParameter("author_NAME"));
		publication.setCoAuthor_1(request.getParameter("publication_coauthor1_UID"));
		publication.setCoAuthor_2(request.getParameter("publication_coauthor2_UID"));
		publication.setCoAuthor_3(request.getParameter("publication_coauthor3_UID"));
		publication.setCoAuthor_4(request.getParameter("publication_coauthor4_UID"));
		publication.setCoAuthor_5(request.getParameter("publication_coauthor5_UID"));
		
		publication.setCoAuthorName_1(request.getParameter("publication_coauthor1_NAME"));
		publication.setCoAuthorName_2(request.getParameter("publication_coauthor2_NAME"));
		publication.setCoAuthorName_3(request.getParameter("publication_coauthor3_NAME"));
		publication.setCoAuthorName_4(request.getParameter("publication_coauthor4_NAME"));
		publication.setCoAuthorName_5(request.getParameter("publication_coauthor5_NAME"));
		System.out.println(request.getParameter("publication_coauthor1_NAME"));

	PublicationDao pd = new PublicationDao(ConnectionProvider.getConnection());

		try {
			pd.savePublication (publication);
		} catch (SQLException ex) {
			Logger.getLogger(PublicationServlet.class.getName()).log(Level.SEVERE, null, ex);
		}

}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
