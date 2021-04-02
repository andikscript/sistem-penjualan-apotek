<!DOCTYPE html>
<html>
<%@page import="java.sql.*"%>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Insert Pembelian | Sistem Informasi PT. Farmasi OK</title>

    <!-- Favicon-->
    <link rel="icon" href="../../images/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../../css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-red">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="../home.jsp">PT. FARMASI - OK</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Call Search -->
                    <li><a href="javascript:void(0);" class="js-search" data-close="true"><i class="material-icons">search</i></a></li>
                    <!-- #END# Call Search -->
                    <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <% 
    String user = (String) session.getAttribute("username");
    String pass = (String) session.getAttribute("password");
    String email = (String) session.getAttribute("email");
    String pegawai = (String) session.getAttribute("pegawai");
    String idPegawai = (String) session.getAttribute("idpegawai");
    String url = request.getRequestURI();
    session.setAttribute("url", url);
    
    if (user == null && pass == null) {
            response.sendRedirect("../../index.jsp");
        }
    %> 
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="../../images/user.png" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= pegawai %></div>
                    <div class="email"><%= email %></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="../profile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            <li><a href="../signout.jsp"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li>
                        <a href="../home.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <li class="active">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">add_shopping_cart</i>
                            <span>Pembelian</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="active">
                                <a href="pembelian-insert.jsp">Insert</a>
                            </li>
                            <li>
                                <a href="pembelian-search.jsp">Search</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">assignment</i>
                            <span>Penjualan</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../penjualan/penjualan-insert.jsp">Insert</a>
                            </li>
                            <li>
                                <a href="../penjualan/penjualan-search.jsp">Search</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span>Pelanggan</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../pelanggan/pelanggan-insert.jsp">Insert</a>
                            </li>
                            <li>
                                <a href="../pelanggan/pelanggan-search.jsp">Search</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">list_alt</i>
                            <span>Distributor</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../distributor/distributor-insert.jsp">Insert</a>
                            </li>
                            <li>
                                <a href="../distributor/distributor-search.jsp">Search</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">opacity</i>
                            <span>Obat</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../obat/obat-insert.jsp">Insert</a>
                            </li>
                            <li>
                                <a href="../obat/obat-search.jsp">Search</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2019 - 2020 <a href="javascript:void(0);">Web Admin - Design by AndikS</a>.
                </div>
                <div class="version">
                    <b>Version: </b> 0.0.1
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->
        <aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs tab-nav-right" role="tablist">
                <li role="presentation" class="active"><a href="#skins" data-toggle="tab">SKINS</a></li>
                
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active in active" id="skins">
                    <ul class="demo-choose-skin">
                        <li data-theme="red" class="active">
                            <div class="red"></div>
                            <span>Red</span>
                        </li>
                        <li data-theme="pink">
                            <div class="pink"></div>
                            <span>Pink</span>
                        </li>
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span>Purple</span>
                        </li>
                        <li data-theme="deep-purple">
                            <div class="deep-purple"></div>
                            <span>Deep Purple</span>
                        </li>
                        <li data-theme="indigo">
                            <div class="indigo"></div>
                            <span>Indigo</span>
                        </li>
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span>Blue</span>
                        </li>
                        <li data-theme="light-blue">
                            <div class="light-blue"></div>
                            <span>Light Blue</span>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                            <span>Cyan</span>
                        </li>
                        <li data-theme="teal">
                            <div class="teal"></div>
                            <span>Teal</span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span>Green</span>
                        </li>
                        <li data-theme="light-green">
                            <div class="light-green"></div>
                            <span>Light Green</span>
                        </li>
                        <li data-theme="lime">
                            <div class="lime"></div>
                            <span>Lime</span>
                        </li>
                        <li data-theme="yellow">
                            <div class="yellow"></div>
                            <span>Yellow</span>
                        </li>
                        <li data-theme="amber">
                            <div class="amber"></div>
                            <span>Amber</span>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                            <span>Orange</span>
                        </li>
                        <li data-theme="deep-orange">
                            <div class="deep-orange"></div>
                            <span>Deep Orange</span>
                        </li>
                        <li data-theme="brown">
                            <div class="brown"></div>
                            <span>Brown</span>
                        </li>
                        <li data-theme="grey">
                            <div class="grey"></div>
                            <span>Grey</span>
                        </li>
                        <li data-theme="blue-grey">
                            <div class="blue-grey"></div>
                            <span>Blue Grey</span>
                        </li>
                        <li data-theme="black">
                            <div class="black"></div>
                            <span>Black</span>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
    </section>
<!-- #END# Right Sidebar -->
<script type="text/javascript">
    
    function berhasil(){
        alert("Berhasil Input Data");
        window.location.href = "pembelian-insert.jsp";
    }
    
    function gagal(){
        alert("Gagal Input Data\nAda Kesalahan Dalam Input Data.");
        window.location.href = "pembelian-insert.jsp";
    }
</script>
    <section class="content">
        <div class="container-fluid">
            <!-- Advanced Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>INSERT DATA PEMBELIAN</h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <jsp:useBean id="insert" class="pembelian.InsertPembelian"/>
                        <% 
                        if (request.getParameter("idobat") != null && request.getParameter("iddistributor") != null && request.getParameter("idobat") != "" && request.getParameter("iddistributor") != "") {
                            insert.idDistributor = request.getParameter("iddistributor");
                            insert.idPegawai = idPegawai;
                            insert.idObat = request.getParameter("idobat");
                            insert.jumlah = Integer.parseInt(request.getParameter("jumlah"));
                            insert.hargaPembelian = Double.parseDouble(request.getParameter("harga"));
                            insert.run();
                            
                        }

                        if (insert.a == 1) {%>
                            <script>berhasil();</script>  
                    <%} else if (insert.a == 2){%>
                        <script>gagal();</script>  
                    <%  } %>
                    
                    <%! 
                        Connection conn;
                        Statement stmt;
                        ResultSet rs;
                    %>
                        <div class="body">
                            <form id="form_advanced_validation">
                                <div class="form-group form-float">
                                    <div class="style-selected">
                                        <select name="iddistributor" required >
                                            <option selected="selected">-- Distributor --</option>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
                                                    stmt = conn.createStatement();
                                                    String sql = "select * from distributor";
                                                    rs = stmt.executeQuery(sql);
                                                    while(rs.next()){%>
                                                        <option value="<%= rs.getString("id_distributor") %>"><%= rs.getString("nama_distributor") %></option>
                                                    <%}
                                                    stmt.close();
                                                    conn.close();
                                                        } catch (Exception e){
                                                            e.printStackTrace();
                                                    }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="style-selected">
                                        <select name="idobat" required>
                                            <option selected="selected">-- Nama Obat --</option>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
                                                    stmt = conn.createStatement();
                                                    String sql = "select * from obat";
                                                    rs = stmt.executeQuery(sql);
                                                    while(rs.next()){%>
                                                        <option value="<%= rs.getString("id_obat") %>"><%= rs.getString("nama_obat") %></option>
                                                    <%}
                                                    stmt.close();
                                                    conn.close();
                                                        } catch (Exception e){
                                                            e.printStackTrace();
                                                    }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line focused error">
                                        <input type="number" class="form-control" name="jumlah" required>
                                        <label class="form-label">Jumlah</label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line focused error">
                                        <input type="number" class="form-control" name="harga" required>
                                        <label class="form-label">Harga</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary waves-effect" type="submit">INSERT</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Advanced Validation -->                
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../../plugins/node-waves/waves.js"></script>

    <!-- Custom Js -->
    <script src="../../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../../js/demo.js"></script>
</body>

</html>
