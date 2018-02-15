<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="jdaPortal.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome Stranger :)</title>
    <link href="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-3.3.6-dist/styleMain.css" rel="stylesheet" />
    <link href="bootstrap-3.3.6-dist/gc-scrollbar.css" rel="stylesheet" />

    <style>
        .loginP{
            width: 350px;
            margin: 0 auto;
        }
        .img-up{

            width: 60px;
            margin: 0 auto;
            margin-top: 10px;
        }
        .reglbl{
            font-size:12px;
            font-weight: normal;
            font-style:normal;
        }
        .ModalPopupBG
        {
            background-color: #666699;
            filter: alpha(opacity=50);
            opacity: 0.7;
        }

        .HellowWorldPopup
        {
            min-width: 300px;
            min-height:150px;
            background:white;
            max-width: 600px;
        }
       body{
         margin-top:100px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="pnlLoginForm" runat="server" CssClass="panel panel-success loginP">
            <div class="panel-heading">
                <div class="text-center">
                    <asp:Image ID="Image1" ImageUrl="~/img/maleuser.png" runat="server" CssClass="img-circle img-responsive img-up" />
                    <h4>Welcome</h4>
                </div>
            </div>
            <div class="panel-body">
                
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                            <asp:TextBox ID="txtUname" runat="server" CssClass="form-control"> </asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock"></span></span>
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="form-control btn btn-primary" OnClick="btnLogin_Click"/>
                </div>
            </div>
            <div class="panel-footer">
                <div class="text-center reglbl">
                    <label>Not yet registered? Click <asp:LinkButton ID="lnkReg" runat="server" OnClick="lnkReg_click">here</asp:LinkButton></label>
                    <asp:LinkButton ID="LinkButton1"  runat="server"></asp:LinkButton>
                </div>
            </div>
        </asp:Panel>
    </div>
    
    <asp:ScriptManager ID="AJAXscrptMan" runat="server">
    </asp:ScriptManager>
    <asp:ModalPopupExtender ID="AJAXmodalreg" runat="server"
    cancelcontrolid="modalClose"  
	targetcontrolid="LinkButton1" popupcontrolid="pnlReg" 
	popupdraghandlecontrolid="PopupHeader" drag="True" 
	backgroundcssclass="ModalPopupBG" OkControlID="btnSave" EnableViewState="True"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlReg" runat="server" CssClass="panel mypanel" Style="display:none" >
        <div class="HellowWorldPopup">
            <div class="panel-heading">
                <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                <h4>
                    System Admin
                </h4>
            </div>
            <div class="panel-body">
                <p>
                    <asp:Label ID="lblErrorMsg" runat="server" Text="Msg Here"></asp:Label>
                </p>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnSave" Type="button" runat="server" Text="Okay" CssClass="btn btn-primary" CausesValidation="true"/>
            </div>
        </div>
        </asp:Panel>
    </form>
    <script src="<%= ResolveUrl("bootstrap-3.3.6-dist/jquery-2.2.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/js/bootstrap.js") %>"></script>
  
</body>
</html>
