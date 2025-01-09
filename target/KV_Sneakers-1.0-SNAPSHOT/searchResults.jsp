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
            /* Reset some default styling */
            <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #ffffff; /* Nền trắng */
                color: #333333; /* Văn bản màu tối */
                margin: 0;
                padding: 0;
            }

            .unique-container {
                margin: 20px auto;
                max-width: 900px;
                width: 100%;
                padding: 20px;
                background-color: #ffffff; /* Nền trắng */
                border: 1px solid #C5837C; /* Đường viền màu chủ đạo */
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                font-size: 2em;
                color: #C5837C; /* Màu tiêu đề */
                text-align: center;
                margin-bottom: 20px;
            }

            .unique-no-results {
                text-align: center;
                font-size: 1.2em;
                color: #C5837C; /* Màu chữ khi không có kết quả */
            }

            .unique-product-card {
                display: flex;
                align-items: center;
                border: 1px solid #C5837C; /* Viền màu chủ đạo */
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 15px;
                background-color: #F9F9F9; /* Màu nền nhạt */
                transition: transform 0.2s, box-shadow 0.2s;
                text-decoration: none;
                color: inherit;
            }

            .unique-product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            }

            .unique-product-image {
                width: 120px;
                height: auto;
                border-radius: 8px;
                margin-right: 20px;
            }

            .unique-product-info {
                flex: 1;
            }

            .unique-product-info h3 {
                font-size: 1.5em;
                color: #333333; /* Văn bản chính màu tối */
                margin-bottom: 8px;
            }

            .unique-product-info p {
                font-size: 1em;
                color: #666666; /* Màu chữ phụ */
                margin-bottom: 6px;
            }

            .unique-product-price {
                font-weight: bold;
                color: #C5837C; /* Màu giá */
            }

            a {
                text-decoration: none;
                color: inherit;
            }

            footer {
                background-color: #F9F9F9; /* Footer nền nhạt */
                padding: 20px 0;
                text-align: center;
                color: #666666;
                margin-top: 20px;
                border-top: 1px solid #C5837C;
            }

            footer a {
                color: #C5837C; /* Link footer màu chủ đạo */
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="head.jsp"/>
        <div class="unique-container">

            <h2>Search Results for: "${keyword}"</h2>

            <!-- Display message if no products are found -->
            <c:if test="${empty products}">
                <p class="unique-no-results">No products found for "${keyword}".</p>
            </c:if>

            <!-- Display each product in a card format -->
            <c:forEach var="product" items="${products}">
                <a href="ViewDetails?id=${product.productId}">
                    <div class="unique-product-card">
                        <img class="unique-product-image" src="${product.image}" alt="${product.name}">
                        <div class="unique-product-info">
                            <h3>${product.name}</h3>
                            <p>${product.description}</p>
                            <p class="unique-product-price">Price: $${product.price}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
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
