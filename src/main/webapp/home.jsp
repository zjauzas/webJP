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

    </head>

    <header>
        <p class="fontlogo">
            <img src="images/title.png" class="imglogo"> Jurnal Prakerin
        </p>
    </header>

    <div class="topnav" id="topnavnav">
        <div class="topnav-centered">
            <a href="home.jsp#daftaraktivitas">Daftar Aktivitas</a>
            <a href="home.jsp#datadiri">Data Diri</a>
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
                <!-- <div id="card">
                    <div id="card-content">
                        <div class="form inputtext">
                            <input id="email" class="form-content" type="email" name="email" autocomplete="on" required placeholder="Email" />
                            <div class="form-border"></div>
                            <input style="margin-top: 10px;" id="password" class="form-content" type="password" name="password" required placeholder="Password" />
                            <div class="form-border"></div>
                            <i class="far fa-eye" id="togglePassword" style="font-size: 15px;"><a style="font-family: custom4; size: 3px;">Show Password</a></i>
                            <button class="btncontainer" id="btnSignIn">Sign In</button>
                            <div class="textinsidecard">
                                <br>Atau,<br>Sign In dengan akun Google
                            </div>
                            <button class="btncontainer" id="btnSignInGoogle">
                                <i class="fa fa-google"></i>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign In
                            </button>
                            <br>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
        <hr>
        <div class="container" id="datadiri">
            <div class="pagecontainer">
                <br>
                <p style="font-family: custom4;">DATA DIRI SISWA</p>
                <div class="w3-container w3-center backgrounddiv2">
                    <h2 style="font-family: custom4; font-size: 20px;">Lengkapi data diri siswa.</h2>
                </div>
                <div class="cardProfile">
                    <img src="images/bg.jpg" alt="John" style="width:100%" class="imgprofile">
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
                    <span onclick="document.getElementById('ubahBtn').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <div class="modal-content form inputtext">
                        <p>Data Diri</p>
                        <hr>
                        <input type="text" placeholder="Nama" id="namaInput" required>
                        <input type="number" placeholder="Nomor Induk Siswa" id="nisInput" required>
                        <input type="date" placeholder="Tanggal Lahir" id="ttlInput" required>
                        <select class="w3-select" id="jkInput" style="margin-bottom: 15px;">
                            <option value="" disabled selected>Jenis Kelamin</option>
                            <option value="laki_laki">Laki-Laki</option>
                            <option value="perempuan">Perempuan</option>
                        </select>
                        <input type="number" placeholder="Nomor Telepon" id="nopeInput" required>
                        <input type="text" placeholder="Alamat" id="alamatInput" required>
                        <select class="w3-select" id="tempatPrakerinInput" style="margin-bottom: 15px;">
                            <option value="" disabled selected>Tempat Prakerin</option>
                            <option value="ilvermorny">Ilvermorny</option>
                            <option value="hogwarts">Hogwarts</option>
                            <option value="castelobruxo">Castelobruxo</option>
                        </select>
                        <input type="text" placeholder="Nama Pembimbing Prakerin" name="namaPembimbingInput" required>
                        <div class="clearfix">
                            <button type="button" onclick="document.getElementById('ubahBtn').style.display='none'" class="cancelbtn">Cancel</button>
                            <button type="submit" class="signupbtn">Sign Up</button>
                        </div>
                    </div>
                </div>
               
                <button class="btncontainerLogout" id="btnSignOut">Sign Out</button>
                
            </div>
            <br><br><br>
        </div>
    </div>

    <script type="text/javascript" src="script/home.js"></script>

</body>

<footer class="footerfont">
    <div class="backgrounddiv">
        <br><br>
    </div>
    <img src="images/icon.png" class="imglogofooter"> Jurnal Prakerin
</footer>

</html>