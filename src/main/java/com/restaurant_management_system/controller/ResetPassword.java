package com.restaurant_management_system.controller;

import com.restaurant_management_system.model.UserDB;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResetPassword() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        // Get the email, temporary password, and new password from the request
        String email = request.getParameter("email");
        String tempPassword = request.getParameter("tempPassword");
        String newPassword = request.getParameter("newPassword");

        // Instantiate the UserDB class
        UserDB userDB = new UserDB();

        // Check if the temporary password matches with the current password in the database
        boolean isValidTempPassword = userDB.verifyPassword(email, tempPassword);

        if (isValidTempPassword) {
            // Set the new password
            boolean isPasswordUpdated = userDB.updatePasswordByEmail(email, newPassword);
            if (isPasswordUpdated) {
                response.sendRedirect("jsp/Login.jsp"); // Redirect to Login.jsp after successfully resetting password
                return; // Exit the method after redirecting
            } else {
                response.setContentType("text/plain");
                PrintWriter out = response.getWriter();
                out.write("Error occurred during password reset. Please try again.");
                out.flush();
                out.close();
            }
        } else {
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            out.write("The temporary password is incorrect. Please enter the correct temporary password.");
            out.flush();
            out.close();
        }
    }
}
