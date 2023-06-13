/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.uni.web.servlets.AdminServlets;
import com.uni.web.dao.AdminDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.uni.web.entities.LoginUserData;
import com.uni.web.helper.ConnectionProvider;
@MultipartConfig
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try {

			ArrayList<LoginUserData> listOfUsers = new ArrayList<LoginUserData>();
			// Extract the JSON data from the request
			LoginUserData user=new LoginUserData("",false,false);
			String jsonData = request.getParameter("jsondata");
			System.out.println("this is:"+jsonData);
			JSONArray array = new JSONArray(jsonData);
			for (int i = 0; i < array.length(); i++) {

				// store each object in JSONObject  
				JSONObject explrObject = array.getJSONObject(i);

				// get field value from JSONObject using get() method  
				user = new LoginUserData((String)explrObject.get("uid"),(boolean)explrObject.get("action"),(boolean)explrObject.get("viewData"));
				listOfUsers.add(user);
			}
			AdminDao adminUpdate = new AdminDao(new ConnectionProvider().getConnection());
			if(adminUpdate.updateAdmin(listOfUsers))
			{
				System.out.println("ALL USERS ARE UPDATED");
			}else
			{
				System.out.println("SOMETHING WENT WRONG");
			}
		} catch (JSONException ex) {
			Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
