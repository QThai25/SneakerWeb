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
    </head>

    <body>
        <jsp:include page="head.jsp"/>

        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 200px">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link" data-toggle="dropdown">Famous in the world <i class="fa fa-angle-down float-right mt-1"></i></a>
                                <div class="dropdown-menu bg-secondary border-0 rounded-0 w-100 m-0">
                                    <a href="ViewShopDetails?id=1&cat_name=Balenciaga" class="dropdown-item">Balenciaga</a>
                                    <a href="ViewShopDetails?id=2&cat_name=Chanel" class="dropdown-item">Chanel</a>
                                    <a href="ViewShopDetails?id=3&cat_name=Dior" class="dropdown-item">Dior</a>
                                    <a href="ViewShopDetails?id=4&cat_name=Gucci" class="dropdown-item">Gucci</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 200px">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link" data-toggle="dropdown">Favourite In VietNam <i class="fa fa-angle-down float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                    <a href="ViewShopDetails?id=5&cat_name=Ananas" class="dropdown-item">Ananas</a>
                                    <a href="ViewShopDetails?id=6&cat_name=Bitis" class="dropdown-item">Bitis</a>
                                    <a href="ViewShopDetails?id=7&cat_name=Shondo" class="dropdown-item">Shondo</a>
                                </div>

                            </div>
                    </nav>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 200px">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link" data-toggle="dropdown">Most Favourite<i class="fa fa-angle-down float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                    <a href="ViewShopDetails?id=8&cat_name=Adidas" class="dropdown-item">Adidas</a>
                                    <a href="ViewShopDetails?id=9&cat_name=Converse" class="dropdown-item">Converse</a>
                                    <a href="ViewShopDetails?id=10&cat_name=Jordan" class="dropdown-item">Jordan</a>
                                    <a href="ViewShopDetails?id=11&cat_name=New Balance" class="dropdown-item">New Balance</a>
                                    <a href="ViewShopDetails?id=12&cat_name=Nike" class="dropdown-item">Nike</a>
                                    <a href="ViewShopDetails?id=13&cat_name=Vans" class="dropdown-item">Vans</a>
                                </div>
                            </div>
                    </nav>
                </div>

                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <img style="width: 250px; display: flow-root;" src="img/logo/3.png" alt="alt"/>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home.jsp" class="nav-item nav-link active">Home</a>
                                <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                                <a href="ViewShopDetails?id=1&cat_name=Balenciaga" class="nav-item nav-link">Shop Detail</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="AddCart?action=viewCart" class="dropdown-item">Shopping Cart</a>
                                        <a href="checkout.html" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <%-- Kiểm tra nếu người dùng đã đăng nhập --%>
                                <%
                                    User currentUser = (User) session.getAttribute("currentUser");
                                    if (currentUser != null) {
                                        if (currentUser.getRole().equals("admin")) {
                                %>
                                <a href="EditAccount" class="nav-item nav-link">Edit Account</a>
                                <%
                                    }
                                %>
                                <a href="profile.jsp?id=${currentUser.userId}" class="nav-item nav-link">Profile</a>
                                <a href="LogoutServlet" class="nav-item nav-link">Logout</a>
                                <% } else { %>
                                <a href="login.jsp" class="nav-item nav-link">Login</a>
                                <a href="register.jsp" class="nav-item nav-link">Register</a>
                                <% }%>
                            </div>
                        </div>
                    </nav>

                    <!-- Product List Start -->
                    <div class="container mt-4">
                        <h2>${catName} - Product List</h2>
                        <div class="product-container d-flex flex-wrap">
                            <c:forEach var="product" items="${products}">
                                <div class="product-item border p-3 m-2 text-center" style="width: 20%;">
                                    <img src="${product.image}" alt="${product.name}" class="img-fluid mb-3" style="width: 200px; height: 150px;">
                                    <h3 class="h6">${product.name}</h3>
                                    <p>${product.price} USD</p>
                                    <a href="ViewDetails?id=${product.productId}" class="btn btn-primary btn-sm">View Details</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Product List End -->
                </div>
            </div>
        </div>
        <!-- Navbar End -->

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
