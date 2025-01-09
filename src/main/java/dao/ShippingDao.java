/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Shipping;
import java.sql.*;
import java.util.*;

public class ShippingDao extends DBContext {

    // Thêm thông tin vận chuyển
    public void insertShipping(Shipping shipping) {
        String sql = "INSERT INTO Shipping (order_id, address, city, state, postal_code, country, shipping_status, shipped_date, delivered_date, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, shipping.getOrderId());
            st.setString(2, shipping.getAddress());
            st.setString(3, shipping.getCity());
            st.setString(4, shipping.getState());
            st.setString(5, shipping.getPostalCode());
            st.setString(6, shipping.getCountry());
            st.setString(7, shipping.getShippingStatus());
            st.setString(8, shipping.getShippedDate()); // Sử dụng String cho shippedDate
            st.setString(9, shipping.getDeliveredDate()); // Sử dụng String cho deliveredDate
            st.setString(10, shipping.getCreatedAt()); // Sử dụng String cho createdAt
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả thông tin vận chuyển
    public List<Shipping> getAllShippings() {
        List<Shipping> shippings = new ArrayList<>();
        String sql = "SELECT * FROM Shipping";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                shippings.add(new Shipping(
                        rs.getInt("shipping_id"),
                        rs.getInt("order_id"),
                        rs.getString("address"),
                        rs.getString("city"),
                        rs.getString("state"),
                        rs.getString("postal_code"),
                        rs.getString("country"),
                        rs.getString("shipping_status"),
                        rs.getString("shipped_date"), // Đọc shipped_date là String
                        rs.getString("delivered_date"), // Đọc delivered_date là String
                        rs.getString("created_at") // Đọc created_at là String
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shippings;
    }

    // Cập nhật thông tin vận chuyển
    public void updateShipping(Shipping shipping) {
        String sql = "UPDATE Shipping SET address = ?, city = ?, state = ?, postal_code = ?, country = ?, shipping_status = ?, shipped_date = ?, delivered_date = ?, created_at = ? WHERE shipping_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, shipping.getAddress());
            st.setString(2, shipping.getCity());
            st.setString(3, shipping.getState());
            st.setString(4, shipping.getPostalCode());
            st.setString(5, shipping.getCountry());
            st.setString(6, shipping.getShippingStatus());
            st.setString(7, shipping.getShippedDate()); // Sử dụng String cho shippedDate
            st.setString(8, shipping.getDeliveredDate()); // Sử dụng String cho deliveredDate
            st.setString(9, shipping.getCreatedAt()); // Sử dụng String cho createdAt
            st.setInt(10, shipping.getShippingId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa thông tin vận chuyển
    public void deleteShipping(int shippingId) {
        String sql = "DELETE FROM Shipping WHERE shipping_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, shippingId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
