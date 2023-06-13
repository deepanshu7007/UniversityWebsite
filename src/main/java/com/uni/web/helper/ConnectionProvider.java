package com.uni.web.helper;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Deepanshu
 */
public class ConnectionProvider {

	private static Connection con;
	private  String driverName;
	private  String connectionUrl;
	private  String user;
	private  String password;
	private  String database;
	public ConnectionProvider()
	{
		driverName="com.mysql.cj.jdbc.Driver";
		connectionUrl = "jdbc:mysql://localhost:3306/";
		database = "mydb";
		user = "root";
		password = "root";
	}

	public static Connection getCon() {
		return con;
	}

	
	public  String getDriverName() {
		return driverName;
	}

	public  void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public  String getConnectionUrl() {
		return connectionUrl;
	}

	public void setConnectionUrl(String connectionUrl) {
		this.connectionUrl = connectionUrl;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}
	public static Connection getConnection() {
		try {
			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				//creating a connection
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		}
		return con;
	}
}
