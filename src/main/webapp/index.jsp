<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html> -->
<html>

<head>
    <title>Jurnal Prakerin</title>
    <link rel="stylesheet" type="text/css" href="style\style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-database.js"></script>
    <!-- <script defer src="script/init-firebase.js"></script> -->

    <script defer type="text/javascript" src="script/index.js"></script>

</head>

<header>
    <p class="fontlogo">
        <img src="images/title.png" class="imglogo"> Jurnal Prakerin
    </p>
</header>

<body>
    <main>
        <div class="maincontainer" id="app">
            <div class="container">
                <div class="pagecontainer" id="Signin">
                    <div id="card">
                        <div id="card-content">
                            <div class="form inputtext">
                                <input id="email" class="form-content" type="email" name="email" autocomplete="on" required placeholder="Email" />
                                <div class="form-border"></div>
                                <input style="margin-top: 10px;" id="password" class="form-content" type="password" name="password" required placeholder="Password" />
                                <div class="form-border"></div>
                                <i class="far fa-eye" id="togglePassword" style="font-size: 15px; margin-top: 15px; "><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                                <button class="btncontainer" id="btnSignIn">Sign In</button>
                                <div class="textinsidecard">
                                    <br>Atau,<br>Sign Up dengan
                                </div>
                                <button onclick="window.location.href='signup.jsp'" class="btncontainer">
                                    <i class="fa fa-envelope"></i> 
                                    &nbsp;&nbsp;&nbsp;Email
                                </button>
                                <button class="btncontainer" id="btnSignInGoogle">
                                    <i class="fa fa-google"></i>
                                    &nbsp;&nbsp;Google
                                </button>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
<footer class="footerfont">
    <div class="backgrounddiv"></div>
</footer>

</html>