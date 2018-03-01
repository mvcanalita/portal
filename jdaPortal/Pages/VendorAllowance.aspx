<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorAllowance.aspx.cs" Inherits="jdaPortal.Pages.VendorAllowance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fixed-width-addon {
            min-width: 120px;
            text-align: right;
        }
        .horizontal-alignment-center {
            line-height: 25px;
        }
        .modal-align-center {
            width: 420px;
            margin: 0 auto;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="">
            <div class="x_panel">
                <div class="x_title">
                    <h2><i class="fa fa-database"></i> Vendor Allowances</h2>
                    <ul class="nav navbar-right panel_toolbox" style="text-align:center;">
                        <li><a href="#" data-toggle="modal" data-target="#search_modal"><i class="fa fa-search"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <a href="#" data-toggle="modal" data-target="#modal_show_details"><i class="fa fa-search"></i></a>

                    <%-- Data Grid View --%>
                    <asp:GridView ID="lstVndorAllowance"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" 
                        AllowPaging="True" GridLines="None"  HorizontalAlign="Center" PagerStyle-CssClass="pagination"  PageSize="10"
                        DataKeyNames="ASNUM"
                         EmptyDataText="No value or Null" ShowHeaderWhenEmpty="True" HeaderStyle-CssClass="no_hover">
                        <Columns>
                            <%--<asp:BoundField DataField="CategoryDesc" HeaderText="Description" ItemStyle-CssClass="text-elipse" ItemStyle-Width="400px" />--%>
                            <asp:BoundField DataField="ASNUM" HeaderText="From" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="linkEdit" data-toggle="modal" data-target="#modal_show_details" CommandName="Edit" OnClientClick="return false" CssClass="table-option">
                                        <span data-type="tooltip" data-tooltip="Edit" data-pos="right"><i class="material-icons">Select</i></span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50" />
                            </asp:TemplateField>
                        </Columns> 
                        <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                        <PagerStyle CssClass="pagination pagination-lg" />
                    </asp:GridView> <!-- end gridview -->
                    <%-- Data Grid View --%>
                </div>
            </div>
            <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Search Parameter</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="modal-align-center">
                                <div class="form-group" style="text-align: right;">
                                    <label for="vendor" class="col-sm-4">Vendor</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="vendor" id="vendor" class="form-control" />
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="form-group" style="text-align: right;">
                                    <label for="dept" class="col-sm-4 horizontal-alignment-center">Department</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="dept" id="dept" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: right;">
                                    <label for="subdept" class="col-sm-4 horizontal-alignment-center">Sub Department</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="subdept" id="subdept" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: right;">
                                    <label for="iclass" class="col-sm-4 horizontal-alignment-center">Class</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="iclass" id="iclass" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: right;">
                                    <label for="isclass" class="col-sm-4 horizontal-alignment-center">Sub Class</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="isclass" id="isclass" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <p style="display: block;width: 100%;text-align:center; margin: 10px;">
                            <span class="line">------------ </span>OR<span class="line"> ------------</span>
                        </p>

                        <div class="row">
                            <div class="modal-align-center">
                                <div class="form-group" style="text-align: right;">
                                    <label for="mstyleno" class="col-sm-4 horizontal-alignment-center">Style No</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="mstyleno" id="mstyleno" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p style="display: block;width: 100%;text-align:center; margin: 10px;">
                            <span class="line">------------ </span>OR<span class="line"> ------------</span>
                        </p>
                        <div class="row">
                            <div class="modal-align-center">
                                <div class="form-group" style="text-align: right;">
                                    <label for="skuno" class="col-sm-4 horizontal-alignment-center">SKU Number</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="skuno" id="skuno" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="clear-fix"></div>
                    </div>
                   
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Search</button>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modal_show_details" aria-hidden="true" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="modal_shw_dtls">Details</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 ">
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="vcode">Vendor Code</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Vendor Code" aria-label="Vendor Code" aria-describedby="vcode" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="vname">Vendor Name</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Vendor Name" aria-label="Vendor Code" aria-describedby="vname" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon  fixed-width-addon">
                                <span class="input-group-text" id="dptnum">Department No</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Department No" aria-label="Department No" aria-describedby="dptnum" disabled />
                        </div>
                        <div class="input-group ">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="subdeptno">Sub-dept No</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Sub-dept No" aria-label="Sub-dept No" aria-describedby="subdeptno" disabled />
                        </div>
                        <div class="input-group ">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="subclass">Sub Class</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Sub Class" aria-label="Sub Class" aria-describedby="subclass" disabled />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="skunum">SKU Number</span>
                            </div>
                            <input type="text" class="form-control" placeholder="SKU Number" aria-label="SKU Number" aria-describedby="skunum" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="idescr">Item Name</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Description" aria-label="SKU Number" aria-describedby="idescr" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="alwtype">Allow Type</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Type" aria-label="Allowance Type" aria-describedby="alwtype" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="alwdesc">Description</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Allowance Description" aria-label="Description" aria-describedby="alwdesc" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="alwnum">Allowance No</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Allowance No" aria-label="Allowance No" aria-describedby="alwnum" disabled />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="percentoff">% off</span>
                            </div>
                            <input type="text" class="form-control" placeholder="% off" aria-label="% off" aria-describedby="percentoff" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="datecovered">From & To</span>
                            </div>
                            <input type="text" class="form-control" placeholder="From & To" aria-label="From & To" aria-describedby="datecovered" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="afccst">Affect COGS?</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Affect COGS?" aria-label="Affect COGS?" aria-describedby="afccst" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="aplnet">Apply to Net?</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Apply to Net?" aria-label="Apply to Net" aria-describedby="aplnet" disabled />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon fixed-width-addon">
                                <span class="input-group-text" id="styleno">Style No</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Style No" aria-label="Style No" aria-describedby="styleno" disabled />
                        </div>
                    </div>
                </div>
                <div class="clear-fix"></div>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
