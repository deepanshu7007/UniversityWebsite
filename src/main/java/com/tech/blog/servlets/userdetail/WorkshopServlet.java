package com.tech.blog.servlets.userdetail;
import com.uni.web.dao.WorkshopDao;
import com.uni.web.entities.User;
import com.uni.web.entities.userdetail.Workshop;
import com.uni.web.helper.ConnectionProvider;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepanshu
 */
@MultipartConfig
public class WorkshopServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		try {
HttpSession session=request.getSession();
		User user = (User)session.getAttribute("currentUser");
		String uid = user.getUserName();
			Workshop workshop = new Workshop();
			System.out.println("hhhhhhhh"+(String) request.getParameter("workshop_id"));
				workshop.setWorkshopAlias((String)request.getParameter("workshop_id"));
				workshop.setWorkshopName((String)request.getParameter("workshop_name"));
				workshop.setWorkshopDate(Date.valueOf(request.getParameter("workshop_date")));
				workshop.setWorkshopLocation((String)request.getParameter("workshop_location"));
				workshop.setWorkshopTopic((String)request.getParameter("workshop_topic"));
				workshop.setWorkshopOrganiser((String)request.getParameter("workshop_organiser"));
				workshop.setWorkshopSchedule((String)request.getParameter("workshop_schedule"));
				workshop.setWorkshopMaterial((String)request.getParameter("workshop_material"));
				workshop.setWorkshopWebsite((String)request.getParameter("workshop_website"));
				workshop.setWorkshopUID(uid);
			WorkshopDao dao = new WorkshopDao(ConnectionProvider.getConnection());
		dao.saveWorkshop(workshop);
		} catch (SQLException ex) {
			Logger.getLogger(WorkshopServlet.class.getName()).log(Level.SEVERE, null, ex);
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
