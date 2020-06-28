//firebase instance initialize
const database = firebase.database();

firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {
        console.log(firebaseUser);
        displayOnLoad()
    } else {
        window.location = 'index.jsp';
        console.log('not logged in');
    }
})

const btnSignOut = document.getElementById('btnSignOut');
btnSignOut.addEventListener('click', e => {
    firebase.auth().signOut();
    window.location = 'index.jsp';
});

const popupProfil = document.getElementById('ubahBtn');
window.onclick = function(event) {
    if (event.target == popupProfil) {
        popupProfil.style.display = "none";
    }
}

const nama = document.getElementById('namaInput');
const nis = document.getElementById('nisInput');
const ttl = document.getElementById('ttlInput');
const jk = document.getElementById('jkInput');
const nope = document.getElementById('nopeInput');
const alamat = document.getElementById('alamatInput');
const tempatPrakerin = document.getElementById('tempatPrakerinInput');
const namaPembimbing = document.getElementById('namaPembimbingInput');

const editProfileBtn = document.getElementById('editProfileBtn')
editProfileBtn.addEventListener('click', e => {
    var userId = firebase.auth().currentUser.uid;
    firebase.database().ref('siswa/' + userId).limitToFirst(1).once("value", snapshot => {
        if (snapshot.exists()) {
            // alert(userId)
            displayProfile()
        } else {
            console.log('data diri for uid' + userId + ' not exist')
        }
    });
})

function displayProfile() {
    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
        } else {
            window.location = 'index.jsp';
            console.log('not logged in');
        }
    })
    var userId = firebase.auth().currentUser.uid;
    const siswaRef = database.ref('siswa/' + userId);
    siswaRef.on("value", function(snapshot) {
        var childData = snapshot.val();
        $('#namaInput').val(childData.nama);
        $('#nisInput').val(childData.nis);
        $('#ttlInput').val(childData.ttl);
        $('#jkInput').val(childData.jk);
        $('#nopeInput').val(childData.nomortelepon);
        $('#alamatInput').val(childData.alamat);
        $('#tempatPrakerinInput').val(childData.tempatPrakerin);
        $('#namaPembimbingInput').val(childData.namaPembimbing);
    })
}

const btnUbahProfil = document.getElementById('btnUbahProfil');
btnUbahProfil.addEventListener('click', e => {
    e.preventDefault();

    var userId = firebase.auth().currentUser.uid;
    var emailUser = firebase.auth().currentUser.email;
    const siswaRef = database.ref('siswa/' + userId);

    if (
        nis.value == "" ||
        nama.value == "" ||
        ttl.value == "" ||
        jk.value == "" ||
        nope.value == "" ||
        alamat.value == "" ||
        tempatPrakerin.value == "" ||
        namaPembimbing.value == "" ||
        email.value == ""
    ) {
        alert('Tolong Isi Form Dengan Benar.');
    } else {

        siswaRef.update({
            nis: nis.value,
            nama: nama.value,
            ttl: ttl.value,
            jk: jk.value,
            nomortelepon: nope.value,
            alamat: alamat.value,
            tempatPrakerin: tempatPrakerin.value,
            namaPembimbing: namaPembimbing.value,
            email: emailUser
        })
        alert('Data Diri diperbarui.');
        popupProfil.style.display = "none";
        displayOnLoad()
    }
})

function displayOnLoad() {
    var userId = firebase.auth().currentUser.uid;
    firebase.database().ref('siswa/' + userId).limitToFirst(1).once("value", snapshot => {
        if (snapshot.exists()) {
            const siswaRef = database.ref('siswa/' + userId);
            siswaRef.on("value", function(snapshot) {
                var childData = snapshot.val();
                var nama = childData.nama;
                var nis = childData.nis;
                var email = childData.email;
                var ttl = childData.ttl;
                var jk = childData.jk;
                var nope = childData.nomortelepon;
                var alamat = childData.alamat;
                var tempatPrakerin = childData.tempatPrakerin;
                var namaPembimbing = childData.namaPembimbing;

                document.getElementById("nama").innerHTML = nama;
                document.getElementById("nis").innerHTML = nis;
                document.getElementById("email").innerHTML = email;
                document.getElementById("ttl").innerHTML = ttl;
                document.getElementById("jk").innerHTML = jk;
                document.getElementById("nope").innerHTML = nope;
                document.getElementById("alamat").innerHTML = alamat;
                document.getElementById("tempatPrakerin").innerHTML = tempatPrakerin;
                document.getElementById("namaPembimbing").innerHTML = namaPembimbing;
            })
        } else {
            console.log('data diri for uid' + userId + ' not exist')
        }
    });
}