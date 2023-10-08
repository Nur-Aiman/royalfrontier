package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgotPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForgotPassword() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        request.getRequestDispatcher("jsp/ResetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        // Get phone number from the request
        String phone = request.getParameter("phone");
        
        // Check if phone number doesn't start with '6' and prepend '6'
        if (!phone.startsWith("6")) {
            phone = "6" + phone;
        }

        // Generate a random password
        String newPassword = generateRandomPassword();

        // Update password in the database
        UserDB userDB = new UserDB();
        boolean isPasswordUpdated = userDB.updatePasswordByPhone(phone, newPassword);

        // Instead of writing a response, set an attribute and redirect
        if (isPasswordUpdated) {
            request.getSession().setAttribute("passwordResetStatus", 
                "Password reset successfully. Please check your phone for the new password.");
        } else {
            request.getSession().setAttribute("passwordResetStatus", 
                "Error occurred during password reset. Please try again.");
        }
        
        response.sendRedirect("jsp/ResetPassword.jsp");
    }


    private String generateRandomPassword() {
        int length = 8;
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }

        return password.toString();
    }
}
