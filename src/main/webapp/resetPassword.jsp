<%-- 
    Document   : login
    Created on : Nov 18, 2024, 8:58:39 PM
    Author     : thaiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            /* Tổng thể trang */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            /* Khung đăng nhập và mô tả */
            .login_form_container {
                display: flex; /* Sử dụng Flexbox để sắp xếp */
                justify-content: center; /* Căn giữa */
                align-items: flex-start; /* Căn trên */
                margin-top: 20px;
            }

            .description {
                flex: 1; /* Chiếm 50% chiều rộng */
                padding: 20px; /* Thêm khoảng cách bên trong */
                background-color: #f2f2f2; /* Màu nền sáng */
                border-radius: 10px 0 0 10px; /* Bo tròn góc bên trái */
                color: #333; /* Màu chữ tối hơn */
            }

            .login-container {
                flex: 1; /* Chiếm 50% chiều rộng */
                background-color: #ffffff; /* Màu nền trắng cho form */
                border-radius: 0 10px 10px 0; /* Bo tròn góc bên phải */
                padding: 30px 40px; /* Padding cho khung đăng nhập */
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Bóng đổ */
                max-width: 400px; /* Đặt chiều rộng tối đa */
                text-align: center; /* Căn giữa chữ */
            }

            .login-title {
                font-size: 28px;
                margin-bottom: 20px;
                font-weight: bold;
                color: #333; /* Màu chữ tối hơn */
            }

            .login-message {
                color: #d9534f; /* Màu đỏ nhạt cho thông báo */
                font-size: 14px;
                margin-bottom: 10px;
            }

            .login-form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            /* Input và label */
            .login-form label {
                font-weight: bold;
                color: #333; /* Màu chữ tối hơn */
                text-align: left;
            }

            .login-form input[type="text"],
            .login-form input[type="password"] {
                padding: 12px;
                font-size: 16px;
                color: #333; /* Màu chữ tối hơn */
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                transition: 0.3s ease;
            }

            .login-form input[type="text"]:focus,
            .login-form input [type="password"]:focus {
                border-color: #5bc0de; /* Màu xanh nhạt khi focus */
            }

            /* Nút đăng nhập */
            .login-form input[type="submit"] {
                background-color: #C5837C; /* Màu xanh nhạt cho nút */
                color: #fff;
                font-size: 16px;
                font-weight: bold;
                padding: 12px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .login-form input[type="submit"]:hover {
                background-color: #C17A74; /* Màu xanh đậm hơn khi hover */
            }

            /* Liên kết tạo tài khoản */
            .extra-links {
                margin-top: 20px;
                font-size: 14px;
            }

            .extra-links a {
                color: #C5837C; /* Màu xanh nhạt cho liên kết */
                text-decoration: none;
            }

            .extra-links a:hover {
                text-decoration: underline;
            }

            /* Đăng nhập qua Google */
            .oauth-login {
                margin-top: 20px;
                text-align: center;
            }

            .oauth-login img {
                width: 40px;
                height: 40px;
                transition: transform 0.3s ease;
            }

            .oauth-login img:hover {
                transform: scale(1.1);
            }

        </style>
        <link rel="stylesheet" href="css/style.css"/>
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

    </head>
    <body>
        <jsp:include page="head.jsp" />
        <!-- Section: Design Block -->
        <section class="">
            <!-- Jumbotron -->
            <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
                <div class="container">
                    <div class="row gx-lg-5 align-items-center">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <h1 class="my-5 display-3 fw-bold ls-tight">
                                Forgot Password? <br />
                                <span class="text-primary">We can help you reset it!</span>
                            </h1>
                        </div>

                        <div class="card-body py-5 px-md-5">
                            <h2>Reset Your Password</h2>
                            <form action="ResetPasswordServlet" method="post">
                                <input type="hidden" name="token" value="${param.token}" />
                                 <input type="hidden" name="userName" value="${requestScope.userName}" />
                                
                                <div class="form-group">
                                    <label for="newPassword">Enter New Password:</label>
                                    <input type="password" id="newPassword" name="newPassword" required />
                                </div>
                                  <div class="form-group">
                                    <label for="newPassword">Confirm Password:</label>
                                    <input type="password" id="newPassword" name="Confirm_Password" required />
                                </div>

                                <button type="submit" class="btn">Reset Password</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Jumbotron -->
        </section>


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
    </body>
</html>
