/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.OrderDetail;

public class OrderDetailDao extends DBContext {

    // Thêm chi tiết đơn hàng
    public void insertOrderDetail(OrderDetail orderDetail) {
        String sql = "INSERT INTO Order_Details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderDetail.getOrderId());
            st.setInt(2, orderDetail.getProductId());
            st.setInt(3, orderDetail.getQuantity());
            st.setDouble(4, orderDetail.getPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy chi tiết đơn hàng theo order_id
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT order_detail_id, order_id, product_id, quantity, price FROM Order_Details WHERE order_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail orderDetail = new OrderDetail(
                            rs.getInt("order_detail_id"),
                            rs.getInt("order_id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("price")
                    );
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    // Cập nhật chi tiết đơn hàng
    public void updateOrderDetail(OrderDetail orderDetail) {
        String sql = "UPDATE Order_Details SET quantity = ?, price = ? WHERE order_detail_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderDetail.getQuantity());
            st.setDouble(2, orderDetail.getPrice());
            st.setInt(3, orderDetail.getOrderDetailId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa chi tiết đơn hàng
    public void deleteOrderDetail(int orderDetailId) {
        String sql = "DELETE FROM Order_Details WHERE order_detail_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderDetailId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
