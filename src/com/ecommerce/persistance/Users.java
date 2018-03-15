package com.ecommerce.persistance;

import java.sql.*;
import java.util.*;

import com.ecommerce.models.RegistrationBean;

public class Users {
	private static PreparedStatement statement;
	private static ConnectionDB connectionDB = new ConnectionDB();
	private static ResultSet resultSet;
	private static ArrayList<RegistrationBean> allUserArray = new ArrayList<>();
	
	public Users() {
		
	}
	
	public static ArrayList<RegistrationBean> allUser(){
		String query = "SELECT userlogin.email, userlogin.username, userlogin.password, users.FirstName, users.LastName, users.DOB, users.Gender, users.Mobile, users.Address FROM userlogin INNER JOIN users ON userlogin.username=users.username";
		try {
			Connection connection = connectionDB.getConnection();
			statement = connection.prepareStatement(query);
			resultSet = statement.executeQuery();
			
			while (resultSet.next()) {
				allUserArray.add(new RegistrationBean(resultSet.getString("email"), resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("FirstName"), resultSet.getString("LastName"), resultSet.getString("DOB"), resultSet.getString("Gender"), resultSet.getString("Mobile"), resultSet.getString("Address")));
			}			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allUserArray;
	}
}
