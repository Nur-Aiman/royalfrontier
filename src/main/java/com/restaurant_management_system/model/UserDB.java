package com.restaurant_management_system.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.restaurant_management_system.beans.user;

public class UserDB {

    String resultMessage = null;

    // This method will help to get a new connection every time it's called.
    private Connection getConnection() {
        myDatabase db = new myDatabase();
        return db.getCon();
    }

    public String insertUser(user rb) {
        Connection con = getConnection();

        String query = "INSERT INTO `user`(name, email, password, phone) VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, rb.getName());
            pstmt.setString(2, rb.getEmail());
            pstmt.setString(3, rb.getPassword());
            pstmt.setString(4, rb.getPhone());

            pstmt.executeUpdate();
            resultMessage = "Data Inserted Successfully";
        } catch (SQLException ex) {
            ex.printStackTrace();
            resultMessage = "Error in insertion: " + ex.getMessage();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultMessage;
    }

    public boolean updatePasswordByPhone(String phone, String newPassword) {
        Connection con = getConnection();
        String query = "UPDATE `user` SET password = ? WHERE phone = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, phone);

            int updatedRows = pstmt.executeUpdate();
            return updatedRows > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean verifyPassword(String email, String password) {
        Connection con = getConnection();
        String query = "SELECT password FROM `user` WHERE email = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String currentPassword = rs.getString("password");
                return currentPassword.equals(password);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updatePasswordByEmail(String email, String newPassword) {
        Connection con = getConnection();
        String query = "UPDATE `user` SET password = ? WHERE email = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            int updatedRows = pstmt.executeUpdate();
            return updatedRows > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
