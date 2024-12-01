<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
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
            width: 100%;
        }

        .title {
            font-size: 28px;
            color: royalblue;
            font-weight: 600;
            letter-spacing: -1px;
            display: flex;
            align-items: center;
            padding-left: 30px;
            position: relative;
        }

        .title::before,
        .title::after {
            position: absolute;
            content: "";
            border-radius: 50%;
            background-color: royalblue;
            left: 0;
        }
        .title::before {
            width: 18px;
            height: 18px;
        }
        .title::after {
            width: 18px;
            height: 18px;
            animation: pulse 1s linear infinite;
        }
        .message, .signin {
            color: rgba(88, 87, 87, 0.822);
            font-size: 14px;
        }
        .signin {
            text-align: center;
        }
        .signin a {
            color: royalblue;
        }
        .signin a:hover {
            text-decoration: underline;
        }
        .flex {
            display: flex;
            width: 100%;
            gap: 6px;
        }
        .form label {
            position: relative;
        }
        .form label .input {
            width: 100%;
            padding: 10px 10px 20px;
            outline: none;
            border: 1px solid rgba(105, 105, 105, 0.397);
            border-radius: 10px;
        }
        .form label .input + span {
            position: absolute;
            left: 10px;
            top: 15px;
            color: grey;
            font-size: 0.9em;
            cursor: text;
            transition: 0.3s ease;
        }
        .form label .input:placeholder-shown + span {
            top: 15px;
            font-size: 0.9em;
        }
        .form label .input:focus + span,
        .form label .input:valid + span {
            top: 30px;
            font-size: 0.7em;
            font-weight: 600;
        }
        .form label .input:valid + span {
            color: green;
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
        @keyframes pulse {
            from {
                transform: scale(0.9);
                opacity: 1;
            }
            to {
                transform: scale(1.8);
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <form class="form" action="login" method="post">
        <p class="title">Sign In</p>
        <label>
            <input required type="text" name="bankAccount" class="input" placeholder="">
            <span>Account Number</span>
        </label>
        <label>
            <input required type="password" class="input" name="pin" placeholder="">
            <span>pin</span>
        </label>
        <button class="submit">Sign In</button>
        <div class="links">
            <a href="ResetPin.jsp">Forget Pin?</a>
            <a href="CreateAccount.jsp">Don't have an Account</a>
        </div>
    </form>	
</body>
</html>