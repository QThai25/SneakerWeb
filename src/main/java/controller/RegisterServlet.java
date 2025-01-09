/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import model.User;

/**
 *
 * @author thaiv
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String phone = request.getParameter("Phone");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String userName = request.getParameter("user"); // Sửa lỗi chính tả
        String password = request.getParameter("password");
        String password_confirm = request.getParameter("password_confirm");

        try {
            // Kiểm tra dữ liệu đầu vào
            if (lastName == null || firstName == null || phone == null || email == null
                    || userName == null || password == null || password_confirm == null
                    || lastName.isEmpty() || firstName.isEmpty() || phone.isEmpty()
                    || email.isEmpty() || userName.isEmpty() || password.isEmpty() || password_confirm.isEmpty()) {
                request.setAttribute("error", "All fields are required!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                request.setAttribute("error", "Invalid email format!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (!password.equals(password_confirm)) {
                request.setAttribute("error", "Password confirmation does not match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            UserDao ud = new UserDao();

            // Kiểm tra username hoặc email đã tồn tại
            if (ud.isUserExist(userName, email)) { // Phương thức mới trong UserDao
                request.setAttribute("error", "Registration failed! Username or email already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Tạo thông tin user mới
            String fullName = lastName + " " + firstName;
            LocalDateTime now = LocalDateTime.now();
            Timestamp sqlTimestamp = Timestamp.valueOf(LocalDateTime.now());
            String create = sqlTimestamp.toString();
            create = create.split("\\.")[0];
            User newUser = new User(userName, password, email, "customer", phone, birthday, fullName, create);

            // Lưu user vào database
            
            
            ud.insertUser(newUser);

            // Đăng ký thành công
            request.setAttribute("mess", "Registration successful! Please log in.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            // Ghi log lỗi và thông báo lỗi cho người dùng
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
