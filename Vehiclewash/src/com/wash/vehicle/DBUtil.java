package com.wash.vehicle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBUtil {
	public static Connection getMySqlConnection() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/carwash", "bhagi", "1234");
		return con;
	}

	public static void cleanUp(Statement st, Connection con) {
		try {
			if (st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}