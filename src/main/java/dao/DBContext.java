/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author thaiv
 */
public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName= KV_Sneaker;encrypt=true;trustServerCertificate=true;";
            String username = "sa";
            String password = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
           
         } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    // Thêm phương thức này để trả về kết nối
    public Connection getConnection() {
        return this.connection;
    }
    public static void main(String[] args) {
        // Tạo một đối tượng DBContext để thực hiện kết nối
        DBContext db = new DBContext();
        
        // Kiểm tra kết nối
        if (db.connection != null) {
            System.out.println("Kết nối thành công!");
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }
}
