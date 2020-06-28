<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html> -->
<html>

<head>
    <title>Jurnal Prakerin</title>
    <link rel="stylesheet" type="text/css" href="style\style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-database.js"></script>
    <!-- <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-storage.js"></script> -->
    <script src="script/init-firebase.js"></script>
    <script defer type="text/javascript" src="script/home.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>


<body>

    <main>
        <div class="topnav">
            <a style="float: left;" href="home.jsp"><img src="images/title.png" style="float: left;" height="20px" width="20px">&nbsp;&nbsp;Jurnal Prakerin</a>
            <div class="dropdown">
                <button class="dropbtn">Profile
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="profile.jsp">Edit Profile</a>
                    <a class="btncontainerLogout" id="btnSignOut">Sign Out</a>
                </div>
            </div>
            <a href="rekapaktivitas.jsp">Rekap Aktivitas</a>
            <a href="home.jsp#daftaraktivitas">Daftar Aktivitas</a>



            <!-- <a id="btnSignOut" style="float: right;">SIGN OUT</a> -->
        </div>

        <div class="maincontainer" id="app">

            <div class="container">
                <div class="pagecontainer" id="daftaraktivitas">
                    <br>
                    <p style="font-family: custom4;">DAFTAR AKTIVITAS PRAKERIN</p>
                    <div class="w3-container backgrounddiv2 w3-center">
                        <h2 style="font-family: custom4; font-size: 20px;">
                            Lihat dan tambahkan daftar aktivitas siswa selama masa prakerin.
                        </h2>
                    </div>
                    <div>

                        <div class="topnav-centered" style="background-color: black;">
                            <button class="liatAktivitas" onclick="display()">
                                <div class="buttonLiat">
                                    <img src="images/arrow.png" class="imgisiprofile">
                                </div> <u>Lihat Aktivitas</u>
                            </button>
                            <button title="Tambah Aktivitas" class="addAktivitas" onclick="document.getElementById('addAktivitas').style.display='block'">
                                <div class="buttonAdd" id="btnAddAktivitas">
                                    <img src="images/add.png" class="imgisiprofile">
                                </div>
                            </button>
                        </div>
                        <table id="activityTable" class="tableList" style="font-family: custom4;">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Kegiatan</th>
                                    <th scope="col">Deskripsi</th>
                                    <th scope="col">Tempat Kegiatan</th>
                                    <th scope="col">Tanggal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                    <div id="updateAktivitas" class="modal" role="dialog document">
                        <span onclick="document.getElementById('updateAktivitas').style.display='none'" class="close" title="Ubah Aktivitas Prakerin">&times;</span>
                        <form class="modal-content form inputtext">
                            <p>Aktivitas Prakerin</p>
                            <hr>
                            <input type="number" placeholder="Kegiatan ke..." id="nomorKegiatanUpdate" required readonly="readonly">
                            <input type="text" placeholder="Kegiatan" id="kegiatanUpdate" required>
                            <input type="text" placeholder="Deskripsi Kegiatan" id="deskripsiKegiatanUpdate" required>
                            <input type="text" placeholder="Tempat Kegiatan" id="tempatUpdate" required>
                            <input type="text" placeholder="Tanggal" onfocus="(this.type='date')" onblur="(this.type='text')" id="tanggalUpdate" required>
                            <input type="text" placeholder="Waktu" onfocus="(this.type='time')" onblur="(this.type='text')" id="waktuUpdate" required>
                            <div class="clearfix">
                                <button type="reset" id="resetBtn" class="resetBtn buttonProfil">Reset Form</button>
                                <button id="perbaruiAktivitas" class="perbaruiBtn buttonProfil">Perbarui
                                    Aktivitas</button>
                            </div>
                        </form>
                    </div>

                    <div id="deleteAktivitas" class="modal">
                        <span onclick="document.getElementById('deleteAktivitas').style.display='none'" class="close" title="Hapus aktivitas ini?">&times;</span>
                        <form class="modal-content form inputtext">
                            <p>Aktivitas Prakerin</p>
                            <hr>
                            <input readonly="readonly" type="number" placeholder="Kegiatan ke..." id="nomorKegiatanDelete" required>
                            <input readonly="readonly" type="text" placeholder="Kegiatan" id="kegiatanDelete" required>
                            <input readonly="readonly" type="text" placeholder="Deskripsi Kegiatan" id="deskripsiKegiatanDelete" required>
                            <input readonly="readonly" type="text" placeholder="Tempat Kegiatan" id="tempatDelete" required>
                            <input readonly="readonly" type="text" placeholder="Tanggal" onfocus="(this.type='date')" onblur="(this.type='text')" id="tanggalDelete" required>
                            <input readonly="readonly" type="text" placeholder="Waktu" onfocus="(this.type='time')" onblur="(this.type='text')" id="waktuDelete" required>
                            <div class="clearfix">
                                <button type="cancel" id="cancel" class="resetBtn buttonProfil">Batalkan</button>
                                <button id="hapusAktivitas" class="perbaruiBtn buttonProfil">Hapus Aktivitas</button>
                            </div>
                        </form>
                    </div>

                    <div id="addAktivitas" class="modal">
                        <span onclick="document.getElementById('addAktivitas').style.display='none'" class="close" title="Aktivitas Prakerin">&times;</span>
                        <form class="modal-content form inputtext">
                            <p>Aktivitas Prakerin</p>
                            <hr>
                            <input readonly="readonly" type="number" placeholder="Kegiatan ke..." id="nomorKegiatanInput" required>
                            <input type="text" placeholder="Kegiatan" id="kegiatanInput" required>
                            <input type="text" placeholder="Deskripsi Kegiatan" id="deskripsiKegiatanInput" required>
                            <input type="text" placeholder="Tempat Kegiatan" id="tempatInput" required>
                            <input type="text" placeholder="Tanggal" onfocus="(this.type='date')" onblur="(this.type='text')" id="tanggalInput" required>
                            <input type="text" placeholder="Waktu" onfocus="(this.type='time')" onblur="(this.type='text')" id="waktuInput" required>
                            <div class="clearfix">
                                <button type="reset" id="resetBtn" class="resetBtn buttonProfil">Reset Form</button>
                                <button id="tambahAktivitas" class="perbaruiBtn buttonProfil">Tambah Aktivitas</button>
                            </div>
                        </form>
                    </div>

                </div>
                <br><br><br>
            </div>
            <hr>

            <br><br><br>
        </div>
    </main>
</body>

<footer class="footerfont">
    <div class="backgrounddiv"></div>
</footer>

</html>