/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.Product;

public class ProductDao extends DBContext {

    // Thêm sản phẩm mới
    public void insertProduct(Product product) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([product_id]\n"
                + "           ,[name]\n"
                + "           ,[description]\n"
                + "           ,[price]\n"
                + "           ,[stock]\n"
                + "           ,[category_id]\n"
                + "           ,[image])\n" // Đảm bảo rằng phần cột không bị thiếu ngoặc
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";  // Kết thúc câu lệnh với dấu ngoặc

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, product.getProductId());
            st.setString(2, product.getName());
            st.setString(3, product.getDescription());
            st.setDouble(4, product.getPrice());
            st.setInt(5, product.getStock());
            st.setInt(6, product.getCategoryId());
            st.setString(7, product.getImage());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT product_id, name, description, price, stock, category_id, image, created_at FROM Products WHERE name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getInt("category_id"),
                        rs.getString("image"),
                        rs.getString("created_at")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT product_id, name, description, price, stock, category_id, image, created_at FROM Products";
        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getInt("category_id"),
                        rs.getString("image"),
                        rs.getString("created_at")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Lấy tất cả sản phẩm
    public List<Product> getAllProductsByCat_Id(int Cat_id) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE category_id = ?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            // Đặt giá trị cho tham số trong câu truy vấn
            st.setInt(1, Cat_id);

            // Thực hiện truy vấn
            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getInt("stock"),
                            rs.getInt("category_id"),
                            rs.getString("image"),
                            rs.getString("created_at")
                    );
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Lấy sản phẩm theo ID
    public Product getProductById(int productId) {
        String sql = "SELECT product_id, name, description, price, stock, category_id, image, created_at FROM Products WHERE product_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getInt("stock"),
                            rs.getInt("category_id"),
                            rs.getString("image"),
                            rs.getString("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật thông tin sản phẩm
    public void updateProduct(Product product) {
        String sql = "UPDATE Products SET name = ?, description = ?, price = ?, stock = ?, category_id = ?, image = ? WHERE product_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, product.getName());
            st.setString(2, product.getDescription());
            st.setDouble(3, product.getPrice());
            st.setInt(4, product.getStock());
            st.setInt(5, product.getCategoryId());
            st.setString(6, product.getImage());
            st.setInt(7, product.getProductId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        // Cập nhật thông tin sản phẩm
    public void updateProductQuantity(Product product) {
        String sql = "UPDATE Products SET stock = ? WHERE product_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, product.getStock());
            st.setInt(2, product.getProductId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Xóa sản phẩm
    public void deleteProduct(int productId) {
        String sql = "DELETE FROM Products WHERE product_id = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
