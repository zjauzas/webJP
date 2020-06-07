<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<body>

    <head>
        <title>Jurnal Prakerin</title>
        <link rel="stylesheet" type="text/css" href="style\style.css">
        </link>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- harus ditaro dipaling atas antara semua firebase sdk firebase-app.js -->
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
            <a href="signinup.html#Signin" onclick="navnav()">Sign In</a>
            <a href="signinup.html#Signup" onclick="navnav()">Sign Up</a>
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
                <div class="formcontainer">
                    <div class="w3-container w3-center w3-text-blue">
                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="email" type="email" placeholder="Email" id="email">
                            </div>
                        </div>

                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="password" type="password" id="password" placeholder="Password">
                                <i class="far fa-eye" id="togglePassword"><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                                <br>
                            </div>
                        </div>

                        <button class="w3-button w3-blue inputtext btncontainer" id="btnSignIn">Sign In</button>
                        <button class="w3-button w3-blue inputtext btncontainer" id="btnSignUp">Sign Up</button>
                        <button class="w3-button w3-blue inputtext btncontainer" id="btnSignOut">Sign out</button>

                    </div>
                    <!-- <input name="email" type="email" placeholder="Email" id="email">
                    <input name="password" type="password" id="password" placeholder="Password">
                    <button id="btnSignIn">Sign In</button>
                    <button id="btnSignUp">Sign Up</button>
                    <button id="btnSignOut">Sign Out</button> -->
                </div>

                <p style="font-family: custom4; font-size: 30px;">Atau</p>

                <div class="w3-container backgrounddiv2 w3-center">
                    <button class="backgrounddiv2btn" id="btnSignInGoogle">
                        <i class="fa fa-google"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign In dengan Akun Google</button>
                    <br>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="Signup">
            <div class="pagecontainer">
                <br>
                <p style="font-family: custom4;">SIGN UP</p>
                <div class="w3-container w3-center backgrounddiv2">
                    <h2 style="font-family: custom4; font-size: 20px;">Lakukan Sign Up dengan mengisi form berikut:</h2>
                </div>
                <div class="formcontainer">
                    <!-- <form action="/action_page.php" class="w3-container w3-center w3-text-blue">
                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="email" type="text" placeholder="Email">
                            </div>
                        </div>

                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="password" type="password" placeholder="Password">
                            </div>
                        </div>

                        <button class="w3-button w3-blue inputtext btncontainer">Sign Up</button>

                    </form> -->
                </div>
            </div>
            <br><br><br>
        </div>
        <hr>
    </div>






    <script type="text/javascript" src="script/script.js"></script>
    <script type="text/javascript" src="script/firebase.js"></script>

</body>

<footer class="footerfont">
    <div class="backgrounddiv">
        <br><br>
    </div>
    <img src="images/icon.png" class="imglogofooter"> Jurnal Prakerin
</footer>

</html>