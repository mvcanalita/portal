<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdfList.aspx.cs" Inherits="jdaPortal.pdfList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Portal</title>
    <link href="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-3.3.6-dist/styleMain.css" rel="stylesheet" />
    <style>
        .syp {
            padding:0;
        }
        .syp table > tbody > th, .syp table > tbody > td {
            padding-left: 20px;
        }

        .ModalPopupBG
        {
            background-color: #666699;
            filter: alpha(opacity=50);
            opacity: 0.7;
        }

        .HellowWorldPopup
        {
            min-width:500px;
            min-height:150px;
            background:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="<% ResolveUrl("~/pdfList.aspx"); %>">JDA Portal</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-link"> Profile </span><span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li>
                        <asp:LinkButton ID="lnkPopup" runat="server">Change User</asp:LinkButton>

                    </li>
                    <li><a href="#">Email Concern</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="#">Logout</a></li>
                  </ul>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2><span class="glyphicon glyphicon-list"></span> Details</h2>
                    </div>
                    <div class="panel-body">
                        <h3>Transaction Count</h3>
                        <p>
                           Transaction count: <asp:Label ID="lblCOunt" runat="server" Text="--"></asp:Label>
                        </p>
                        
                    </div>
                    
                </div>
            </div>
            <div class="col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2><span class="glyphicon glyphicon-tasks"></span> Spooled File List</h2>
                    </div>
                    <div class="panel-body syp">
                        <asp:GridView ID="listPnl" runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="Value,Text" OnRowCommand="listPnl_RowCommand" AllowPaging="True" GridLines="None" OnPageIndexChanging="listPnl_PageIndexChanging" PagerStyle-CssClass="pagination">
                            <Columns>
                                <asp:ButtonField DataTextField="Text" HeaderText="File Name" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile">
                                            <span data-type="tooltip" data-tooltip="Download" data-pos="right" class="glyphicon glyphicon-save text-center"></span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="View" CssClass="table-option">
                                                <span data-type="tooltip" data-tooltip="View" data-pos="right" class="glyphicon glyphicon-eye-open text-center"></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="50" />
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

        <asp:scriptmanager id="ScriptManager1" runat="server">
        </asp:scriptmanager>
        
        <asp:ModalPopupExtender  runat="server"
            id="ModalPopupExtender1"
	        cancelcontrolid="btnCancel"  
	        targetcontrolid="lnkPopup" popupcontrolid="Panel1" 
	        popupdraghandlecontrolid="PopupHeader" drag="true" 
	        backgroundcssclass="ModalPopupBG"></asp:ModalPopupExtender>
        
        <asp:panel id="Panel1"  runat="server" CssClass="panel panel-warning">
	        <div class="HellowWorldPopup">
                <div class="panel-heading">
                    <h3>Welcome Master</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-primary" OnClick="btnAccept_Click" CausesValidation="true"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:panel>

    </form>

    <%--scripts--%>
    <script src="<%= ResolveUrl("bootstrap-3.3.6-dist/jquery-2.2.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/js/bootstrap.js") %>"></script>
    
    <script type="text/javascript">
        function pageLoad() {
            ShowPopup();
            setTimeout(HidePopup, 2000);
        }

        function ShowPopup() {
            $find('modalpopup').show();
            //$get('Button1').click();
        }

        function HidePopup() {
            $find('modalpopup').hide();
            //$get('btnCancel').click();
        }
    </script>
</body>
</html>
