package com.restaurant_management_system.model;

import com.restaurant_management_system.beans.Menu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MenuDB {

    public List<Menu> getAllMenus() {
        List<Menu> menuList = new ArrayList<>();
        myDatabase db = new myDatabase();
        Connection con = db.getCon();

        try {
            String query = "SELECT * FROM menu";
            System.out.println(query);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Menu menu = new Menu(rs.getInt("id"), rs.getString("menu"), rs.getDouble("price"));
                menuList.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(con);
        }

        return menuList;
    }
}
