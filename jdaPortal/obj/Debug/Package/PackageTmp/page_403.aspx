<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page_403.aspx.cs" Inherits="jdaPortal.page_403" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Not Authorize</title>
    <!-- Bootstrap -->
    <link href="<%=ResolveUrl("~/Libraries/Gentallela/vendors/bootstrap/dist/css/bootstrap.min.css") %>" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="<%=ResolveUrl("~/Libraries/Gentallela/vendors/font-awesome/css/font-awesome.min.css") %>" rel="stylesheet" />
    <!-- Custom Theme Style -->
    <link href="<%=ResolveUrl("~/Libraries/Gentallela/build/css/custom.min.css") %>" rel="stylesheet" />
</head>
<body class="nav-md">
    <form id="form1" runat="server">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">403</h1>
              <h2>Access denied</h2>
              <p>Full authentication is required to access this resource. <a href="#">Report this?</a>
              </p>
              <div class="mid_center">
                  <a href="##" onClick="history.go(-1); return false;">Go back</a>  
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="<%=ResolveUrl("~/Libraries/Gentallela/vendors/jquery/dist/jquery.min.js") %>"></script>
    <!-- Bootstrap -->
    <script src="<%=ResolveUrl("~/Libraries/Gentallela/vendors/bootstrap/dist/js/bootstrap.min.js") %>"></script>
    <!-- FastClick -->
    <script src="<%=ResolveUrl("~/Libraries/Gentallela/vendors/fastclick/lib/fastclick.js") %>"></script>
    <!-- NProgress -->
    <script src="<%=ResolveUrl("~/Libraries/Gentallela/vendors/nprogress/nprogress.js") %>"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=ResolveUrl("~/Libraries/Gentallela/build/js/custom.min.js") %>"></script>
    </form>
</body>
</html>
