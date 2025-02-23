/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DriverDAO;
import models.Driver;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author Moham
 */


@WebServlet("/driverCRUD")
public class DriverCRUDServlet extends HttpServlet {
    private final DriverDAO driverDAO = new DriverDAO();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "list";
        }
        switch(action) {
            case "list" -> listDrivers(request, response);
            case "edit" -> showEditForm(request, response);
            case "delete" -> deleteDriver(request, response);
            default -> listDrivers(request, response);
        }
    }
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "add";
        }
        switch(action) {
            case "add" -> addDriver(request, response);
            case "update" -> updateDriver(request, response);
            default -> addDriver(request, response);
        }
    }
    
    private void listDrivers(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Driver> drivers = driverDAO.getAllDrivers();
        request.setAttribute("drivers", drivers);
        request.getRequestDispatcher("manageDrivers.jsp").forward(request, response);
    }
    
    private void addDriver(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("licenseNumber");
        String contact = request.getParameter("contact");
        Driver driver = new Driver();
        driver.setName(name);
        driver.setLicenseNumber(licenseNumber);
        driver.setContact(contact);
        driverDAO.addDriver(driver);
        response.sendRedirect("driverCRUD?action=list");
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("driverId"));
        List<Driver> drivers = driverDAO.getAllDrivers();
        Driver driver = null;
        for(Driver d : drivers) {
            if(d.getDriverId() == driverId) {
                driver = d;
                break;
            }
        }
        request.setAttribute("driver", driver);
        request.getRequestDispatcher("editDriver.jsp").forward(request, response);
    }
    
    private void updateDriver(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("driverId"));
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("licenseNumber");
        String contact = request.getParameter("contact");
        Driver driver = new Driver();
        driver.setDriverId(driverId);
        driver.setName(name);
        driver.setLicenseNumber(licenseNumber);
        driver.setContact(contact);
        driverDAO.updateDriver(driver);
        response.sendRedirect("driverCRUD?action=list");
    }
    
    private void deleteDriver(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("driverId"));
        driverDAO.deleteDriver(driverId);
        response.sendRedirect("driverCRUD?action=list");
    }
}
