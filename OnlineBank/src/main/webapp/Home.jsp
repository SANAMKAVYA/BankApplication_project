<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyBank - Home</title>
    <style>
        * {
            margin: 0;
            padding: 7px;
            box-sizing: border-box;
            font-family: Arial, sans-serif; 
        }

        body {
            background-color: #f4f4f4;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        /* Header Navigation Bar */
        header {
            background-color: #0047ab;
            color: white;
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        /* Hero Section */
        .hero {
            height: 80vh;
            background-image: url('bank-banner.jpg'); /* Replace with your image */
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column; /* Allows stacking of elements */
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .hero a {
            text-decoration: none;
            background-color: #ff9900;
            color: white;
            padding: 15px 30px;
            border-radius: 2px;
            font-weight: bold;
            margin: 10px 5px; /* Space between buttons */
        }

        .hero a:hover {
            background-color: #ff7700;
        }

        /* Services Section */
        .services {
            padding: 50px;
            display: flex;
            justify-content: space-around;
            background-color: #fff;
        }

        .service {
            text-align: center;
            width: 30%;
        }

        .service h2 {
            margin-bottom: 10px;
            color: #0047ab;
        }

        .service p {
            color: #666;
        }

        /* Footer Section */
        footer {
            background-color: #0047ab;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer-link {
            color: #ffcc00;
            text-decoration: none;
        }

        .footer-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <a href="Home.jsp" class="logo">MyBank</a>
        <nav>
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="CreateAccount.jsp">Create Account</a></li>
                <li><a href="Services.jsp">Services</a></li>
                <li><a href="About.jsp">About Us</a></li>
                <li><a href="ContactUs.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <marquee behavior="scroll" direction="left" scrollamount="10">
            <h1 style="color: white;">Welcome to MyBank</h1>
            <p style="color: white;">Your Trusted Partner in Banking and Finance</p>
        </marquee>
        <div>
            <a href="CreateAccount.jsp">Open an Account</a>
            <a href="Login.jsp">Login into Account</a>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="service">
            <h2>Personal Banking</h2>
            <p>Manage your savings, loans, and more with ease.</p>
        </div>
        <div class="service">
            <h2>Business Banking</h2>
            <p>Optimize your finances with our business solutions.</p>
        </div>
        <div class="service">
            <h2>Investments</h2>
            <p>Grow your wealth with expert investment advice.</p>
        </div>
    </section>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 MyBank. All rights reserved. | Privacy Policy</a></p>
    </footer>

</body>
</html>