/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Cart;
import java.sql.*;
import java.util.*;

public class CartDao extends DBContext {

    // Thêm sản phẩm vào giỏ hàng
    public void insertCart(Cart cart) {
        String sql = "INSERT INTO Cart (user_id, product_id, quantity, created_at) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cart.getUserId());
            st.setInt(2, cart.getCartId());
            st.setInt(3, cart.getQuantity());
            st.setString(4, cart.getCreatedAt()); // Sử dụng String cho createdAt
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả sản phẩm trong giỏ hàng
    public List<Cart> getAllCarts() {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT * FROM Cart";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                carts.add(new Cart(
                        rs.getInt("cart_id"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getString("created_at") // Đọc createdAt là String
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    // Lấy giỏ hàng của một người dùng
    public List<Cart> getCartsByUserId(int userId) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT * FROM Cart WHERE user_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    carts.add(new Cart(
                            rs.getInt("cart_id"),
                            rs.getInt("user_id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getString("created_at") // Đọc createdAt là String
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    // Cập nhật giỏ hàng
    public void updateCart(Cart cart) {
        String sql = "UPDATE Cart SET quantity = ?, created_at = ? WHERE cart_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cart.getQuantity());
            st.setString(2, cart.getCreatedAt()); // Sử dụng String cho createdAt
            st.setInt(3, cart.getCartId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void deleteCart(int cartId) {
        String sql = "DELETE FROM Cart WHERE cart_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

