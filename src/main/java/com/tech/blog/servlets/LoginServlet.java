/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.uni.web.dao.UpdateBasicDao;
import com.uni.web.dao.UserDao;
import com.uni.web.entities.BasicDetails;
import com.uni.web.entities.Message;
import com.uni.web.entities.User;
import com.uni.web.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepanshu
 */
public class LoginServlet extends HttpServlet {

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
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet LoginServlet</title>");			
			out.println("</head>");
			out.println("<body>");
			String uid = request.getParameter("uid");
				String password = request.getParameter("password");
				System.out.println(uid);
				System.out.println(password);
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				User u = dao.getUserByEmailAndPassword(uid, password);
				if(u == null)
				{
//					out.println("Invalid Details");
					Message msg = new Message("Invalid Details ! try with other","error","alert-danger");
					HttpSession s = request.getSession();
					s.setAttribute("msg", msg);
					response.sendRedirect("LoginPage.jsp");
				}else
				{
					UpdateBasicDao basicDao = new UpdateBasicDao(ConnectionProvider.getConnection());
//					BasicDetails bd = basicDao.GetBasicProfile(uid);
					HttpSession s = request.getSession();
					s.setAttribute("currentUser", u);
//					s.setAttribute("basicDetails",bd);
					response.sendRedirect("ProfilePage.jsp");
				}
			out.println("</body>");
			out.println("</html>");
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
