<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> --%>
<html>

<body>

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

    </head>

    <header>
        <p class="fontlogo">
            <img src="images/title.png" class="imglogo"> Jurnal Prakerin
        </p>
    </header>

    <div class="topnav" id="topnavnav">
        <div class="topnav-centered">
            <a href="index.jsp#Signin">Sign In</a>
            <a href="index.jsp#Signup">Sign Up</a>
        </div>
    </div>

    <div class="maincontainer" id="app">
        <div class="container">
            <div class="pagecontainer" id="Signin">
                <br>
                <p style="font-family: custom4;">SIGN IN</p>
                <div class="w3-container backgrounddiv2 w3-center">
                    <h2 style="font-family: custom4; font-size: 20px;">Sign In dengan Email dan Password</h2>
                </div>
                <div id="card">
                    <div id="card-content">
                        <div class="form inputtext">
                            <input id="email" class="form-content" type="email" name="email" autocomplete="on" required placeholder="Email" />
                            <div class="form-border"></div>
                            <input style="margin-top: 10px;" id="password" class="form-content" type="password" name="password" required placeholder="Password" />
                            <div class="form-border"></div>
                            <i class="far fa-eye" id="togglePassword" style="font-size: 15px;"><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                            <button class="btncontainer" id="btnSignIn">Sign In</button>
                            <div class="textinsidecard">
                                <br>Atau,<br>Sign In dengan akun Google
                            </div>
                            <button class="btncontainer" id="btnSignInGoogle">
                                <i class="fa fa-google"></i>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign In
                            </button>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="Signup">
            <div class="pagecontainer">
                <br>
                <p style="font-family: custom4;">SIGN UP</p>
                <div class="w3-container w3-center backgrounddiv2">
                    <h2 style="font-family: custom4; font-size: 20px;">Lakukan Sign Up dengan mengisi form email dan password berikut:</h2>
                </div>
                <div id="card" style="height: 45%;">
                    <div id="card-content">
                        <div class="form inputtext">
                            <input placeholder="Email" id="emailSignUp" class="form-content" type="email" name="email" autocomplete="on" required />
                            <div class="form-border"></div>
                            <input placeholder="Password" id="passwordSignUp" class="form-content" type="password" name="password" required/>
                            <div class="form-border"></div>
                            <i class="far fa-eye" id="togglePasswordSignUp" style="font-size: 15px;"><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                            <button class="btncontainer" id="btnSignUp">Sign Up</button>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="script/index.js"></script>

</body>

<footer class="footerfont">
    <div class="backgrounddiv">
        <br><br>
    </div>
    <img src="images/icon.png" class="imglogofooter"> Jurnal Prakerin
</footer>

</html>