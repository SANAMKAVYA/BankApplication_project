<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #5F7D8E;
            margin: 0;
            padding: 120px;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: blue;
        }
        label {
            margin: 10px 0 5px;
            display: block; /* Changed from 'black' to 'block' */
            font-weight: bold;
        }
        input[type="number"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0FFCBE;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Deposit Funds</h2>
        <form action="DepositServlet" method="POST">
            <label for="bankAccount">Bank Account Number:</label>
            <input type="number" id="bankAccount" name="bankAccount" required min="1">

            <label for="balance">Amount:</label>
            <input type="number" id="balance" name="balance" required min="1" step="0.01">

            <label for="pin">PIN:</label>
            <input type="password" id="pin" name="pin" required minlength="4" maxlength="4">

            <button type="submit">Deposit</button>
            
            <% String s=(String)request.getAttribute("msg"); 
			if(s!=null)
				out.print(s);
%>
        </form>
    </div>
</body>
</html>