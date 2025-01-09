/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Review;
import java.sql.*;
import java.util.*;

public class ReviewDao extends DBContext {

    // Thêm đánh giá
    public void insertReview(Review review) {
        String sql = "INSERT INTO Reviews (user_id, product_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, review.getUserId());
            st.setInt(2, review.getProductId());
            st.setInt(3, review.getRating());
            st.setString(4, review.getComment());
            st.setString(5, review.getCreatedAt()); // Sử dụng String cho createdAt
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả đánh giá
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                reviews.add(new Review(
                        rs.getInt("review_id"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getString("created_at") // Đọc createdAt là String
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    // Lấy đánh giá theo ID
    public Review getReviewById(int reviewId) {
        String sql = "SELECT * FROM Reviews WHERE review_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, reviewId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Review(
                            rs.getInt("review_id"),
                            rs.getInt("user_id"),
                            rs.getInt("product_id"),
                            rs.getInt("rating"),
                            rs.getString("comment"),
                            rs.getString("created_at") // Đọc createdAt là String
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật đánh giá
    public void updateReview(Review review) {
        String sql = "UPDATE Reviews SET user_id = ?, product_id = ?, rating = ?, comment = ?, created_at = ? WHERE review_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, review.getUserId());
            st.setInt(2, review.getProductId());
            st.setInt(3, review.getRating());
            st.setString(4, review.getComment());
            st.setString(5, review.getCreatedAt()); // Sử dụng String cho createdAt
            st.setInt(6, review.getReviewId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa đánh giá
    public void deleteReview(int reviewId) {
        String sql = "DELETE FROM Reviews WHERE review_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, reviewId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
