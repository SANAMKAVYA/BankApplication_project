<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        h2 {
            text-align: center;
            color: black;
            margin: 20px 0;
        }
        nav {
            background-color: #007BFF;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 15px;
            width: 100%;
            position: fixed;
            top: 0;
            text-align: center;
            z-index: 1000;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        li {
            display: inline;
            margin-right: 30px;
        }
        a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s;
        }
        a:hover {
            color: #e0e0e0;
        }
        .marquee-container {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
            width: 100vw;
        }
        marquee {
            width: 100%;
            font-family: Arial, sans-serif;
            color: #333;
        }
        .welcome-text {
            font-size: 50px;
            font-weight: bold;
            color: blue;
            margin: 0;
            padding-left: 50px; /* Moves the text slightly to the right */
        }
        .tagline {
            font-size: 30px;
            color: #555;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="deposit.jsp" method="post">Deposit</a></li>
            <li><a href="withdrawal.jsp">Withdraw</a></li>
            <li><a href="transactions.jsp">Transactions</a></li>
            <li><a href="balance.jsp">Balance Enquiry</a></li>
            <li><a href="Update.jsp">Update</a></li>
            <li><a href="Delete.jsp">Delete</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="LogOut.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="marquee-container">
        <marquee behavior="scroll" direction="left" scrollamount="10">
            <div>
                <h1 class="welcome-text" style="color: white">Welcome to MyBank</h1>
                <p class="tagline" style="color: white">Your Trusted Partner in Banking and Finance</p>
            </div>
        </marquee>
    </div>
</body>
</html>
