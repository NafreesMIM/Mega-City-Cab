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
            String sql = "INSERT INTO drivers (name, license_number, contact) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getLicenseNumber());
            ps.setString(3, driver.getContact());
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
                driver.setName(rs.getString("name"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setContact(rs.getString("contact"));
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
            String sql = "UPDATE drivers SET name=?, license_number=?, contact=? WHERE driver_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getLicenseNumber());
            ps.setString(3, driver.getContact());
            ps.setInt(4, driver.getDriverId());
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
}
