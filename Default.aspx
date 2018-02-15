<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jdaPortal.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
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
                        <asp:GridView ID="listPnl" runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="Value,Text"
                            AllowPaging="True" GridLines="None" OnPageIndexChanging="listPnl_PageIndexChanging" PagerStyle-CssClass="pagination">
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
                                            <asp:LinkButton runat="server" ID="linkEdit" CommandArgument = '<%# Eval("Value") %>' CommandName="View" CssClass="table-option" OnClick="ViewFile">
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
	        cancelcontrolid="modalClose"  
	        targetcontrolid="lnkPopup" popupcontrolid="Panel1" 
	        popupdraghandlecontrolid="PopupHeader" drag="true" 
	        backgroundcssclass="ModalPopupBG"></asp:ModalPopupExtender>
        
        <asp:panel id="Panel1" Style="display:none" runat="server" CssClass="panel panel-warning" >
	        <div class="HellowWorldPopup">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                    <h3>Welcome Master</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-primary" OnClick="btnAccept_Click" CausesValidation="true"/>
                </div>
            </div>
        </asp:panel>
</asp:Content>
