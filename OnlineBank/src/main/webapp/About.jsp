<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Our Bank</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f4f4f4;
            padding: 20px;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #0047ab;
        }

        p {
            margin-bottom: 15px;
            line-height: 1.6;
            color: #555;
        }

        .section-title {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #0047ab;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #003580;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>About Us</h1>

        <p>Welcome to <strong>Our Bank</strong>, a trusted financial institution dedicated to serving our customers with integrity and excellence. For years, we have been committed to helping individuals and businesses achieve their financial goals through a wide range of products and services.</p>

        <div class="section">
            <h2 class="section-title">Our Mission</h2>
            <p>Our mission is to empower people and businesses by providing innovative, secure, and accessible financial solutions that improve lives and contribute to economic growth.</p>
        </div>

        <div class="section">
            <h2 class="section-title">Our Vision</h2>
            <p>We envision becoming the most customer-centric bank by continuously innovating and ensuring the highest level of customer satisfaction and financial well-being.</p>
        </div>

        <div class="section">
            <h2 class="section-title">Our Values</h2>
            <ul>
                <li>Integrity: We operate with the highest level of transparency and trust.</li>
                <li>Customer First: We prioritize the needs of our customers above all.</li>
                <li>Innovation: We embrace change to provide the best financial solutions.</li>
                <li>Excellence: We strive to exceed expectations in everything we do.</li>
            </ul>
        </div>

        <p>If you have any questions or want to learn more about our bank, feel free to contact us. We look forward to helping you achieve your financial goals!</p>

        <div class="btn-container">
            <a href="Home.jsp" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>
