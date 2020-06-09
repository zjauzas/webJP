(function() {
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

    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
        } else {
            console.log('not logged in');
        }
    });

    const btnSignOut = document.getElementById('btnSignOut');
    btnSignOut.addEventListener('click', e => {
        firebase.auth().signOut();
        window.location = 'index.jsp';
    });

    var popup = document.getElementById('ubahBtn');
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }



}());