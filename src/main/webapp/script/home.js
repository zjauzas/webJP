const firebaseConfig = {
        apiKey: "AIzaSyCjutuAcjqKCwCGM8PkkBBs9wFVgyRAU3U",
        authDomain: "jurnalprakerin.firebaseapp.com",
        databaseURL: "https://jurnalprakerin.firebaseio.com",
        projectId: "jurnalprakerin",
        storageBucket: "jurnalprakerin.appspot.com",
        messagingSenderId: "678896514166",
        appId: "1:678896514166:web:a48ce52f20c6bbc72d5b57",
        measurementId: "G-ER030CHZSQ"
    }
    // Initialize Firebase
firebase.initializeApp(firebaseConfig);
// firebase.analytics();

firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {
        console.log(firebaseUser);
        document.getElementById("email").innerHTML = firebaseUser.email;
    } else {
        window.location = 'index.jsp';
        console.log('not logged in');
    }
})

const database = firebase.database();

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



const popupAktivitas = document.getElementById('addAktivitas');
window.onclick = function(event) {
    if (event.target == popupAktivitas) {
        popupAktivitas.style.display = "none";
    }
}

const popupAktivitasDelete = document.getElementById('deleteAktivitas');
window.onclick = function(event) {
    if (event.target == popupAktivitasDelete) {
        popupAktivitasDelete.style.display = "none";
    }
}

const popupAktivitasUpdate = document.getElementById('updateAktivitas');
window.onclick = function(event) {
    if (event.target == popupAktivitasUpdate) {
        popupAktivitasUpdate.style.display = "none";
    }
}

const nomorKegiatan = document.getElementById('nomorKegiatanInput');
const kegiatan = document.getElementById('kegiatanInput');
const deskripsi_kegiatan = document.getElementById('deskripsiKegiatanInput');
const tempat_kegiatan = document.getElementById('tempatInput');
const tanggal = document.getElementById('tanggalInput');
const waktu = document.getElementById('waktuInput');

const tambahAktivitas = document.getElementById('tambahAktivitas');
tambahAktivitas.addEventListener('click', e => {
    var userId = firebase.auth().currentUser.uid;
    // alert(userId);
    const aktivitasRef = database.ref('aktivitasPrakerin/' + userId);
    e.preventDefault();
    aktivitasRef.child(nomorKegiatan.value).set({
        kegiatan: kegiatan.value,
        deskripsi_kegiatan: deskripsi_kegiatan.value,
        tempat_kegiatan: tempat_kegiatan.value,
        tanggal: tanggal.value,
        waktu: waktu.value
    }).catch(function(error) {
        var errorMessage = error.message;
        window.alert("Error : " + errorMessage)
    });
    alert('Aktivitas ditambahkan.');
    popupAktivitas.style.display = "none";
});

function display() {

    var table = document.getElementById("activityTable").getElementsByTagName('tbody')[0];

    // Membuang semua isi table
    $("#activityTable").find("tr:gt(0)").remove();

    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
            document.getElementById("email").innerHTML = firebaseUser.email;
        } else {
            window.location = 'index.jsp';
            console.log('not logged in');
        }
    })
    const database = firebase.database();
    var userId = firebase.auth().currentUser.uid;
    const aktivitasRef = database.ref('aktivitasPrakerin/' + userId);
    // alert(userId);
    aktivitasRef.on("child_added", function(data, prevChildKey) {
        var childKey = data.key;
        var dataChild = data.val();
        var row = table.insertRow(table.rows.length);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        cell1.innerHTML = childKey;
        cell2.innerHTML = dataChild.kegiatan;
        cell3.innerHTML = dataChild.tanggal;
        cell4.innerHTML = dataChild.waktu;
        cell5.innerHTML = '<button class="addAktivitas" type="button" id="update_data" onclick="updateAktivitas_display(' + childKey +
            ')" data-toggle="modal" data-target="#updateAktivitas">Ubah Aktivitas</button><br><button class="addAktivitas" type="button" id="delete_data" onclick="deleteAktivitas_display(' + childKey +
            ')" data-toggle="modal" data-target="#deleteAktivitas">Hapus Aktivitas</button>';
    })
}

function updateAktivitas_display(id) {
    document.getElementById("updateAktivitas").style.display = "block";
    $('#nomorKegiatanUpdate').val(id);
    var userId = firebase.auth().currentUser.uid;
    // alert(id);
    const ref = database.ref('aktivitasPrakerin/' + userId + '/' + id);
    ref.on("value", function(snapshot) {
        var childData = snapshot.val();
        $('#kegiatanUpdate').val(childData.kegiatan);
        $('#deskripsiKegiatanUpdate').val(childData.deskripsi_kegiatan);
        $('#tempatUpdate').val(childData.tempat_kegiatan);
        $('#tanggalUpdate').val(childData.tanggal);
        $('#waktuUpdate').val(childData.waktu);
    });
}

