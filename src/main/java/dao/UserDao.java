/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.User;

public class UserDao extends DBContext {

    // Thêm user mới
    public void insertUser(User user) {
        String sql = "INSERT INTO Users (username, password, email, role, phone, birthday, fullname, created_at) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getRole());
            st.setString(5, user.getPhone());
            st.setString(6, user.getBirthday());
            st.setString(7, user.getFullname());
            st.setString(8, user.getCreatedAt());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả người dùng
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT user_id, username, password, email, role, phone, birthday, fullname, created_at FROM Users";
        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("role"),
                        rs.getString("phone"),
                        rs.getString("birthday"),
                        rs.getString("fullname"),
                        rs.getString("created_at")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Lấy user theo username
    public User getUserByUsername(String username) {
        String sql = "SELECT user_id, username, password, email, role, phone, birthday, fullname, created_at FROM Users WHERE username = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("phone"),
                            rs.getString("birthday"),
                            rs.getString("fullname"),
                            rs.getString("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isUserExist(String userName, String email) {
        String query = "SELECT * FROM Users WHERE username = ? OR email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, userName);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Trả về true nếu tìm thấy user
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật thông tin user
    public void updateUser(User user) {
        String sql = "UPDATE Users SET password = ?, email = ?, role = ?, phone = ?, birthday = ?, fullname = ? WHERE username = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, user.getPassword());
            st.setString(2, user.getEmail());
            st.setString(3, user.getRole());
            st.setString(4, user.getPhone());
            st.setString(5, user.getBirthday());
            st.setString(6, user.getFullname());
            st.setString(7, user.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa user theo username
    public void deleteUser(String username) {
        String sql = "DELETE FROM Users WHERE username = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Kiểm tra tài khoản hợp lệ
    public User checkLogin(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("phone"),
                            rs.getString("birthday"),
                            rs.getString("fullname"),
                            rs.getString("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Kiểm tra tài khoản và trả về ID người dùng
    public String getUserIdByUsername(String username) {
        String sql = "SELECT user_id FROM Users WHERE username = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return String.valueOf(rs.getInt("user_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updatePassword(String userName, String newPassword) {
        String sql = "UPDATE Users SET password = ? WHERE username = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newPassword); // Mã hóa mật khẩu trước khi lưu
            st.setString(2, userName);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
// Lấy username dựa vào email

    public String getUsernameByEmail(String email) {
        String sql = "SELECT username FROM Users WHERE email = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("username"); // Trả về username nếu tìm thấy
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }

    public static void main(String[] args) {
        UserDao userDao = new UserDao();
        // Kiểm tra đăng nhập với tên người dùng và mật khẩu
        User u = new User("QuocThai4", "123", "thaivo3074@gmail.com", "customer", "0767973496", "2003-12-25", "Qu?c Thái", "2024-11-25 15:11:38.000");

        userDao.deleteUser("QuocThai4");
    }
}
