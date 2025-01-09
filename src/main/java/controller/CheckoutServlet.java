/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDao;
import dao.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author thaiv
 */
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String itemId = request.getParameter("id"); // Lấy tham số id của món đồ (nếu có)
        User user = (User) session.getAttribute("currentUser");
        CartDao cd = new CartDao();
        Cart cart1 = (Cart) session.getAttribute("cart");
        String quantity_raw = request.getParameter("quantity");
        System.out.println(quantity_raw);
        int quantity = 0;
        if (quantity_raw!= null) {
            quantity = Integer.parseInt(quantity_raw);
        }
        double total = 0;
        List<Item> items = null;
        int stock = 0;
        if (itemId != null && !itemId.isEmpty()) {
            // TH1: Người dùng chọn "Thanh toán ngay" một món đồ

            ProductDao pd = new ProductDao();
            Product selectedItem = pd.getProductById(Integer.parseInt(itemId)); // Giả sử hàm getItemById đã được viết
            if (selectedItem != null) {
                total = selectedItem.getPrice() * quantity;
                stock = selectedItem.getStock() - quantity;
                Product p = new Product(Integer.parseInt(itemId), stock);
                pd.updateProductQuantity(p);

            } else {
                request.setAttribute("mess", "Item not found in cart.");
            }

        } else {
            // TH2: Người dùng chọn "Thanh toán toàn bộ giỏ hàng"
            if (cart1 != null) {
                total = cart1.getTotalMoney();
                items = cart1.getItems();
                // Xóa giỏ hàng sau khi thanh toán
                session.removeAttribute("cart");
            }
        }

        // Gửi thông tin tổng tiền và danh sách sản phẩm sang trang thanh toán
        request.setAttribute("mess", "Your total amount: " + total + "<br>BUY SUCCESSFUL!!");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        processRequest(request, response);
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
