# Mega City Cab - Online Vehicle Reservation System

 Project Overview
Mega City Cab is a cab service in Colombo City that manages thousands of customer orders monthly. This project is a computerized system designed to streamline operations such as customer bookings, managing vehicles, assigning drivers, and generating bills. The system is developed in Java using the MVC pattern and follows best practices for object-oriented design.

 Features
- User Authentication  
  - Secure login with username and password
  - Roles: Admin, Customer, and Driver
  
- Customer Management  
  - Register new customers with details such as name, address, NIC, and telephone number
  - View customer booking history

- Vehicle Management  
  - Add, update, and delete vehicles
  - Store details such as license plate, model, brand, and availability status

- Driver Management  
  - Register drivers and update their availability
  - Assign drivers to bookings automatically

- Booking System  
  - Create and manage cab reservations
  - Assign a unique booking number to each transaction
  - View all bookings with their status and assigned driver

- Billing System  
  - Calculate trip fare, taxes, and discounts
  - Generate detailed invoices
  - Allow customers to view bills online

- Admin Dashboard  
  - Manage drivers, vehicles, and bookings
  - Assign drivers to customers
  - Oversee system operations

- Help & Support  
  - Customer Help: Booking, billing, and profile management guidance  
  - Driver Help: Updating availability and viewing assignments

 Technology Stack
- Backend: Java (Servlets & JSP)  
- Database: MySQL  
- Frontend: JSP, HTML, CSS, Bootstrap  
- Version Control: GitHub  
- Design Patterns: Singleton, DAO, MVC  

 Setup & Installation
# Prerequisites
- Install JDK 11+
- Install Apache Tomcat 9+
- Install MySQL Server
- Clone the repository:
  
  git clone https://github.com/your-repo/megacitycab.git
  
- Import the SQL script into MySQL:
  
  mysql -u root -p < megacitycab.sql
  
- Configure DatabaseConnection.java with your database credentials:
  java
  private String url = "jdbc:mysql://localhost:3306/megacitycab";
  private String username = "root";
  private String password = "yourpassword";
  
- Deploy the project on Tomcat and run `http://localhost:8080/MegaCityCab`

 Usage
1. Login as Admin, Customer, or Driver
2. Customers can:
   - Book a cab
   - View their bookings
   - Generate bills
3. Drivers can:
   - Accept or finish trips
   - View assigned bookings
4. Admin can:
   - Manage bookings, vehicles, and drivers
   - Assign drivers to customers

 Contributing
1. Fork the repository
2. Create a feature branch:  
   
   git checkout -b feature-branch
   
3. Commit changes:  
   
   git commit -m "Added new feature"
   
4. Push to GitHub and create a pull request
