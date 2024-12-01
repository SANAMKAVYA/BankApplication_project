<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Services</title>
    <style>
        * {
            margin: 0;
            padding: 5px;
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
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #0047ab;
        }

        .service {
            margin-bottom: 20px;
        }

        .service h2 {
            color: #0047ab;
            margin-bottom: 10px;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 10px;
        }

        select:focus {
            outline: none;
            border-color: #0047ab;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #0047ab;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
        }

        .btn:hover {
            background-color: #003580;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Our Banking Services</h1>

        <!-- Personal Banking Services -->
        <div class="service">
            <h2>Personal Banking Services</h2>
            <select id="personalBanking">
                <option value="">Select a Personal Banking Service</option>
                <option value="savings">Savings Account</option>
                <option value="current">Current Account</option>
                <option value="fd">Fixed Deposits (FD)</option>
                <option value="cards">Debit and Credit Cards</option>
            </select>
        </div>

        <!-- Business Banking Services -->
        <div class="service">
            <h2>Business Banking Services</h2>
            <select id="businessBanking">
                <option value="">Select a Business Banking Service</option>
                <option value="loans">Business Loans and Credit</option>
                <option value="corporate-cards">Corporate Credit Cards</option>
                <option value="overdraft">Overdraft Facility</option>
            </select>
        </div>

        <!-- Digital Banking Services -->
        <div class="service">
            <h2>Digital Banking Services</h2>
            <select id="digitalBanking">
                <option value="">Select a Digital Banking Service</option>
                <option value="internet">Internet Banking</option>
                <option value="upi">UPI Payments</option>
            </select>
        </div>
        

        <button class="btn" onclick="handleSelection()">Explore Service</button>
        <br>
       &nbsp; &nbsp; <a href="Home.jsp"><button style="background-color: pink">Back To Home</button></a>
    </div>
    <script>
        function handleSelection() {
            const personal = document.getElementById('personalBanking').value;
            const business = document.getElementById('businessBanking').value;
            const digital = document.getElementById('digitalBanking').value;
            if (personal) {
                alert(`You selected: ${personal}`);
                // Redirect to specific personal banking page (if applicable)
                // window.location.href = `personalBanking.jsp?service=${personal}`;
            } else if (business) {
                alert(`You selected: ${business}`);
                // Redirect to specific business banking page
                // window.location.href = `businessBanking.jsp?service=${business}`;
            } else if (digital) {
                alert(`You selected: ${digital}`);
                // Redirect to specific digital banking page
                // window.location.href = `digitalBanking.jsp?service=${digital}`;
            } else {
                alert('Please select a service.');
            }
            
        }
    </script>
    
</body>
</html>