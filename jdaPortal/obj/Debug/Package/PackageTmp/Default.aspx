<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jdaPortal.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #text_area {
            min-height:300px;
            height:300px;
            overflow-y:scroll;
            overflow-wrap:break-word;
            padding-right:10px;
            margin-bottom:10px;
        }
        #discussion {
            list-style: none;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Static Contents</h4>
                    </div>
                    <div class="panel-body">
                        <div>
                            <h4>Merchandising</h4>
                            <ol>
                                <li>Buy/Sell Rebate Item  <strong>REB056 </strong>  Portable Document(PDF)</li>
                                <li>Inventory Transactions <strong>INV041</strong> Portable Document(PDF)</li>
                                <li>Inventory Valuation Report <strong>INV111</strong> Excel Document(XLS)</li>
                                <li>Inventory Valuation Summary <strong>INV112</strong> Excel Document(XLS)</li>
                                <li>Lump Sum Rebate - xls <strong>REB011</strong> Excel Document(XLS)</li>
                                <li>LumpSum Rebate alloc <strong>REB011</strong> Portable Document(PDF)</li>
                                <li>Out of Stock Report <strong>INV170</strong> Excel Document(XLS)</li>
                                <li>Over Stock Report <strong>INV172</strong> Excel Document(XLS)</li>
                                <li>PO Confirmation <strong>POM346</strong> Portable Document(PDF)</li>
                                <li>PO Status Report <strong>POM092</strong> Portable Document(PDF)</li>
                                <li>Purchase Order <strong>POM343</strong> Portable Document(PDF)</li>
                                <li>SSR Detail Listing <strong>INV110</strong> Excel Document(XLS)</li>
                                <li>Vendor Analysis <strong>INV133</strong> Excel Document(XLS)</li>
                                <li>Vendor Rebate Claims <strong>REB035</strong> Portable Document(PDF)</li>
                                <li>Weekly Item Velocity <strong>INV121</strong> Excel Document(XLS)</li>
                            </ol>
                            <h4>Accounting</h4>
                            <ol>
                                <li>Detailed Account Listing <strong>GL0024</strong> Excel Document(XLS)</li>
                                <li>Edit Listing <strong>AP0230</strong> Excel Document(XLS)</li>
                                <li>Forced Match Audit Report <strong>AP0334</strong> Excel Document(XLS)</li>
                                <li>Invoice Register <strong>AP0173</strong> Excel Document(XLS)</li>
                                <li>Journal Entry Edit List <strong>GL0012</strong> Portable Document(PDF)</li>
                                <li>Open Invoice Listing <strong>AP0064P1</strong> Excel Document(XLS)</li>
                                <li>Open Invoice Listing <strong>AP0064P1</strong> Excel Document(XLS)</li>
                                <li>Post to Unmatched Payables <strong>AP0211P1</strong> Excel Document(XLS)</li>
                                <li>TP Invoices AC <strong>AP0303</strong> Excel Document(XLS)</li>
                                <li>TP Invoices CA <strong>AP0304</strong> Excel Document(XLS)</li>
                                <li>TP Post To Unmatch <strong>AP0211</strong> Excel Document(XLS)</li>
                                <li>Trial Balance <strong>GL0015</strong> Excel Document(XLS)</li>
                                <li>Unmatched Receiver <strong>AP0339</strong> Excel Document(XLS)</li>
                                <li>Unmatched Receivers <strong>AP0339P1</strong> Excel Document(XLS)</li>
                            </ol>
                            <h4>Cash Management</h4>
                            <ol>
                                <li>Cheque <strong>AP0032P1</strong> Portable Document(PDF)</li>
                                <li>Remittance Advice <strong>AP0032P2</strong> Portable Document(PDF)</li>
                            </ol>
                            <h4>Compliance</h4>
                            <ol>
                                <li>Invoice Register for Prd/Yr <strong>AP0173</strong> Excel Document(XLS)</li>
                                <li>Trade Payables (Acc/Loc) <strong>AP0303</strong> Excel Document(XLS)</li>
                                <li>Trade Payables (Loc/Acc) <strong>AP0304</strong> Excel Document(XLS)</li>
                                <li>Unposted Batches Report <strong>AP0218</strong> Excel Document(XLS)</li>
                            </ol>
                            <h4>Concessions</h4>
                            <ol>
                                <li>Average Cost Exception - Cores <strong>CST022</strong> Excel Document(XLS)</li>
                                <li>Con to AP Interface - PDF <strong>CON178</strong> Portable Document(PDF)</li>
                                <li>Con to AP Interface - xls <strong>CON178P1</strong> Excel Document(XLS)</li>
                                <li>Consignment Contract <strong>CON200</strong> Excel Document(XLS)</li>
                                <li>Consignment to AP Interface - pdf <strong>CON178</strong> Portable Document(PDF)</li>
                                <li>Consignment to AP Interface - xls <strong>CON178</strong> Excel Document(XLS)</li>
                                <li>Daily Transaction Report <strong>CON186</strong> Excel Document(XLS)</li>
                            </ol>
                            <h4>Inventory Management</h4>
                            <ol>
                                <li>Complete Received Transfer <strong>TRF087</strong> Excel Document(XLS)</li>
                                <li>Detail Use Listing <strong>INV184</strong> Excel Document(XLS)</li>
                                <li>Inventory Count Dept Variance <strong>CY0004</strong> Portable Document(PDF)</li>
                                <li>Inventory Count SKU Variance <strong>CY0002</strong> Portable Document(PDF)</li>
                                <li>Inventory Movement Report <strong>INV106</strong> Excel Document(XLS)</li>
                                <li>Transfer Descripancy <strong>TRF171</strong> Excel Document(XLS)</li>
                                <li>Transfer Summary Reports <strong>TRF100</strong> Excel Document(XLS)</li>
                                <li>Unreceived Transfers <strong>TRF035</strong> Excel Document(XLS)</li>
                                <li>Vendor Return Summary <strong>RTV049</strong> Excel Document(XLS)</li>
                            </ol>
                            <h4>Operations</h4>
                            <ol>
                                <li>Department Sales Ranking <strong>SLS177</strong> Excel Document(XLS)</li>
                                <li>Department Sales Recap <strong>SLS220</strong> Excel Document(XLS)</li>
                                <li>Sales by Dep and District <strong>SLS052</strong> Excel Document(XLS)</li>
                                <li>Sales by Dep-Dist-Store <strong>SLS054</strong> Excel Document(XLS)</li>
                                <li>Sales by Dep/Distrct - UWA <strong>SLS074</strong> Excel Document(XLS)</li>
                                <li>Sales for Dept Ranking <strong>SLS201</strong> Excel Document(XLS)</li>
                                <li>Sales Ranking Listing <strong>SLS176</strong> Excel Document(XLS)</li>
                                <li>Sales Trends for Dept Ranking <strong>SLS202</strong> Excel Document(XLS)</li>
                                <li>Store Flash Report <strong>SLS128</strong> Excel Document(XLS)</li>
                                <li>Store Sales Summary <strong>SLS050</strong> Excel Document(XLS)</li>
                                <li>Weekly Gross Margin <strong>SLS049</strong> Excel Document(XLS)</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Hello World!</h3>
                    </div>
                    <div class="panel-body">
                        <div id="chatBox">
                            <div id="text_area">
                                <ul id="discussion">
                                </ul>
                            </div>
                            <div id="input_area">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon2">@Message</span>
                                    <input type="text" id="message" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="<%: ResolveClientUrl("~/Scripts/jquery.signalR-2.2.1.js") %>"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>'></script>
    <script type="text/javascript">
        $('input[type="text"], input[type="radio"], input[type="checkbox"]').keydown(function (event) {
            if (event.keyCode == 13) {
                event.preventDefault();
                return false;
            }
        });
    </script>
    <script type="text/javascript">
        $(function () {
            // Declare a proxy to reference the hub. 
            var chat = $.connection.chatHub;
            // Create a function that the hub can call to broadcast messages.
            chat.client.broadcastMessage = function (name, message) {
                // Html encode display name and message. 
                var encodedName = $('<div />').text(name).html();
                var encodedMsg = $('<div />').text(message).html();
                // Add the message to the page. 
                $('#discussion').append('<li><strong>' + encodedName
                    + '</strong> :&nbsp;&nbsp;' + encodedMsg + '</li>');
            };
                       // Set initial focus to message input box.  
            $('#message').focus();
            // Start the connection.
            $.connection.hub.start().done(function () {
                $('#message').keydown(function (e) {
                    if (e.which === 13) {
                        chat.server.send('<%: jdaPortal.Toolkit.portalSession.LoggedUser.UsrNName  %>', $('#message').val());
                        // Clear text box and reset focus for next comment. 
                        $('#message').val('').focus();
                        $('#text_area').stop().animate({
                            scrollTop: $('#text_area')[0].scrollHeight
                        },800);
                    }
                });
            });
        });
    </script>
</asp:Content>
