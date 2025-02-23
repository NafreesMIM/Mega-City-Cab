/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import models.User;
import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Moham
 */



public class UserDAO {

    // Updated authenticate method using join with roles table.
    public User authenticate(String username, String password) {
        User user = null;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT u.id, u.username, u.password, u.name, u.address, u.telephone, u.nic, r.role_name as role " +
                         "FROM users u JOIN roles r ON u.role_id = r.role_id " +
                         "WHERE u.username=? AND u.password=?";
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
                user.setRole(rs.getString("role")); // role fetched from roles table
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    // Updated register method. This example assumes you first lookup the role_id for the given role name.
    public boolean register(User user) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            // First, get role_id based on the role name provided in the user model
            String roleQuery = "SELECT role_id FROM roles WHERE role_name = ?";
            PreparedStatement roleStmt = con.prepareStatement(roleQuery);
            roleStmt.setString(1, user.getRole());
            ResultSet roleRs = roleStmt.executeQuery();
            if (roleRs.next()) {
                int roleId = roleRs.getInt("role_id");
                // Insert into users table using role_id
                String sql = "INSERT INTO users (username, password, name, address, telephone, nic, role_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getName());
                ps.setString(4, user.getAddress());
                ps.setString(5, user.getTelephone());
                ps.setString(6, user.getNic());
                ps.setInt(7, roleId);
                result = ps.executeUpdate() > 0;
            } else {
                System.out.println("Role not found for: " + user.getRole());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // Update a user's password.
    public boolean updatePassword(int userId, String newPassword) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE users SET password = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            result = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // Retrieve a single user by id.
    public User getUserById(int id) {
        User user = null;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT u.id, u.username, u.password, u.name, u.address, u.telephone, u.nic, r.role_name as role " +
                         "FROM users u JOIN roles r ON u.role_id = r.role_id WHERE u.id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
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
                user.setRole(rs.getString("role"));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    // Retrieve all users.
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT u.id, u.username, u.password, u.name, u.address, u.telephone, u.nic, r.role_name as role " +
                         "FROM users u JOIN roles r ON u.role_id = r.role_id";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setTelephone(rs.getString("telephone"));
                user.setNic(rs.getString("nic"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateProfile(User user) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public User getAvailableDriver() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
