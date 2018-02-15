<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataPage.aspx.cs" Inherits="jdaPortal.Pages.DataPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pagination-ys {
    /*display: inline-block;*/
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}

.pagination-ys table > tbody > tr > td {
    display: inline;
}

.pagination-ys table > tbody > tr > td > a,
.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;
    color: #2a3f54;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    margin-left: -1px;
}

.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;    
    margin-left: -1px;
    z-index: 2;
    color: #aea79f;
    background-color: #f5f5f5;
    border-color: #dddddd;
    cursor: default;
}

.pagination-ys table > tbody > tr > td:first-child > a,
.pagination-ys table > tbody > tr > td:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
}

.pagination-ys table > tbody > tr > td:last-child > a,
.pagination-ys table > tbody > tr > td:last-child > span {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px;
}

.pagination-ys table > tbody > tr > td > a:hover,
.pagination-ys table > tbody > tr > td > span:hover,
.pagination-ys table > tbody > tr > td > a:focus,
.pagination-ys table > tbody > tr > td > span:focus {
    color: #2a3f54;
    background-color: #eeeeee;
    border-color: #dddddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="page_title">
        <div class="title_left">
            <h3>
                <asp:Label ID="lblRepTitle" runat="server" Text="Report Type Here "></asp:Label>
                <small> Transaction Count <asp:Label ID="lblCOunt" runat="server" Text="--"></asp:Label></small>
            </h3>
        </div>
        <div class="title_right">
            <div class="col-md-3 col-sm-3 col-xs-5 form-group pull-right top_search">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control darkerSearchInput" Placeholder="Search For?"></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:Button ID="btnSearch" runat="server" Text="Go!" CssClass="btn btn-default roundedSearch" OnClick="btnSearch_Click"/>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <asp:GridView ID="listPnl"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="Value,Text"
                    AllowPaging="True" GridLines="None" OnPageIndexChanging="listPnl_PageIndexChanging" HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="listPnl_RowCommand" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="Text" HeaderText="Filename" />
                        <asp:TemplateField HeaderText="Download" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile" ToolTip="Download File!">
                                    <span data-type="tooltip" data-tooltip="Download" data-pos="right" class="glyphicon glyphicon-save text-center"></span> Download
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="94" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="View" >
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="linkEdit" CommandArgument = '<%# Eval("Value") %>' CommandName="ViewFile" CssClass="table-option" ToolTip="View in separate window!" >
                                        <span data-type="tooltip" data-tooltip="View" data-pos="right" class="glyphicon glyphicon-eye-open text-center"></span> View
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="94" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                    </Columns>
                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    
</asp:Content>
