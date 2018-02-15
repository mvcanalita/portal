<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indetJDAreports.aspx.cs" Inherits="jdaPortal.Pages.indetJDAreports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JDA Reports</title>
    <link href="../Framework/Gentellela/css/bootstrap.css" rel="stylesheet" />
    <link href="../Framework/Gentellela/css/font-awesome.css" rel="stylesheet" />
    <link href="../Framework/gc-scrollbar.css" rel="stylesheet" />
    <link href="../Framework/Gentellela/css/custom.css" rel="stylesheet" />
    <link href="../Framework/Gentellela/css/switchery.css" rel="stylesheet" />
</head>
<body class="nav-md fixed-footer">
    <form id="form1" runat="server">
        <div class="container body">
          <div class="main_container">
            <div class="col-md-3 left_col">
              <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                  <a href="<%=ResolveUrl("~/Default.aspx") %>" class="site_title"><i class="fa fa-tree"></i> <span>JDA Reports</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile">
                  <div class="profile_pic">
                    <img src="../img/avatar/Male-3.jpg" alt="..." class="img-circle profile_img" runat="server" id="usrAvatar" />
                  </div>
                  <div class="profile_info">
                    <span>Welcome,</span>
                    <h2>John Doe</h2>
                  </div>
                </div>
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                  <div class="menu_section">
                    <h3>General</h3>
                    <ul id="menu" class="nav side-menu">

                    </ul>
                  </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                  <a data-toggle="tooltip" data-placement="top" title="Settings">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                  </a>
                  <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                    <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                  </a>
                  <a data-toggle="tooltip" data-placement="top" title="Lock">
                    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                  </a>
                  <a data-toggle="tooltip" data-placement="top" title="Logout">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                  </a>
                </div>
                <!-- /menu footer buttons -->
              </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">
              <div class="nav_menu">
                <nav class="" role="navigation">
                  <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                  </div>

                  <ul class="nav navbar-nav navbar-right">
                    <li class="">
                      <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="../img/avatar/Male-3.jpg" alt="" />John Doe
                        <span class=" fa fa-angle-down"></span>
                      </a>
                      <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;"> Profile</a></li>
                        <li>
                          <a href="javascript:;">
                            <span class="badge bg-red pull-right">50%</span>
                            <span>Settings</span>
                          </a>
                        </li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="<%=ResolveUrl("~/User/Logout.aspx") %>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                      </ul>
                    </li>

                    <li role="presentation" class="dropdown">
                      <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green">6</span>
                      </a>
                      <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        <li>
                          <a>
                            <span class="image"><img src="../img/avatar/Male-1.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="../img/avatar/feMale-1.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="../img/avatar/Male-2.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <a>
                            <span class="image"><img src="../img/avatar/feMale-2.jpg" alt="Profile Image" /></span>
                            <span>
                              <span>John Smith</span>
                              <span class="time">3 mins ago</span>
                            </span>
                            <span class="message">
                              Film festivals used to be do-or-die moments for movie makers. They were where...
                            </span>
                          </a>
                        </li>
                        <li>
                          <div class="text-center">
                            <a>
                              <strong>See All Alerts</strong>
                              <i class="fa fa-angle-right"></i>
                            </a>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
              <div class="">
                  <div class="page-title">
                      <div class="title_left">
                        <h3>
                          Generated Reports <small>(Total Transaction: <asp:Label ID="lblTransCount" runat="server" Text="000"></asp:Label>)</small>
                        </h3>
                      </div>

                      <div class="title_right">
                          <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                              <div class="input-group">
                                  <input type="text" class="form-control" placeholder="Search here" />
                                  <span class="input-group-btn">
                                      <button type="button" class="btn btn-default">Go</button>
                                  </span>
                              </div>
                          </div> 
                      </div>

                  </div>

                  <div class="clearfix"></div>
                  <div class="x_panel">
                      <div class="x_title">
                          <h2><asp:Label ID="lblSelectedReport" runat="server" Text="Report Elements"></asp:Label></h2>
                          <div class="clearfix"></div>
                      </div>
                      <div class="x_content">
                          <div class="panel-body syp">
                                <asp:GridView ID="listPnl"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="Value,Text"
                                    AllowPaging="True" GridLines="None" HorizontalAlign="Center" PagerStyle-CssClass="pagination"  PageSize="10" EmptyDataText="No Data" ShowFooter="True" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField DataField="Text" HeaderText="Filename" />
                                        <asp:TemplateField HeaderText="Download" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" runat="server"  ToolTip="Download File!">
                                                    <span data-type="tooltip" data-tooltip="Download" data-pos="right" class="glyphicon glyphicon-save text-center"></span> Download
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="94" />
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View" >
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="linkEdit" CommandName="ViewFile" CssClass="table-option" ToolTip="View in separate window!" >
                                                        <span data-type="tooltip" data-tooltip="View" data-pos="right" class="glyphicon glyphicon-eye-open text-center"></span> View
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="94" />
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                    </Columns>
                                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                                    <PagerStyle CssClass="pagination pagination-lg" />
                                </asp:GridView>
                            </div>
                          
                      </div>
                  </div>
              </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
              <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
              </div>
              <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
          </div>
        </div>
    </form>
    <script src="../Framework/Gentellela/js/jquery.js"></script>
    <script src="../Framework/Gentellela/js/bootstrap.js"></script>
    <script src="../Framework/Gentellela/js/switchery.js"></script>
    <script src="../Framework/Gentellela/js/custom.js"></script>
    <script>
        $(document).ready(function () {


            $.ajax({
                url: '../data/MenuHandler.ashx',
                method: 'get',
                dataType: 'json',
                success: function (data) {
                    buildMenu($('#menu'), data);
                }
            });

            function buildMenu(parent, items) {
                $.each(items, function () {
                    var li;
                    if (!this.menuLink) {

                        var iconClass;
                        var accordionBtnText = this.menuTxt;

                        switch (accordionBtnText) {
                            case 'Merchandising':
                                iconClass = 'fa fa-shopping-cart';
                                break;
                            case 'Accounting':
                                iconClass = 'fa fa-bar-chart';
                                break;
                            case 'Cash Management':
                                iconClass = 'fa fa-money';
                                break;
                            case 'Compliance':
                                iconClass = 'fa fa-taxi';
                                break;
                            case 'Operations':
                                iconClass = 'fa fa-globe';
                                break;
                            default:
                                iconClass = 'fa fa-bomb';
                                break;
                        }

                        li = $('<li><a class="header"></span><i class="' + iconClass + '"></i>' + accordionBtnText + '<span class="fa fa-chevron-down"></span></a></li>');
                    } else {
                        
                        li = $('<li><a id="' + this.reportFilename + '" class="viewReports" >' + this.menuTxt + '</a></li>');
                        
                    }
                    if (!this.isActive) {
                        li.addClass('ui-state-disabled');
                    }
                    li.appendTo(parent);

                    if (this.menuList && this.menuList.length > 0) {
                        var ul = $('<ul class="nav child_menu"></ul>');
                        ul.appendTo(li);
                        buildMenu(ul, this.menuList);
                    }
                });
            };
        });
    </script>
    <script type="text/javascript">
        $BODY = $('body'),
        $MENU_TOGGLE = $('#menu_toggle'),
        $SIDEBAR_MENU = $('#sidebar-menu'),
        $SIDEBAR_FOOTER = $('.sidebar-footer'),
        $LEFT_COL = $('.left_col'),
        $RIGHT_COL = $('.right_col'),
        $NAV_MENU = $('.nav_menu'),
        $FOOTER = $('footer');

        var setContentHeight = function () {
            // reset height
            $RIGHT_COL.css('min-height', $(window).height());

            var bodyHeight = $BODY.outerHeight(),
                footerHeight = $BODY.hasClass('footer_fixed') ? 0 : $FOOTER.height(),
                leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
                contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;

            // normalize content
            contentHeight -= $NAV_MENU.height() + footerHeight;

            $RIGHT_COL.css('min-height', contentHeight);
        };

        $(document).on('click', '.header', function (ev) {
            var $li = $(this).parent();

            if ($li.is('.active')) {
                $li.removeClass('active active-sm');
                $('ul:first', $li).slideUp(function () {
                    setContentHeight();
                });
            } else {
                // prevent closing menu if we are on child menu
                if (!$li.parent().is('.child_menu')) {
                    $('#sidebar-menu').find('li').removeClass('active active-sm');
                    $('#sidebar-menu').find('li ul').slideUp();
                }

                $li.addClass('active');

                $('ul:first', $li).slideDown(function () {
                    setContentHeight();
                });
            }
        });


        $(document).on('click', '.viewReports', function () {
            $.ajax({
                type: "POST",
                url: "indetJDAreports.aspx/sampleFucktion",
                data: "{ 'sessionName' : '" + $(this).attr('id') + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                }
            });
        });

    </script>
</body>
</html>
