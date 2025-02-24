/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.Driver;
import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Moham
 */


public class DriverDAO {
    
    public boolean addDriver(Driver driver) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "INSERT INTO drivers (user_id, name, license_number, contact, available) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, driver.getUserId());
            ps.setString(2, driver.getName());
            ps.setString(3, driver.getLicenseNumber());
            ps.setString(4, driver.getContact());
            ps.setBoolean(5, driver.isAvailable());
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM drivers";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setUserId(rs.getInt("user_id"));
                driver.setName(rs.getString("name"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setContact(rs.getString("contact"));
                driver.setAvailable(rs.getBoolean("available"));
                drivers.add(driver);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }
    
    public boolean updateDriver(Driver driver) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE drivers SET name=?, license_number=?, contact=?, available=? WHERE driver_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getLicenseNumber());
            ps.setString(3, driver.getContact());
            ps.setBoolean(4, driver.isAvailable());
            ps.setInt(5, driver.getDriverId());
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean deleteDriver(int driverId) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM drivers WHERE driver_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, driverId);
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean updateDriverAvailability(int driverId, boolean available) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE drivers SET available=? WHERE driver_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setBoolean(1, available);
            ps.setInt(2, driverId);
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // Retrieve driver by driver_id
    public Driver getDriverByUserId(int userId) {
        Driver driver = null;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM drivers WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setUserId(rs.getInt("user_id"));
                driver.setName(rs.getString("name"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setContact(rs.getString("contact"));
                driver.setAvailable(rs.getBoolean("available"));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return driver;
    }
    
   
    public List<Driver> getAvailableDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM drivers WHERE available = true";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setUserId(rs.getInt("user_id"));
                driver.setName(rs.getString("name"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setContact(rs.getString("contact"));
                driver.setAvailable(rs.getBoolean("available"));
                drivers.add(driver);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }
}
