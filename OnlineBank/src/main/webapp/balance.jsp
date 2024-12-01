<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balance Enquiry</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #0FFCBE; /* Light mint background */
            margin: 0;
            padding: 140px;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        h2 {
            color: blue; /* Dark blue for the heading */
            margin-top: 20px;
        }
        form {
            margin-top: 20px;
            width: 300px; /* Fixed width for the form */
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%; /* Full width for submit button */
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        p {
            font-size: 1.2em;
            color: grey; /* Dark blue for the balance text */
            background-color: #ffffff;
            padding: 10px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }
        a {
            margin-top: 20px;
            text-decoration: none;
            color: blue;
            font-weight: bold;
            padding: 10px 15px;
            border: 2px solid blue;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: white;
        }
        a:hover {
            background-color: blue; /* Dark blue background on hover */
            color: #0FFCBE; /* Mint color for text on hover */
        }
    </style>
</head>
<body>
    <a href="balance.jsp" >Check Balance</a> <!-- Link to refresh the page -->
    <h2 style="color: grey">Your Current Balance</h2>
    
    <br>
     <br>
      <br>
       <br>
        <br>
    <br>
     <br>
      <br>
       <br>
        
    
    <form action="GetBalanceServlet" method="POST"> <!-- Action set to GetBalanceServlet -->
        <label for="bankAccount" style="color: white">Account Number:</label>
        <input type="text" id="bankAccount" name="bankAccount" required> <!-- Fixed ID to match the name -->
        <input type="submit" value="Get Balance">
    </form>

    <p style="color: grey">Your current balance is: ₹ <%= (request.getAttribute("balance") != null) ? request.getAttribute("balance") : "0.00" %></p>
    <a href="dashboard.jsp"><button>Go To Dashboard</button></a>
</body>
</html>