<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<body>

    <head>
		<meta charset="ISO-8859-1">
        <title>Jurnal Prakerin</title>
        <link rel="stylesheet" type="text/css" href="style\style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <form class="w3-container w3-center w3-text-blue">
                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="email" type="text" placeholder="Email">
                            </div>
                        </div>

                        <div class="w3-row w3-section">
                            <div class="w3-rest">
                                <input class="w3-input w3-border inputtext" name="p" type="password" id="password" placeholder="Password">
                                <i class="far fa-eye" id="togglePassword"><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                                <br>
                            </div>
                        </div>

                        <button class="w3-button w3-blue inputtext btncontainer">Sign In</button>

                    </form>

                </div>

                <p style="font-family: custom4; font-size: 30px;">Atau</p>

                <div class="w3-container backgrounddiv2 w3-center">
                    <button class="backgrounddiv2btn" onclick="login()">
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


    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <!-- <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js"></script> -->
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
    <!-- <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-analytics.js"></script> -->

    <script>
        // Your web app's Firebase configuration
        var firebaseConfig = {
            apiKey: "AIzaSyCjutuAcjqKCwCGM8PkkBBs9wFVgyRAU3U",
            authDomain: "jurnalprakerin.firebaseapp.com",
            databaseURL: "https://jurnalprakerin.firebaseio.com",
            projectId: "jurnalprakerin",
            storageBucket: "jurnalprakerin.appspot.com",
            messagingSenderId: "678896514166",
            appId: "1:678896514166:web:a48ce52f20c6bbc72d5b57",
            measurementId: "G-ER030CHZSQ"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        // firebase.analytics();

        function login() {
            var provider = new firebase.auth.GoogleAuthProvider();
            firebase.auth().signInWithPopup(provider).then(function(result) {
                // This gives you a Google Access Token. You can use it to access the Google API.
                var token = result.credential.accessToken;
                // The signed-in user info.
                var user = result.user;
                // ...
            }).catch(function(error) {
                // Handle Errors here.
                var errorCode = error.code;
                var errorMessage = error.message;
                // The email of the user's account used.
                var email = error.email;
                // The firebase.auth.AuthCredential type that was used.
                var credential = error.credential;
                // ...
            });
        }

        function logout() {
            firebase.auth().signOut().then(function() {
                // Sign-out successful.
            }).catch(function(error) {
                // An error happened.
            });
        }
    </script>

</body>

<footer class="footerfont">
    <div class="backgrounddiv">
        <br><br>
    </div>
    <img src="images/icon.png" class="imglogofooter"> Jurnal Prakerin
</footer>

</html>