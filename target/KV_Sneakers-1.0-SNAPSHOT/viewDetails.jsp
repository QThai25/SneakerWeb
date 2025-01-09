<%-- 
    Document   : home
    Created on : Nov 18, 2024, 2:50:12 PM
    Author     : thaiv
--%>

<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>KV's Sneaker</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* Căn chỉnh container */
            .star-rating {
                display: flex;
                gap: 5px; /* Khoảng cách giữa các ngôi sao */
                font-size: 2rem; /* Kích thước của các ngôi sao */
                cursor: pointer;
                user-select: none;
            }

            /* Mặc định màu xám cho ngôi sao */
            .star-rating .fa-star {
                color: #ccc;
                transition: color 0.3s ease, transform 0.3s ease; /* Hiệu ứng chuyển đổi màu và phóng to */
            }

            /* Màu vàng khi được chọn */
            .star-rating .fa-star.selected {
                color: #ffc107;
            }

            /* Hiệu ứng hover */
            .star-rating .fa-star:hover {
                transform: scale(1.2); /* Phóng to khi di chuột */
                color: #ffc107; /* Màu vàng khi hover */
            }

            /* Hiệu ứng hover cho các ngôi sao trước đó */
            .star-rating .fa-star:hover ~ .fa-star {
                color: #ccc;
            }

        </style>
    </head>

    <body>
        <%
            String[] sizes = {"S", "M", "L", "XL", "XXL", "L-2", "M-2", "S-2", "XL-2"};
            // Chọn ngẫu nhiên 3 kích thước
            java.util.List<String> randomSizes = new java.util.ArrayList<>();
            java.util.Collections.shuffle(java.util.Arrays.asList(sizes)); // Xáo trộn mảng
            for (int i = 0; i < 3; i++) {
                randomSizes.add(sizes[i]);
            }
            request.setAttribute("randomSizes", randomSizes);
        %>
        <jsp:include page="head.jsp"/>
        <div class="container py-5">
            <!-- Chi tiết sản phẩm -->
            <div class="row">
                <div class="col-lg-6">
                    <!-- Hiển thị hình ảnh sản phẩm -->
                    <img style="width: 400px;" class="img-fluid" src="${product.image}" alt="${product.name}">
                </div>
                <div class="col-lg-6">
                    <h3>${product.name}</h3>
                    <h4 class="text-primary">${product.price}</h4>
                    <p>${product.description}</p>
                    <div class="d-flex mb-3">
                        <h6 class="font-weight-bold mr-3">Size:</h6>
                        <c:forEach var="size" items="${randomSizes}">
                            <span class="badge badge-primary mx-1">${size}</span>
                        </c:forEach>
                    </div>
                    <div class="d-flex mb-3">
                        <h6 class="font-weight-bold mr-3">Stock:</h6>
                        <c:choose>
                            <c:when test="${product.stock <= 0}">
                                <span>Out of Stock</span> <!-- Nếu số lượng <= 0, hiển thị Out of Stock -->
                            </c:when>
                            <c:otherwise>
                                <span>${product.stock} items available</span> <!-- Nếu còn hàng, hiển thị số lượng -->
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="d-flex mb-3">
                        <h6 class="font-weight-bold mr-3">Quantity:</h6>
                        <input type="hidden" name="productId" id="productId" min="1" value="${product.productId}" class="form-control w-25">
                        <input type="number" name="quantity" id="quantity" min="1" value="1" class="form-control w-25">
                    </div>
                    <div class="d-flex">
                        <!-- Kiểm tra nếu không phải admin -->
                        <c:if test="${empty sessionScope.currentUser or sessionScope.currentUser.role ne 'admin'}">
                            <a id="addToCart" href="AddCart?action=addItem&productId=${product.productId}&quantity=" + document.getElementById('quantity').value 
                               style="background-color: #EDF1FF;" class="btn btn-primary mr-2">Add to Cart</a>

                            <!-- Kiểm tra stock và thay đổi trạng thái Buy Now -->
                            <a id="buyNowBtn" href="CheckoutServlet?id=${product.productId}&quantity=" + document.getElementById('quantity').value 
                               style="background-color: #C5837C;" class="btn btn-success"
                               <c:if test="${product.stock <= 0}">
                                   onclick="alert('Out of stock, we will restock, please come back later!'); return false;" 
                               </c:if>
                               onclick="this.href = this.href + document.getElementById('quantity').value;">
                                Buy Now
                            </a>
                        </c:if>

                        <!-- Hiển thị nút Edit và Delete nếu là admin -->
                        <c:if test="${not empty sessionScope.currentUser and sessionScope.currentUser.role eq 'admin'}">
                            <a href="editProduct?id=${product.productId}" style="background-color: #EDF1FF;" class="btn btn-warning mx-2">Edit</a>
                            <a href="deleteProduct?id=${product.productId}" style="background-color: #C5837C;" onclick="return confirm('Are you sure you want to delete this product?');" class="btn btn-danger">Delete</a>
                        </c:if>
                    </div>





                    <div class="mb-4">
                        <h6 class="font-weight-bold">Review</h6>
                        <div id="star-rating" class="star-rating">
                            <i class="fa fa-star" data-value="1"></i>
                            <i class="fa fa-star" data-value="2"></i>
                            <i class="fa fa-star" data-value="3"></i>
                            <i class="fa fa-star" data-value="4"></i>
                            <i class="fa fa-star" data-value="5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">KV's</span>Sneaker</h1>
                    </a>

                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Bong Vang, My Khanh - Phong Dien, Can Tho</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>khuong@gmail.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const stars = document.querySelectorAll("#star-rating .fa-star");

                stars.forEach((star, index) => {
                    // Xử lý sự kiện click
                    star.addEventListener("click", () => {
                        // Xóa lớp selected khỏi tất cả các ngôi sao
                        stars.forEach(s => s.classList.remove("selected"));

                        // Thêm lớp selected cho ngôi sao được chọn và tất cả ngôi sao trước đó
                        for (let i = 0; i <= index; i++) {
                            stars[i].classList.add("selected");
                        }

                        // In giá trị được chọn ra console
                        console.log("User selected rating:", star.getAttribute("data-value"));
                    });
                });
            });
            document.getElementById('addToCart').addEventListener('click', function () {
                var quantity = document.getElementById('quantity').value; // Lấy số lượng người dùng chọn
                var productId = document.getElementById('productId').value; // Lấy ID của sản phẩm
                // Cập nhật lại liên kết href với các tham số productId, quantity, và action
                this.href = "AddCart?productId=" + productId + "&quantity=" + quantity + "&action=addItem";
            });
        </script>


        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
