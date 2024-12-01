<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw</title>
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
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }
        label {
            margin-top: 10px;
            color: #006994;
            font-weight: bold;
        }
        input[type="number"],
        input[type="password"] {
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #006994;
            border-radius: 5px;
        }
        button {
            margin-top: 15px;
            padding: 10px;
            border: none;
            background-color: blue;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0FFCBE; /* Darker blue on hover */
        }
    </style>
</head>
<body> <form action="WithdrawServlet" method="POST">
            <label for="bankAccount">Bank Account Number:</label>
            <input type="number" id="bankAccount" name="bankAccount" required min="1">

            <label for="balance">Amount:</label>
            <input type="number" id="balance" name="balance" required min="1" step="0.01">

            <label for="pin">PIN:</label>
            <input type="password" id="pin" name="pin" required minlength="4" maxlength="4">

            <button type="submit">Withdraw</button>
            
            <% String s=(String)request.getAttribute("msg"); 
			if(s!=null)
				out.print(s);
%>
        </form>
    
</body>
</html>
>