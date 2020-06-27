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
    <script defer type="text/javascript" src="script/rekapaktivitas.js"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
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


        </div>

        <div class="maincontainer" id="app">

            <div class="container" id="datadiri">
                <div class="pagecontainer">
                    <br>
                    <p style="font-family: custom4;">Rekap Aktivitas</p>

                    <div class="cardProfiler">
                        <label>Nama</label>
                        <b>:</b>
                        <output id="nama"></output>

                        <label> Nomor Induk Siswa </label>
                        <b>:</b>
                        <output id="nis"></output>

                        <label>Tanggal Lahir</label>
                        <b>:</b>
                        <output id="ttl"></output>

                        <label>Nama Pembimbing</label>
                        <b>:</b>
                        <output id="namaPembimbing"></output>
                        <br>

                        <label>Paraf Pembimbing</label>
                        <b>:</b>
                        <output class="rectangle"></output>
                    </div>

                </div>
            </div>
            <div>

                <table id="activityTable" class="tableList" style="font-family: custom4;">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Kegiatan</th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Tempat Kegiatan</th>
                            <th scope="col">Tanggal</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <hr>
            <br>
            <button class="btnprint" onclick="window.print()">
            <i class="fa fa-print"></i>
            &nbsp;&nbsp;&nbsp;Print</button>
        </div>
    </main>
</body>

<footer class="footerfont">
    <div class="backgrounddiv"></div>
</footer>

</html>