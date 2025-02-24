/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.VehicleDAO;
import models.Vehicle;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
/**
 *
 * @author Moham
 */


@WebServlet("/vehicleCRUD")
public class VehicleCRUDServlet extends HttpServlet {
    private final VehicleDAO vehicleDAO = new VehicleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "list";
        }
        switch(action) {
            case "list":
                listVehicles(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteVehicle(request, response);
                break;
            default:
                listVehicles(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "add";
        }
        switch(action) {
            case "add":
                addVehicle(request, response);
                break;
            case "update":
                updateVehicle(request, response);
                break;
            default:
                addVehicle(request, response);
        }
    }
    
    private void listVehicles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("manageVehicles.jsp").forward(request, response);
    }
    
    private void addVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        String model = request.getParameter("model");
        String brand = request.getParameter("brand");
        String status = request.getParameter("status");
        Vehicle vehicle = new Vehicle();
        vehicle.setLicensePlate(licensePlate);
        vehicle.setModel(model);
        vehicle.setBrand(brand);
        vehicle.setStatus(status);
        vehicleDAO.addVehicle(vehicle);
        response.sendRedirect("vehicleCRUD?action=list");
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
        Vehicle vehicle = null;
        for(Vehicle v : vehicles) {
            if(v.getVehicleId() == vehicleId) {
                vehicle = v;
                break;
            }
        }
        request.setAttribute("vehicle", vehicle);
        request.getRequestDispatcher("editVehicle.jsp").forward(request, response);
    }
    
    private void updateVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        String licensePlate = request.getParameter("licensePlate");
        String model = request.getParameter("model");
        String brand = request.getParameter("brand");
        String status = request.getParameter("status");
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleId(vehicleId);
        vehicle.setLicensePlate(licensePlate);
        vehicle.setModel(model);
        vehicle.setBrand(brand);
        vehicle.setStatus(status);
        vehicleDAO.updateVehicle(vehicle);
        response.sendRedirect("vehicleCRUD?action=list");
    }
    
    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        vehicleDAO.deleteVehicle(vehicleId);
        response.sendRedirect("vehicleCRUD?action=list");
    }
}
