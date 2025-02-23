/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.Vehicle;
import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Moham
 */


public class VehicleDAO {
    public boolean addVehicle(Vehicle vehicle) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "INSERT INTO vehicles (license_plate, model, brand, status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, vehicle.getLicensePlate());
            ps.setString(2, vehicle.getModel());
            ps.setString(3, vehicle.getBrand());
            ps.setString(4, vehicle.getStatus());
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM vehicles";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(rs.getInt("vehicle_id"));
                vehicle.setLicensePlate(rs.getString("license_plate"));
                vehicle.setModel(rs.getString("model"));
                vehicle.setBrand(rs.getString("brand"));
                vehicle.setStatus(rs.getString("status"));
                vehicles.add(vehicle);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }
    
    public boolean updateVehicle(Vehicle vehicle) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE vehicles SET license_plate=?, model=?, brand=?, status=? WHERE vehicle_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, vehicle.getLicensePlate());
            ps.setString(2, vehicle.getModel());
            ps.setString(3, vehicle.getBrand());
            ps.setString(4, vehicle.getStatus());
            ps.setInt(5, vehicle.getVehicleId());
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean deleteVehicle(int vehicleId) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM vehicles WHERE vehicle_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, vehicleId);
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
