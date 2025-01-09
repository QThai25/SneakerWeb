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

        <!-- Unique CSS -->
        <style>
            .kv-form-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                padding: 20px 30px;
                box-sizing: border-box;
                position: relative;
                margin-left: 35%;
            }

            .kv-form-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                padding: 20px 30px;
            }

            .kv-form-container h2 {
                text-align: center;
                color: #C5837C;
                margin-bottom: 20px;
            }

            .kv-form-group {
                margin-bottom: 15px;
            }

            .kv-form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
                color: #333;
            }

            .kv-form-group input,
            .kv-form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
                outline: none;
            }

            .kv-form-group input:focus {
                border-color: #C5837C;
            }

            .kv-form-group select {
                background-color: #fff;
            }

            .kv-form-buttons {
                display: flex;
                justify-content: space-between;
                gap: 10px;
            }

            .kv-form-buttons button {
                flex: 1;
                padding: 10px;
                border: none;
                border-radius: 5px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s;
            }

            .kv-btn-submit {
                background-color: #C5837C;
                color: white;
            }

            .kv-btn-submit:hover {
                background-color: #A45D5B;
            }

            .kv-btn-reset {
                background-color: #f5f5f5;
                border: 1px solid #ccc;
                color: #333;
            }

            .kv-btn-reset:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <jsp:include page="head.jsp"/>
        <div class="kv-form-container">
            <h2>Update User Info</h2>
            <form action="EditAccount" method="post">
                <!-- Username -->
                <div class="kv-form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${username}" readonly>
                </div>

                <!-- Full Name -->
                <div class="kv-form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" value="" required>
                </div>

                <!-- Password -->
                <div class="kv-form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" value="" required>
                </div>

                <!-- Email -->
                <div class="kv-form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="" required>
                </div>

                <!-- Role -->
                <div class="kv-form-group">
                    <label for="role">Role</label>
                    <select id="role" name="role">
                        <option value="admin" selected>Admin</option>
                        <option value="customer">Customer</option>
                    </select>
                </div>

                <!-- Phone -->
                <div class="kv-form-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" value="" required>
                </div>

                <!-- Birthday -->
                <div class="kv-form-group">
                    <label for="birthday">Birthday</label>
                    <input type="date" id="birthday" name="birthday" value="" required>
                </div>

                <!-- Buttons -->
                <div class="kv-form-buttons">
                    <button type="submit" name="edit" value="editSubmit" class="kv-btn-submit">Update</button>
                    <button type="reset" class="kv-btn-reset">Reset</button>
                </div>
            </form>
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

