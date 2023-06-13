/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.uni.web.dao.UserDao;
import com.uni.web.entities.User;
import com.uni.web.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Deepanshu
 */
@MultipartConfig

public class RegisterServlet extends HttpServlet {

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
		PrintWriter pw = response.getWriter();
		String first_name = (request.getParameter("firstName"));
		String last_name = (request.getParameter("lastName"));
		String e_mail = (request.getParameter("eMail"));
		String u_id = (request.getParameter("uId"));
		String password = (request.getParameter("passWord"));
		String role = (request.getParameter("role"));
		Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
		String about = (request.getParameter("about"));
		User user = new User(first_name, last_name, e_mail, u_id, password, dateOfBirth, about,role);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		if (dao.saveUser(user)) {
			pw.println("Successful");
		} else {
			pw.println("Unsuccessful");
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
