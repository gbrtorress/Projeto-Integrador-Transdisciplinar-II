package br.com.cupcakeshop.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	
	public static Connection getConnetion() throws  SQLException, ClassNotFoundException{
		if(connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cupcakeshop", "root", "pass");
			System.out.println("connected");
	}
	return connection;
}

}
