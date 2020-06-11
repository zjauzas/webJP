(function() {
    // Your web app's Firebase configuration
    const firebaseConfig = {
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

    // initialize the component with const
    const txtEmail = document.getElementById('email');
    const txtPassword = document.getElementById('password');
    const txtEmailSignUp = document.getElementById('emailSignUp');
    const txtPasswordSignUp = document.getElementById('passwordSignUp');

    // add signin btn event    
    const btnSignIn = document.getElementById('btnSignIn');
    btnSignIn.addEventListener('click', e => {
        const email = txtEmail.value;
        const password = txtPassword.value;
        firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
            // var errorCode = error.code;
            var errorMessage = error.message;
            window.alert("Error : " + errorMessage);
        });
    });

    const btnSignUp = document.getElementById('btnSignUp');
    btnSignUp.addEventListener('click', e => {
        const email = txtEmailSignUp.value;
        const password = txtPasswordSignUp.value;
        firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
            // var errorCode = error.code;
            var errorMessage = error.message;
            window.alert("Error : " + errorMessage);
        });
    });

    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            window.location = 'home.jsp';
            console.log(firebaseUser);
        } else {
            console.log('not logged in');
        }
    });

    const btnSignInGoogle = document.getElementById('btnSignInGoogle');
    btnSignInGoogle.addEventListener('click', e => {
        var provider = new firebase.auth.GoogleAuthProvider();
        firebase.auth().signInWithRedirect(provider);
        firebase.auth().getRedirectResult().then(function(result) {
            if (result.credential) {
                // This gives you a Google Access Token. You can use it to access the Google API.
                var token = result.credential.accessToken;
                // ...
            }
            // The signed-in user info.
            var user = result.user;
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
    });

    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#password');

    togglePassword.addEventListener('click', function(e) {
        // toggle the type attribute
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        // toggle the eye slash icon
        this.classList.toggle('fa-eye-slash');
    });

    const togglePasswordSignUp = document.querySelector('#togglePasswordSignUp');
    const passwordSignUp = document.querySelector('#passwordSignUp');

    togglePasswordSignUp.addEventListener('click', function(e) {
        // toggle the type attribute
        const type = passwordSignUp.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordSignUp.setAttribute('type', type);
        // toggle the eye slash icon
        this.classList.toggle('fa-eye-slash');
    });


}());