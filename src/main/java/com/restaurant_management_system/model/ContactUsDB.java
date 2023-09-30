package com.restaurant_management_system.model;

import java.sql.Statement;

import com.restaurant_management_system.beans.Contact;

import java.sql.Connection;
import java.sql.SQLException;


public class ContactUsDB {
	String s1 = null;

	public String messageContact(Contact cd) {
		myDatabase db = new myDatabase();
		Connection con = db.getCon();
		try {

			System.out.print("MASUK");
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into contactus(name,email,subject, message, date) values('" + cd.getName() + "','" + cd.getEmail()
					+ "','" + cd.getSubject() + "','" + cd.getMessage() + "','"+cd.getDate()+"')");
			s1 = "Data Insert Successfully";
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return s1;
	}
}
