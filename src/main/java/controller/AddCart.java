/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author thaiv
 */
public class AddCart extends HttpServlet {

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
            out.println("<title>Servlet AddCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        LocalDate curDate = java.time.LocalDate.now();

        String Date = curDate.toString();
        // Kiểm tra người dùng đã đăng nhập hay chưa
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            response.sendRedirect("login.jsp"); // Chuyển về trang đăng nhập nếu chưa đăng nhập
            return;
        }

        if (action != null && action.equals("viewCart")) {
            // Nếu yêu cầu xem giỏ hàng, lấy giỏ hàng từ database
            List<Cart> cList = null;
            CartDao cd = new CartDao();
            Cart cart1 = (Cart) session.getAttribute("cart");
            cList = cd.getCartsByUserId(user.getUserId());
            double total = 0;
            List<Item> items = null;
            if (cart1 != null) {
                total = cart1.getTotalMoney();
                items = cart1.getItems();
            }
            request.setAttribute("totalPrice", total);
            request.setAttribute("cartItems", items);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (action != null && action.equals("addItem")) {
            // Nếu yêu cầu thêm sản phẩm vào giỏ hàng
            String quantity_raw = request.getParameter("quantity");
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(quantity_raw);

            // Lấy giỏ hàng từ session
            Cart cart = (Cart) session.getAttribute("cart");

            // Nếu chưa có giỏ hàng, tạo giỏ hàng mới
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Lấy thông tin sản phẩm từ CSDL
            ProductDao productDao = new ProductDao();
            Product product = productDao.getProductById(productId);

            if (product != null) {
                // Thêm sản phẩm vào giỏ hàng
                CartDao cd1 = new CartDao();
                Item item = new Item(product, quantity, product.getPrice() * quantity);
                cart.addItem(item);
                Cart c = new Cart(user.getUserId(), productId, quantity, Date);
               
                cd1.insertCart(c);
            }

            // Chuyển hướng về trang giỏ hàng
            response.sendRedirect("AddCart?action=viewCart");
        } else if (action != null && action.equals("update")) {
            Cart cart2 = (Cart) session.getAttribute("cart");
            String productId_raw = request.getParameter("productId");
            String quan_raw = request.getParameter("quantity");
            int productId, quan;
            try {
                productId = Integer.parseInt(productId_raw);
                quan = Integer.parseInt(quan_raw);

                cart2.updateQuantity(productId, quan);
//                request.setAttribute("quantity", quan);
//                request.setAttribute("productId", productId);
//                request.getRequestDispatcher("AddCart?action=addItem").forward(request, response);
                response.sendRedirect("AddCart?action=viewCart");
            } catch (Exception e) {
            }
        } else if (action != null && action.equals("delete")) {
            Cart cart2 = (Cart) session.getAttribute("cart");
            String productId_raw = request.getParameter("productId");
            int productId;
            try {
                productId = Integer.parseInt(productId_raw);

                cart2.removeItem(productId);
                session.setAttribute("cart", cart2);
                response.sendRedirect("AddCart?action=viewCart");
            } catch (Exception e) {
            }
        } else {
            // Nếu không có action, chuyển hướng về trang giỏ hàng
            response.sendRedirect("AddCart?action=viewCart");
        }
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
