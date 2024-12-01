<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            max-width: 350px;
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .submit {
            border: none;
            outline: none;
            background-color: royalblue;
            padding: 10px;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submit:hover {
            background-color: rgb(56, 90, 194);
        }
    </style>
</head>
<body>
    <form class="form" action="ResetPasswordServlet" method="post">
         <h2>Reset Your PIN</h2>
    <form action="update_pin" method="post">
        <input type="hidden" name="bankAccount" value="<%= request.getParameter("bankAccount") %>" />
        <label for="newPin">New PIN:</label>
        <input type="password" name="newPin" placeholder="Enter New PIN" required /><br>
        
        <label for="confirmPin">Confirm New PIN:</label>
        <input type="password" name="confirmPin" placeholder="Confirm New PIN" required /><br>
        
        <button type="submit" class="submit">Reset PIN</button>
    </form>
    </form>
</body>
</html>