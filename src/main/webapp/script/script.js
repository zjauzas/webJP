function navnav() {
    var x = document.getElementById("topnavnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

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