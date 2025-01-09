/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.Category;

public class CategoryDao extends DBContext {

    // Thêm category mới
    public void insertCategory(Category category) {
        String sql = "INSERT INTO Categories ( category_id ,name, decription) \n"
                + "VALUES (?,?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, category.getCategoryId());
            st.setString(2, category.getName());
            st.setString(3, category.getDecription());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả categories
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT category_id, name, decription, created_at FROM Categories";
        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("decription"),
                        rs.getString("created_at")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Category> getAllCategoriesByDescription(String des) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM     Categories INNER JOIN\n"
                + "                  Products ON Categories.category_id = Products.category_id\n"
                + "				  where Categories.decription like ?";
        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            st.setString(1, des);
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("decription"),
                        rs.getString("created_at")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    // Lấy category theo ID
    public Category getCategoryById(int categoryId) {
        String sql = "SELECT category_id, name, decription, created_at FROM Categories WHERE category_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, categoryId);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Category(
                            rs.getInt("category_id"),
                            rs.getString("name"),
                            rs.getString("decription"),
                            rs.getString("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật category
    public void updateCategory(Category category) {
        String sql = "UPDATE Categories SET name = ?, decription = ? WHERE category_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, category.getName());
            st.setString(2, category.getDecription());
            st.setInt(3, category.getCategoryId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa category
    public void deleteCategory(int categoryId) {
        String sql = "DELETE FROM Categories WHERE category_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, categoryId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CategoryDao cd = new CategoryDao();
        List<Category> cList = cd.getAllCategories();
        for (Category category : cList) {
            System.out.println(category.getName());
        }
    }
}
