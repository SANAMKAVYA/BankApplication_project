<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Bank Details</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0047ab;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none;
        }

        .submit-btn {
            background-color: #0047ab;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            font-weight: bold;
        }

        .submit-btn:hover {
            background-color: #003080;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Update User Details</h2>
        <form action="UpdateUser" method="post"> <!-- Ensure this matches your servlet mapping -->
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your Full Name" required>
            </div>
            
            <div class="form-group">
                <label for="mobile">Phone Number:</label>
                <input type="text" id="mobile" name="mobile" placeholder="Enter Phone Number" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter your full address" required>
            </div>

            <div class="form-group">
                <label for="pin">Set 4-Digit Pin:</label>
                <input type="number" id="pin" name="pin" placeholder="Enter 4-Digit Pin" required>
            </div>  

            <button type="submit" class="submit-btn">Update Details</button>
        </form>
    </div>
</body>
</html>
