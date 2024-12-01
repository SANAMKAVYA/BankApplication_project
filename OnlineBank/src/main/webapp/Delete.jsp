<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
    <style>
        * {
            margin: 0;
            padding: 10px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5; /* Light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        .form-container {
            background-color: white; /* White background for the form */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #0047ab; /* Blue heading */
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f9f9f9; /* Light input background */
        }

        button {
            background-color: #f44336; /* Red button for delete */
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            font-weight: bold;
        }

        button:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }

        .signup-text {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }

        .signup-text a {
            color: #0047ab; /* Blue link */
            text-decoration: none;
        }

        .signup-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Delete Your Account</h2>
        <form action="DeleteAccountServlet" method="post">
            <div class="form-group">
                <label for="bankAccount">Account Number:</label>
                <input type="text" id="bankAccount" name="bankAccount" placeholder="Enter your Account Number" required>
            </div>
            <div class="form-group">
                <label for="pin">Pin:</label>
                <input type="pin" id="pin" name="pin" placeholder="Enter your pin " required>
            </div>
            <button type="Delete">Delete Account</button>
            <div class="signup-text">
                Changed your mind? <a href="dashboard.jsp">Go back</a>
            </div>
        </form>
    </div>
</body>
</html>