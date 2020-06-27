//firebase instance initialize
const database = firebase.database();

firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {
        console.log(firebaseUser);
        displayOnLoad()
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


function display() {
    // document.readyState = function() {
    var table = document.getElementById("activityTable").getElementsByTagName('tbody')[0];
    // Membuang semua isi table
    $("#activityTable").find("tr:gt(0)").remove();
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
            cell3.innerHTML = dataChild.deskripsi_kegiatan;
            cell4.innerHTML = dataChild.tempat_kegiatan;
            cell5.innerHTML = dataChild.tanggal;
        })
        // }
}

function displayOnLoad() {
    var userId = firebase.auth().currentUser.uid;
    firebase.database().ref('siswa/' + userId).limitToFirst(1).once("value", snapshot => {
        if (snapshot.exists()) {
            const siswaRef = database.ref('siswa/' + userId);
            siswaRef.on("value", function(snapshot) {
                var childData = snapshot.val();
                var nama = childData.nama;
                var nis = childData.nis;
                var ttl = childData.ttl;
                var namaPembimbing = childData.namaPembimbing;

                document.getElementById("nama").innerHTML = nama;
                document.getElementById("nis").innerHTML = nis;
                document.getElementById("ttl").innerHTML = ttl;
                document.getElementById("namaPembimbing").innerHTML = namaPembimbing;

            })
        } else {
            console.log('data diri for uid' + userId + ' not exist')
        }
    });
}