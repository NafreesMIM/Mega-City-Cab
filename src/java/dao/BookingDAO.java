/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.Booking;
import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author Moham
 */


public class BookingDAO {
    
    // When adding a booking, if driverId==0 we set SQL NULL
    public boolean addBooking(Booking booking) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            // Include driver_id in the INSERT statement (it can be NULL)
            String sql = "INSERT INTO bookings (user_id, destination, booking_date, base_fare, driver_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, booking.getUserId());
            ps.setString(2, booking.getDestination());
            ps.setTimestamp(3, new java.sql.Timestamp(booking.getBookingDate().getTime()));
            ps.setDouble(4, booking.getBaseFare());
            if(booking.getDriverId() == 0) {
                ps.setNull(5, java.sql.Types.INTEGER);
            } else {
                ps.setInt(5, booking.getDriverId());
            }
            result = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM bookings WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setDestination(rs.getString("destination"));
                booking.setBookingDate(new Date(rs.getTimestamp("booking_date").getTime()));
                booking.setBaseFare(rs.getDouble("base_fare"));
                int driverId = rs.getInt("driver_id");
                if(rs.wasNull()) { // if driver_id was null, treat as 0 (not assigned)
                    driverId = 0;
                }
                booking.setDriverId(driverId);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM bookings";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setDestination(rs.getString("destination"));
                booking.setBookingDate(new Date(rs.getTimestamp("booking_date").getTime()));
                booking.setBaseFare(rs.getDouble("base_fare"));
                int driverId = rs.getInt("driver_id");
                if(rs.wasNull()){
                    driverId = 0;
                }
                booking.setDriverId(driverId);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public boolean updateBooking(Booking booking) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE bookings SET destination=?, booking_date=?, base_fare=? WHERE booking_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, booking.getDestination());
            ps.setTimestamp(2, new java.sql.Timestamp(booking.getBookingDate().getTime()));
            ps.setDouble(3, booking.getBaseFare());
            ps.setInt(4, booking.getBookingId());
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean deleteBooking(int bookingId) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM bookings WHERE booking_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bookingId);
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // Method to assign a driver to a booking.
    public boolean assignDriver(int bookingId, int driverId) {
        boolean result = false;
        try {
            Connection con = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE bookings SET driver_id=? WHERE booking_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, driverId);
            ps.setInt(2, bookingId);
            result = ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
