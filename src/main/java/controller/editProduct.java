/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDao;
import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author thaiv
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class editProduct extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

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
            out.println("<title>Servlet editProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProduct at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        ProductDao pd = new ProductDao();
        Product p = pd.getProductById(Integer.parseInt(id));
        CategoryDao cd = new CategoryDao();
        List<Category> cList = cd.getAllCategories();
        request.setAttribute("categories", cList);
        request.setAttribute("product", p);
        request.getRequestDispatcher("EditProForm.jsp").forward(request, response);
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
        String productId_raw = request.getParameter("productId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String stock_raw = request.getParameter("stock");
        String categoryId_raw = request.getParameter("categoryId");
        // Handle file upload
        Part filePart = request.getPart("image");
        String fileName = filePart != null ? extractFileName(filePart) : null;
        String filePath = null;

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
        }

        // Log received data for debugging (optional)
        System.out.println("Product Name: " + name);
        System.out.println("Description: " + description);
        System.out.println("Price: " + price_raw);
        System.out.println("Stock: " + stock_raw);
        System.out.println("Category ID: " + categoryId_raw);
        System.out.println("Image Path: " + (filePath != null ? filePath : "No image uploaded"));
        String imagePath;
        int stock, categoryId, productId = 0;
        double price;
        try {
            stock = Integer.parseInt(stock_raw);
            categoryId = Integer.parseInt(categoryId_raw);
            price = Double.parseDouble(price_raw);
            productId = Integer.parseInt(productId_raw);
            imagePath = (filePath != null) ? filePath : "default_image_path";
            ProductDao pd = new ProductDao();
            Product p = new Product(productId, name, description, price, stock, categoryId, imagePath);
            pd.updateProduct(p);
        } catch (NumberFormatException e) {
        }

        response.sendRedirect("EditPro");

    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
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
