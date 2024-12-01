<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProfileDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
            flex-direction: column;
            height: 100vh;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        .form-container, .table-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin: 20px 0;
        }

        h1 {
            text-align: center;
            color: purple;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }

        th, td {
            border: 2px solid black;
            text-align: center;
            padding: 10px;
            font-size: 16px;
        }

        th {
            background-color: #0047ab;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .error-message {
            color: red;
            text-align: center;
        }
        
        .input-group {
            margin-bottom: 15px;
        }

        input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #0047ab;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #003494;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Enter Your Bank Account Number</h1>
        <form action="profileform" method="post">
            <div class="input-group">
                <label for="bankAccount">Bank Account Number:</label>
                <input type="number" name="bankAccount" id="bankAccount" required>
            </div>
            <button type="submit">Get Profile</button>
        </form>
    </div>

    <div class="table-container">
        <h1>User Profile</h1>

        <% 
            ProfileDao user = (ProfileDao) request.getAttribute("user");
            String errorMsg = (String) request.getAttribute("errorMsg");
        %>

        <% if (errorMsg != null) { %>
            <p class="error-message"><%= errorMsg %></p>
        <% } %>

        <table>
            <tr>
                <th>Full Name</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Bank Account No</th>
                <th>Aadhar Number</th>
            </tr>
            <tr>
                <td><%= user != null ? user.getName() : "N/A" %></td>
                <td><%= user != null ? user.getMobile() : "N/A" %></td>
                <td><%= user != null ? user.getAddress() : "N/A" %></td>
                <td><%= user != null ? user.getBankAccountNo() : "N/A" %></td>
                <td><%= user != null ? user.getAadhar() : "N/A" %></td>
            </tr>
        </table>
    </div>
    <a href="dashboard.jsp"><button>Go to DashBoard</button></a>

</body>
</html>
