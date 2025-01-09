/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Order;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import model.Cart;
import model.Item;
import model.User;

public class OrderDao extends DBContext {

    public void addOrder(User user, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();

        String Date = curDate.toString();
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           [user_id]\n"
                    + "           ,[total_amount]\n"
                    + "           ,[status]\n"
                    + "           ,[created_at])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "		   )";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user.getUserId());
            st.setDouble(2, cart.getTotalMoney());
            st.setString(3, "Good");
            st.setString(4, Date);
            st.executeUpdate();

            String sql1 = "SELECT TOP (1) order_id from Orders\n"
                    + "order by  order_id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item item : cart.getItems()) {
                    String sql2 = "insert into Order_Details\n"
                            + "values (\n"
                            + "	?,?,?,?\n"
                            + ")";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, item.getProduct().getProductId());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    // Thêm đơn hàng
    public void insertOrder(Order order) {
        String sql = "INSERT INTO Orders (user_id, total_amount, status, created_at) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, order.getUserId());
            st.setDouble(2, order.getTotalAmount()); // Sử dụng double cho total_amount
            st.setString(3, order.getStatus());
            st.setString(4, order.getCreatedAt()); // Sử dụng String cho createdAt
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả đơn hàng
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                orders.add(new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_amount"), // Lấy giá trị total_amount là double
                        rs.getString("status"),
                        rs.getString("created_at") // Đọc createdAt là String
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Lấy đơn hàng theo ID
    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM Orders WHERE order_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Order(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getDouble("total_amount"), // Lấy giá trị total_amount là double
                            rs.getString("status"),
                            rs.getString("created_at") // Đọc createdAt là String
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật đơn hàng
    public void updateOrder(Order order) {
        String sql = "UPDATE Orders SET user_id = ?, total_amount = ?, status = ?, created_at = ? WHERE order_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, order.getUserId());
            st.setDouble(2, order.getTotalAmount()); // Sử dụng double cho total_amount
            st.setString(3, order.getStatus());
            st.setString(4, order.getCreatedAt()); // Sử dụng String cho createdAt
            st.setInt(5, order.getOrderId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa đơn hàng
    public void deleteOrder(int orderId) {
        String sql = "DELETE FROM Orders WHERE order_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
