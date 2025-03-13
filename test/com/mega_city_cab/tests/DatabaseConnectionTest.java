/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mega_city_cab.tests;

import Utility.DatabaseConnection;
import org.junit.Test;
import static org.junit.Assert.*;
import java.sql.Connection;
import java.sql.SQLException;
/**
 *
 * @author Moham
 */


public class DatabaseConnectionTest {

    @Test
    public void testDatabaseConnectionNotNull() {
        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            assertNotNull("Database connection should not be null", conn);
        } catch (SQLException e) {
            fail("Database connection failed: " + e.getMessage());
        }
    }
}

