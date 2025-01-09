/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DBContext;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author thaiv
 */
public class ResetPasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String userName = request.getParameter("userName");
        String newPassword = request.getParameter("newPassword");
        String Confirm_Password = request.getParameter("Confirm_Password");

        // Kiểm tra token hợp lệ và thay đổi mật khẩu
        if (token != null && !token.isEmpty() && newPassword != null && !newPassword.isEmpty()) {
            // Cập nhật mật khẩu trong cơ sở dữ liệu, tùy thuộc vào logic và cấu trúc của bạn
            boolean success = updatePassword(token, newPassword);
            if (success) {
                request.setAttribute("message", "Password reset successful.");
            } else {
                request.setAttribute("message", "Invalid token or expired link.");
            }
        } else {
            request.setAttribute("message", "Invalid token or password.");
        }
        if (newPassword.equals(Confirm_Password)) {
            UserDao ud = new UserDao();
            ud.updatePassword(userName, newPassword);
            request.setAttribute("mess", "Reset password successful! Login now!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", "Invalid password!");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }
    }

    private boolean updatePassword(String token, String newPassword) {
        // Kết nối đến cơ sở dữ liệu
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        DBContext con = new DBContext();
        try {
            // Giả sử bạn đã có kết nối đến cơ sở dữ liệu
            connection = con.getConnection();
            // Bước 1: Kiểm tra xem token có hợp lệ không
            String query = "SELECT user_id, token_expiry FROM password_reset_tokens WHERE token = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, token);
            resultSet = preparedStatement.executeQuery();

            // Kiểm tra nếu token không tồn tại hoặc hết hạn
            if (!resultSet.next()) {
                return false; // Token không hợp lệ
            }

            Timestamp tokenExpiry = resultSet.getTimestamp("token_expiry");
            if (tokenExpiry.before(new Timestamp(System.currentTimeMillis()))) {
                return false; // Token đã hết hạn
            }

            int userId = resultSet.getInt("user_id");

            // Bước 2: Cập nhật mật khẩu mới cho người dùng
            String updateQuery = "UPDATE users SET password = ? WHERE user_id = ?";
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, newPassword); // Cập nhật mật khẩu mới
            preparedStatement.setInt(2, userId); // Cập nhật người dùng tương ứng

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0; // Nếu có dòng được cập nhật, trả về true
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Nếu có lỗi xảy ra, trả về false
        } finally {
            // Đóng kết nối và các tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
