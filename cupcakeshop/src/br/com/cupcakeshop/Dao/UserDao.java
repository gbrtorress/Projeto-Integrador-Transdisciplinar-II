package br.com.cupcakeshop.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.cupcakeshop.model.User;


public class UserDao{
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	
	
	public boolean saveUser(User user){
        boolean set = false;
        try{
            
            String query = "insert into users(name,email,password) values(?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, user.getName());
           pt.setString(2, user.getEmail());
           pt.setString(3, user.getPassword());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }

	
	
	
	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
					
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				
			}
		} catch (Exception e) {
		
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return user;
	}



	public User userRegister(String name, String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
}
