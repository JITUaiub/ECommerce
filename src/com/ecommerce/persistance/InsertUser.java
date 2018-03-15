package com.ecommerce.persistance;

import java.sql.*;

import com.ecommerce.models.RegistrationBean;

public class InsertUser {
	private static PreparedStatement statement;
	private static ConnectionDB connectionDB = new ConnectionDB();
	
	public InsertUser() {
		
	}
	
	public static void insertNewUser(RegistrationBean bean){
		String query = "Insert into users values(?,?,?,?,?,?,?)";
		try {
			Connection connection = connectionDB.getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, bean.getUsername());
			statement.setString(2, bean.getFirstName());
			statement.setString(3, bean.getLastName());
			statement.setString(4, bean.getDob());
			statement.setString(5, bean.getGender());
			statement.setString(6, bean.getMobile());
			statement.setString(7, bean.getAddress());
			
			statement.executeUpdate();
			
			query = "Insert into userlogin values(?,?,?)";
			statement = connection.prepareStatement(query);
			statement.setString(1, bean.getEmail());
			statement.setString(2, bean.getUsername());
			statement.setString(3, bean.getPassword());
			
			statement.executeUpdate();
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