const ubahAktivitas = document.getElementById('perbaruiAktivitas');
ubahAktivitas.addEventListener('click', e => {
    e.preventDefault();

    var noKegiatan = $('#nomorKegiatanUpdate').val();
    var kegiatan = $('#kegiatanUpdate').val();
    var deskripsiKegiatan = $('#deskripsiKegiatanUpdate').val();
    var tempat = $('#tempatUpdate').val();
    var tanggal = $('#tanggalUpdate').val();
    var waktu = $('#waktuUpdate').val();

    var userId = firebase.auth().currentUser.uid;
    const ref = database.ref('aktivitasPrakerin/' + userId + '/' + noKegiatan);

    ref.update({
        "nomorKegiatan": noKegiatan,
        "kegiatan": kegiatan,
        "deskripsi_kegiatan": deskripsiKegiatan,
        "tempat_kegiatan": tempat,
        "tanggal": tanggal,
        "waktu": waktu
    });
    alert('Aktivitas diperbarui.');
    document.getElementById("updateAktivitas").style.display = "none";
    display();
})

const deleteAktivitas = document.getElementById('hapusAktivitas');
deleteAktivitas.addEventListener('click', e => {
    e.preventDefault();
    var idDelete = $('#nomorKegiatanDelete').val();
    var userId = firebase.auth().currentUser.uid;
    const ref = database.ref('aktivitasPrakerin/' + userId + '/' + idDelete);
    ref.remove();
    alert('Aktivitas dihapus.');
    document.getElementById("deleteAktivitas").style.display = "none";
    display();
})

function deleteAktivitas_display(id) {
    document.getElementById("deleteAktivitas").style.display = "block";
    $('#nomorKegiatanDelete').val(id);
    var userId = firebase.auth().currentUser.uid;
    const ref = database.ref('aktivitasPrakerin/' + userId + '/' + id);
    ref.on("value", function(snapshot) {
        var childData = snapshot.val();
        $('#kegiatanDelete').val(childData.kegiatan);
        $('#deskripsiKegiatanDelete').val(childData.deskripsi_kegiatan);
        $('#tempatDelete').val(childData.tempat_kegiatan);
        $('#tanggalDelete').val(childData.tanggal);
        $('#waktuDelete').val(childData.waktu);
    });
}





const nama = document.getElementById('namaInput');
const nis = document.getElementById('nisInput');
const ttl = document.getElementById('ttlInput');
const jk = document.getElementById('jkInput');
const nope = document.getElementById('nopeInput');
const alamat = document.getElementById('alamatInput');
const tempatPrakerin = document.getElementById('tempatPrakerinInput');
const namaPembimbing = document.getElementById('namaPembimbingInput');

// firebase.auth().onAuthStateChanged(user => {
//     if (user) {
//         this.email = user.email;
//     }
// });

// const btnUbahProfile = document.getElementById('btnUbahProfil');
// btnUbahProfile.addEventListener('click', e => {
//     e.preventDefault();
//     var userId = firebase.auth().currentUser.uid;
//     const siswaRef = database.ref('siswa/');
//     siswaRef.child(userId).set({
//         nis: nis.value,
//         nama: nama.value,
//         ttl: ttl.value,
//         jk: jk.value,
//         nomortelepon: nope.value,
//         alamat: alamat.value,
//         tempatPrakerin: tempatPrakerin.value,
//         namaPembimbing: namaPembimbing.value,
//         email: email
//     }).catch(function(error) {
//         var errorMessage = error.message;
//         window.alert("Error : " + errorMessage)
//     });
//     alert('Data diri diubah');
//     popupProfil.style.display = "none";
// })

// const namaTampil = document.getElementById('nama');
// const nisTampil = document.getElementById('nis');
// const ttlTampil = document.getElementById('ttl');
// const jkTampil = document.getElementById('jk');
// const nopeTampil = document.getElementById('nope');
// const alamatTampil = document.getElementById('alamat');
// const tempatPrakerinTampil = document.getElementById('tempatPrakerin');
// const namaPembimbingTampil = document.getElementById('namaPembimbing');


// var userId = firebase.auth().currentUser.uid;
// const refById = database.ref("siswa/" + userId);
// refById.on("value", function(snapshot) {
//     var childData = snapshot.val();
//     $('#nama').val(childData.nama);
//     $('#nis').val(childData.nis);
//     $('#ttl').val(childData.ttl);
//     $('#jk').val(childData.jk);
//     $('#nope').val(childData.nomortelepon);
//     $('#alamat').val(childData.alamat);
//     $('#tempatPrakerin').val(childData.tempatPrakerin);
//     $('#namaPembimbing').val(childData.namaPembimbing);
// });