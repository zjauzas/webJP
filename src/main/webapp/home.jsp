<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> --%>
<html>

<body>

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

    </head>

    <header>
        <p class="fontlogo">
            <img src="images/title.png" class="imglogo"> Jurnal Prakerin
        </p>
    </header>

    <div class="topnav" id="topnavnav">
        <div class="topnav-centered">
            <a href="home.jsp#daftaraktivitas">Daftar Aktivitas</a>
            <!-- <a href="home.jsp#datadiri">Data Diri</a> -->
            <a id="btnSignOut">SIGN OUT</a>
            <!-- <button class="btncontainerLogout" id="btnSignOut">Sign Out</button> -->
        </div>
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
                <br><br>
                <p id="email" style="font-size: 25px;"><img src="images/nama.png" class="imgisiprofile"> email</p>
                <br><br>
                <button class="addAktivitas" onclick="document.getElementById('addAktivitas').style.display='block'" style="width: auto; height: auto; float: none;">
                    <div class="buttonAdd" id="btnAddAktivitas">
                        <img src="images/add.png" class="imgisiprofile">
                    </div> Tambah Aktivitas Baru
                </button><br><br><br><br><br>
                <button class="addAktivitas" onclick="display()">
                    <div class="buttonAdd" id="btnAddAktivitas">
                        <img src="images/arrow.png" class="imgisiprofile">
                    </div> Lihat Aktivitas
                </button><br><br><br><br><br>


                <div style="padding:10px;">
                    <!-- <div class="row no-gutters">
                    <div class="col align-self-center">
                        <h3 class="text-left"><i class="fa fa-home" onclick="tampilData()" style="cursor: pointer;"></i>Daftar Aktivitas Prakerin</h3>
                    </div>
                    <div><input id="searchActivity" type="text" placeholder="Cari berdasarkan nama alat" class="form-control" style="padding:6px;" /></div>
                    <div><button class="btn btn-primary" type="button" onclick="CariData()">Cari Data</button></div>

                </div> -->
                    <table id="activityTable" class="tableList" style="font-family: custom4;">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Kegiatan</th>
                                <th scope="col">Tanggal</th>
                                <th scope="col">Waktu</th>
                                <th scope="col">Aksi</th>
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
                        <input type="number" placeholder="Kegiatan ke..." id="nomorKegiatanUpdate" required>
                        <input type="text" placeholder="Kegiatan" id="kegiatanUpdate" required>
                        <input type="text" placeholder="Deskripsi Kegiatan" id="deskripsiKegiatanUpdate" required>
                        <input type="text" placeholder="Tempat Kegiatan" id="tempatUpdate" required>
                        <input type="text" placeholder="Tanggal" onfocus="(this.type='date')" onblur="(this.type='text')" id="tanggalUpdate" required>
                        <input type="text" placeholder="Waktu" onfocus="(this.type='time')" onblur="(this.type='text')" id="waktuUpdate" required>
                        <div class="clearfix">
                            <button type="reset" id="resetBtn" class="resetBtn buttonProfil">Reset Form</button>
                            <button id="perbaruiAktivitas" class="perbaruiBtn buttonProfil">Perbarui Aktivitas</button>
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
                        <input type="number" placeholder="Kegiatan ke..." id="nomorKegiatanInput" required>
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
        <!-- <hr>
        <div class="container" id="datadiri">
            <div class="pagecontainer">
                <br>
                <p style="font-family: custom4;">DATA DIRI SISWA</p>
                <div class="w3-container w3-center backgrounddiv2">
                    <h2 style="font-family: custom4; font-size: 20px;">Lengkapi data diri siswa.</h2>
                </div>

                <div class="cardProfile">
                    <p id="nama"><img src="images/nama.png" class="imgisiprofile"> Nama</p>
                    <p id="email"><img src="images/email.png" class="imgisiprofile"> Email</p>
                    <p id="nis"><img src="images/nis.png" class="imgisiprofile"> Induk Siswa</p>
                    <p id="ttl"><img src="images/ttl.png" class="imgisiprofile"> Tanggal Lahir</p>
                    <p id="jk"><img src="images/jk.png" class="imgisiprofile"> Jenis Kelamin</p>
                    <p id="nope"><img src="images/nope.png" class="imgisiprofile"> Nomor Telepon</p>
                    <p id="alamat"><img src="images/alamat.png" class="imgisiprofile"> Alamat</p>
                    <p id="tempatPrakerin"><img src="images/tempatPrakerin.png" class="imgisiprofile"> Tempat Prakerin</p>
                    <p id="namaPembimbing"><img src="images/pembimbingPrakerin.png" class="imgisiprofile"> Nama Pembimbing Prakerin</p>
                    <button class="btncontainer w3-center" onclick="document.getElementById('ubahBtn').style.display='block'">Ubah Data Diri</button>
                </div>

                <div id="ubahBtn" class="modal">
                    <span onclick="document.getElementById('ubahBtn').style.display='none'" class="close" title="Data Diri">&times;</span>
                    <form class="modal-content form inputtext">
                        <p>Data Diri</p>
                        <hr>
                        <input type="text" placeholder="Nama" id="namaInput" required>
                        <input type="number" placeholder="Nomor Induk Siswa" id="nisInput" required>
                        <input type="text" placeholder="Tanggal Lahir" onfocus="(this.type='date')" onblur="(this.type='text')" id="ttlInput" required>
                        <select class="w3-select" id="jkInput" style="margin-bottom: 15px; padding: 15px;">
                            <option value="" disabled selected>Jenis Kelamin</option>
                            <option value="laki_laki">Laki-Laki</option>
                            <option value="perempuan">Perempuan</option>
                        </select>
                        <input type="number" placeholder="Nomor Telepon" id="nopeInput" required>
                        <input type="text" placeholder="Alamat" id="alamatInput" required>
                        <select class="w3-select" id="tempatPrakerinInput" style="margin-bottom: 15px; padding: 15px;">
                            <option value="" disabled selected>Tempat Prakerin</option>
                            <option value="ilvermorny">Ilvermorny</option>
                            <option value="hogwarts">Hogwarts</option>
                            <option value="castelobruxo">Castelobruxo</option>
                        </select>
                        <input type="text" placeholder="Nama Pembimbing Prakerin" id="namaPembimbingInput" required>
                        <div class="clearfix">
                            <button type="reset" id="resetBtn" class="resetBtn buttonProfil">Reset Form</button>
                            <button id="btnUbahProfil" class="perbaruiBtn buttonProfil">Perbarui Data Diri</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> -->

        <br><br><br>
    </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="script/home.js"></script>

</body>

<footer class="footerfont">
    <div class="backgrounddiv">
        <br><br>
    </div>
    <img src="images/icon.png" class="imglogofooter"> Jurnal Prakerin
</footer>

</html>