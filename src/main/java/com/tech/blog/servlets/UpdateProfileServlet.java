/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.uni.web.dao.UserDao;
import com.uni.web.entities.User;
import com.uni.web.helper.ConnectionProvider;
import com.uni.web.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Deepanshu
 */
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

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

		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */

			String first_name = (request.getParameter("firstName"));
			String last_name = (request.getParameter("lastName"));
			String e_mail = (request.getParameter("eMail"));
			String u_id = (request.getParameter("uId"));
			String pu_id = (request.getParameter("previousUname"));
			System.out.println(request.getParameter("dateOfBirth")+pu_id);
			Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
			String domain = (request.getParameter("domain"));
			String about = (request.getParameter("about"));
			
			
			
			HttpSession Session = request.getSession();
			User updatedUser = (User) Session.getAttribute("currentUser");
			updatedUser.setAbout(about);
			updatedUser.setUserName(u_id);
			updatedUser.setLastName(last_name);
			updatedUser.setEmail(e_mail);
			updatedUser.setDateOfBirth(dateOfBirth);
			updatedUser.setFirstName(first_name);
			
			User user = new User(first_name, last_name, e_mail, u_id, dateOfBirth, domain, about, pu_id);
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if (dao.updateUser(user)) {
				out.println("Successful");
				
			} else {
				out.println("Unsuccessful");
			}

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
