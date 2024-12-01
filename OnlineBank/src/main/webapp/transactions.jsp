<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Transaction" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #0FFCBE; /* Light mint background */
            margin: 0;
            padding: 170px;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        h2 {
            color: blue; /* Dark blue for the heading */
            margin-top: 20px;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: blue; /* Dark blue for headers */
            color: white; /* White text for headers */
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #D1E7DD; /* Light mint hover effect */
        }
        .action-form {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Transaction History for Account: <%= request.getAttribute("accountNumber") %></h2>
    
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Account Number</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Transaction Date</th>
        </tr>
        <%
            List<Transaction> transactionHistory = (List<Transaction>) request.getAttribute("transactionHistory");
            if (transactionHistory != null && !transactionHistory.isEmpty()) {
                for (Transaction transaction : transactionHistory) {
        %>
            <tr>
                <td><%= transaction.getTransactionId() %></td>
                <td><%= transaction.getBankAccount() %></td>
                <td><%= transaction.getTransactionType() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getTransactionDate() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">No transactions found.</td>
            </tr>
        <%
            }
        %>
    </table>

    <!-- Action Form to Search Another Account -->
    <div class="action-form">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
        <h3 style="color: white">Search for Another Account</h3>
        
        <form action="viewTransactions" method="get">
            <label for="accountNumber" style="color: white">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Button to go back to home page -->
    <div class="action-form">
        <form action="dashboard.jsp" method="get">
            <button type="submit">Back to Dasboard</button>
        </form>
    </div>
</body>
</html>