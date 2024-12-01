<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Our Bank</title>
    <style>
        * {
            margin: 0;
            padding: 17px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            padding: 30px;
            background-image:url(https://storage.googleapis.com/a1aa/image/onmb7o3M4zb9GhFSn0JncynBG4ZOPwrSVScVpvr9MQTENw6E.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #0047ab;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #0047ab;
        }

        textarea {
            resize: none;
            height: 100px;
        }

        .btn {
            background-color: #0047ab;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
        }

        .btn:hover {
            background-color: #003580;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
        }

        .btn-back {
            background-color: #ccc;
        }

        .btn-back:hover {
            background-color: #bbb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contact Us</h1>
        <form action="submitContact.jsp" method="POST">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" placeholder="Your Message" required></textarea>

            <div class="btn-container">
                <a href="Home.jsp" class="btn btn-back">Back to Home</a>
                <button type="submit" class="btn">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
