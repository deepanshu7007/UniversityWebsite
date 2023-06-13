/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets.userdetail;

import com.uni.web.dao.PatentDao;
import com.uni.web.entities.User;
import com.uni.web.entities.userdetail.Patent;
import com.uni.web.helper.ConnectionProvider;
import com.uni.web.servlets.AdminServlets.UpdateUserServlet;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class PatentServlet extends HttpServlet {

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
		
		try {

			
			System.out.println("hello world Patent");
			Patent patent = new Patent();
			
			
			
				
				System.out.println(((String) request.getParameter("patent_name")));
				patent.setPatentTitle((String) request.getParameter("patent_name"));
				patent.setUid(uid);
				patent.setPatentId((String) request.getParameter("patent_id"));
				patent.setAuthor((String) request.getParameter("patent_author_uid"));
				patent.setAuthorName((String) request.getParameter("patent_author_name"));
				patent.setCoAuthor1((String) request.getParameter("patent_coauthor1_uid"));
				patent.setCoAuthor2((String) request.getParameter("patent_coauthor2_uid"));
				patent.setCoAuthor3((String) request.getParameter("patent_coauthor3_uid"));
				patent.setCoAuthor4((String) request.getParameter("patent_coauthor4_uid"));
				patent.setCoAuthor5((String) request.getParameter("patent_coauthor5_uid"));
				patent.setCoAuthor1name((String) request.getParameter("patent_coauthor1_name"));
				patent.setCoAuthor2name((String) request.getParameter("patent_coauthor2_name"));
				patent.setCoAuthor3name((String) request.getParameter("patent_coauthor3_name"));
				patent.setCoAuthor4name((String) request.getParameter("patent_coauthor4_name"));
				patent.setCoAuthor5name((String) request.getParameter("patent_coauthor5_name"));
				System.out.println("THIS IS A PUBLICATION DATE"+(String)request.getParameter("patent_publish_date"));
				System.out.println("THIS IS A PATENT DATE"+(String)request.getParameter("patent_grant_date"));
				patent.setGrandDate(Date.valueOf(request.getParameter("patent_grant_date")));
				patent.setPublishDate(Date.valueOf(request.getParameter("patent_publish_date")));
				

			

			PatentDao pd = new PatentDao(ConnectionProvider.getConnection());
			pd.savePatent(patent);
		}  catch (SQLException ex) {
			Logger.getLogger(PatentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
