(function() {

    // TODO: Replace the following with your app's Firebase project configuration
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

    const txtEmailSignUp = document.getElementById('emailSignUp');
    const txtPasswordSignUp = document.getElementById('passwordSignUp');

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