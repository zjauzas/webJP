//firebase instance initialize
const database = firebase.database();

firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {
        console.log(firebaseUser);
        display()
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

document.getElementById('nomorKegiatanInput').addEventListener('click', e => {
    var userId = firebase.auth().currentUser.uid;
    firebase.database().ref('aktivitasPrakerin/' + userId).limitToFirst(1).once("value", snapshot => {
        if (snapshot.exists()) {
            const aktivitasRef = database.ref('aktivitasPrakerin/' + userId);
            aktivitasRef.limitToLast(1).on('child_added', function(lastKey) {
                var snap = lastKey.val();
                var id_last_record = snap.nomorKegiatan;
                var id = parseInt(id_last_record) + 1;
                // alert(id)
                document.getElementById("nomorKegiatanInput").value = id;
            })
        } else {
            var id = 1;
            // alert(id)
            document.getElementById("nomorKegiatanInput").value = id;
        }
    });
})

const nomorKegiatan = document.getElementById('nomorKegiatanInput');
const kegiatan = document.getElementById('kegiatanInput');
const deskripsi_kegiatan = document.getElementById('deskripsiKegiatanInput');
const tempat_kegiatan = document.getElementById('tempatInput');
const tanggal = document.getElementById('tanggalInput');
const waktu = document.getElementById('waktuInput');

const tambahAktivitas = document.getElementById('tambahAktivitas');
tambahAktivitas.addEventListener('click', e => {
    e.preventDefault();
    var userId = firebase.auth().currentUser.uid;
    const aktivitasRef = database.ref('aktivitasPrakerin/' + userId);

    if (
        kegiatan.value == "" ||
        deskripsi_kegiatan.value == "" ||
        tempat_kegiatan.value == "" ||
        tanggal.value == "" ||
        waktu.value == ""
    ) {
        alert('Tolong Isi Form Dengan Benar.');
    } else {
        aktivitasRef.child(nomorKegiatan.value).set({
            nomorKegiatan: nomorKegiatan.value,
            kegiatan: kegiatan.value,
            deskripsi_kegiatan: deskripsi_kegiatan.value,
            tempat_kegiatan: tempat_kegiatan.value,
            tanggal: tanggal.value,
            waktu: waktu.value
        });
        alert('Aktivitas Ditambahkan');
        popupAktivitas.style.display = "none";
    }
});

function display() {
    var table = document.getElementById("activityTable").getElementsByTagName('tbody')[0];
    $("#activityTable").find("tr:gt(0)").remove();
    var userId = firebase.auth().currentUser.uid;
    const aktivitasRef = database.ref('aktivitasPrakerin/' + userId);
    aktivitasRef.on("child_added", function(data, prevChildKey) {
            var childKey = data.key;
            var dataChild = data.val();
            var row = table.insertRow(table.rows.length);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            // var cell4 = row.insertCell(3);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            cell1.innerHTML = childKey;
            cell2.innerHTML = dataChild.kegiatan;
            cell3.innerHTML = dataChild.deskripsi_kegiatan;
            cell4.innerHTML = dataChild.tempat_kegiatan;
            cell5.innerHTML = dataChild.tanggal;
            // cell4.innerHTML = dataChild.waktu;
            cell6.innerHTML = '<div class="bongiya"><button class="editapus" type="button" id="update_data" onclick="updateAktivitas_display(' + childKey +
                ')" data-toggle="modal" data-target="#updateAktivitas"><img src="images/edit.png" class="imgisitabel"></button><button class="editapus" type="button" id="delete_data" onclick="deleteAktivitas_display(' + childKey +
                ')" data-toggle="modal" data-target="#deleteAktivitas"><img src="images/hapus.png" class="imgisitabel"></button></div>';
        })
        // }
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