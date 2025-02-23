/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import models.User;
import Utility.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Moham
 */


public class UserDAO {
    // Updated authenticate method to join with a roles table if needed.
    // If you use a roles table, adjust your query accordingly. For example:
    // "SELECT u.id, u.username, u.password, u.name, u.address, u.telephone, u.nic, r.role_name as role 
    //  FROM users u JOIN roles r ON u.role_id = r.role_id 
    //  WHERE u.username=? AND u.password=?"
    // For simplicity, here we assume your users table has a "role" column.
    public User authenticate(String username, String password) {
        User user = null;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setTelephone(rs.getString("telephone"));
                user.setNic(rs.getString("nic"));
                user.setRole(rs.getString("role")); // Make sure this column is not null
            }
        } catch (SQLException e) {
        }
        return user;
    }
    
    public boolean register(User user) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "INSERT INTO users (username, password, name, address, telephone, nic, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getTelephone());
            ps.setString(6, user.getNic());
            ps.setString(7, user.getRole());
            result = ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return result;
    }
}
