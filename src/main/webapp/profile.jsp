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
    <script defer type="text/javascript" src="script/profile.js"></script>

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
            <a href="home.jsp">Daftar Aktivitas</a>



            <!-- <a id="btnSignOut" style="float: right;">SIGN OUT</a> -->
        </div>

        <div class="maincontainer" id="app">

            <div class="container" id="datadiri">
                <div class="pagecontainer">
                    <br>
                    <p style="font-family: custom4;">Profile Siswa</p>

                    <div class="cardProfile">
                        <label>Nama</label>
                        <b>:</b>
                        <output id="nama"></output>

                        <label> Nomor Induk Siswa </label>
                        <b>:</b>
                        <output id="nis"></output>

                        <label>Email</label>
                        <b>:</b>
                        <output id="email"></output>

                        <label>Tanggal Lahir</label>
                        <b>:</b>
                        <output id="ttl"></output>

                        <label>Jenis Kelamin</label>
                        <b>:</b>
                        <output id="jk"></output>

                        <label>Nomor Telepon</label>
                        <b>:</b>
                        <output id="nope"></output>

                        <label>Alamat Rumah</label>
                        <b>:</b>
                        <output id="alamat"></output>

                        <label>Tempat Prakerin</label>
                        <b>:</b>
                        <output id="tempatPrakerin"></output>

                        <label>Nama Pembimbing</label>
                        <b>:</b>
                        <output id="namaPembimbing"></output>
                        <button class="btncontainer w3-center" onclick="document.getElementById('ubahBtn').style.display='block'" style="grid-column: 3/3;" id="editProfileBtn">Edit Profile</button>
                    </div>


                    <div id="ubahBtn" class="modal">
                        <span onclick="document.getElementById('ubahBtn').style.display='none'" class="close" title="Data Diri">&times;</span>
                        <form class="modal-content form inputtext">
                            <p>Profile</p>
                            <hr>
                            <input type="text" placeholder="Nama" id="namaInput" required>
                            <input type="number" placeholder="Nomor Induk Siswa" id="nisInput" required>
                            <input type="text" placeholder="Tanggal Lahir" onfocus="(this.type='date')" onblur="(this.type='text')" id="ttlInput" required>
                            <select class="w3-select" id="jkInput" style="margin-bottom: 15px; padding: 15px;">
                                <option value="" disabled selected>Jenis Kelamin</option>
                                <option value="laki-laki">Laki-Laki</option>
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
            </div>

            <br><br><br>
        </div>
    </main>
</body>

<footer class="footerfont">
    <div class="backgrounddiv"></div>
</footer>

</html>