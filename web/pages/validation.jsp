<%-- 
    Document   : validation
    Created on : Dec 9, 2019, 12:58:40 AM
    Author     : anon
--%>

<!DOCTYPE html>
<html>
    <%@page import="signin.Login"%>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Validation | Sistem Informasi PT. Farmasi OK</title>
    <!-- Favicon-->
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../css/style.css" rel="stylesheet">
</head>
<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">PT. <b>Farmasi OK</b></a>
            <small>Sistem Informasi Web</small>
            <a href="javascript:void(0);"><b>Logout Successfull</b></a>
        </div>
    </div>
    
    <% 
        Login l = new Login();
        session.setAttribute("l", l);
        
        if (request.getParameter("username") != "" && request.getParameter("password") != "") {
               l.setUser(request.getParameter("username"));
               l.setPass(request.getParameter("password"));
               l.run();
               
                session.setAttribute("username", l.getValidUser());
                session.setAttribute("password", l.getValidPass());
                session.setAttribute("email", l.getEmail());
                session.setAttribute("pegawai", l.getNamaPegawai());
                session.setAttribute("idpegawai", l.getIdPegawai());
                
                if (l.getValidUser() != null && l.getValidPass() != null) {
                    response.sendRedirect("home.jsp");%>
                <%} else {
                response.sendRedirect("../index.jsp");
                }
            }
    %>

    <!-- Jquery Core Js -->
    <script src="../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="../plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="../js/admin.js"></script>
    <script src="../js/pages/examples/sign-in.js"></script>
</body>

</html>



