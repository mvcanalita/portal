<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPane.aspx.cs" Inherits="jdaPortal.User.AdminPane" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Libraries/Gentallela/vendors/iCheck/skins/flat/flat.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>User Profile Management</h3>
                </div>

                <div class="title-right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearchUser" runat="server" Placeholder="Search for.." CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="searchUsr" runat="server" Text="Go!" CssClass="btn btn-default form-control" style="border-radius: 0 20px 20px 0;" OnClick="searchUsr_Click" />
                            </span> 
                        </div> <!-- end input group -->
                    </div>
                </div> <!-- end title right -->
            </div> <!-- end page title -->

            <!-- Start user search result -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Search Result <small>database query</small></h2>
                            <ul class="nav navbar-right ">
                              <li ><a class="collapse-link" style="padding:5px; cursor:pointer;"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="form-horizontal form-label-left">
                                <asp:GridView ID="listPnl"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" 
                                    AllowPaging="True" GridLines="None"  HorizontalAlign="Center" PagerStyle-CssClass="pagination"  PageSize="10"
                                    DataKeyNames="UsrInfoID,UsrName,UsrPass,UsrIsLog,UsrStatus,UsrLastLog,UsrGroupID,UsrModuleAccess,UsrEmpCode,UsrFName,UsrMName,UsrLName,
                                    UsrPosition,UsrSection,UsrAddress,UsrEAdd,DepName,DepCode,UsrGroupName,usrActive" OnRowCommand="listPnl_RowCommand" EmptyDataText="No value or Null" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Employee No">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblEmpNo" Text='<%# Eval("UsrEmpCode") %>' CssClass="text-elipse" style="display: block;"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100" />
                                        </asp:TemplateField>
                                        <%--<asp:BoundField DataField="CategoryDesc" HeaderText="Description" ItemStyle-CssClass="text-elipse" ItemStyle-Width="400px" />--%>
                                        <asp:TemplateField HeaderText="Fullname">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="EmpName" Text='<%# Eval("UsrLName") + " "+ Eval("UsrFName") + ", " + Eval("UsrMName")  %>' CssClass="text-elipse" style="display: block;" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="250" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UsrName" HeaderText="Username" htmlencode="false" />
                                        <asp:BoundField DataField="DepName" HeaderText="Department" />
                                        <asp:BoundField DataField="UsrPosition" HeaderText="Designation" />
                                        <asp:BoundField DataField="UsrEAdd" HeaderText="Email" />
                                        <asp:BoundField DataField="usrActive" HeaderText="Active?" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="linkEdit" CommandName="selectedRecord" CssClass="table-option">
                                                    <span data-type="tooltip" data-tooltip="Edit" data-pos="right"><i class="material-icons">Select</i></span>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="50" />
                                        </asp:TemplateField>
                                    </Columns> 
                                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                                    <PagerStyle CssClass="pagination pagination-lg" />
                                </asp:GridView> <!-- end gridview -->
                            </div> <!-- end form-horizontal -->
                        </div> <!-- end content -->
                    </div> <!-- end x_panel -->
                </div>
            </div> <!-- end row for db result -->

            <!-- start row for user information -->
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12" style="padding:0;">
                    
                    <div class="col-md-12 col-sm-12 col-xs-12" style="padding:0;">
                    <div class="col-md-12 col-sm-12 col-xs-12"> <!--Start col-md-6-->
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>User Personal Details</h2>
                                <ul class="nav navbar-right ">
                                  <li ><a class="collapse-link" style="padding:5px; cursor:pointer;"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Username</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                        
                                            <input type="text" id="pUsername" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Password</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <asp:TextBox ID="pPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Employee Code</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pempCode" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">First Name</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pFName" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Last Name</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pLName" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Middle Name</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pMName" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Designation</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pDesignation" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Site</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pSection" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Address</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="pAddress" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Department</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <asp:DropDownList ID="ddlDepartment" CssClass="form-control" runat="server" AutoPostBack="True" AppendDataBoundItems="True"  DataTextField="DepName" DataValueField="DepCode">
                                                <asp:ListItem Text="None Department" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Email Address</label>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input type="text" id="peAddress" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label class="control-label col-md-4 col-sm-4 col-xs-12">Status</label>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="">
                                                <label>
                                                    <asp:CheckBox ID="rbIsActive" runat="server" CssClass="iCheck"/> isActive?
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="">
                                                <label>
                                                    <asp:CheckBox ID="rbUsrIsLog" runat="server" CssClass="iCheck"/> User Logged?
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div> <%--form-horizontal--%>
                                <div class="clearfix"></div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12 ">
                                    <div class="">
                                        <asp:Button ID="updatePersonalInfo" csslass="btn btn-primary pull-right" runat="server" Text="Update" OnClick="updatePersonalInfo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!--end col-md-6-->
                </div>
                <%--todo: add col-md-12 for access--%>
            </div>

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel"> <!-- Group Panel -->
                            <div class="x_title">
                                <h2>User group <small>- current user group -</small></h2>
                                <ul class="nav navbar-right ">
                                  <li ><a class="collapse-link" style="padding:5px; cursor:pointer;"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Group Name</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="GroupName" runat="server" class="form-control" disabled="disabled" placeholder="Group Name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Group Code</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="GroupCode" runat="server" class="form-control" disabled="disabled" placeholder="Group Code" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">New Group</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <asp:DropDownList ID="ddlGroup" CssClass="form-control" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataTextField="UsrGroupName" DataValueField="UsrGroupID">
                                                <asp:ListItem Text="Select Group" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div> <%--form-horizontal--%>
                            <div class="clearfix"></div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12 ">
                                    <div class="">
                                        <asp:Button ID="updateUsrGroup" csslass="btn btn-primary" runat="server" Text="Update" OnClick="updateUsrGroup_Click" />
                                    </div>
                                </div>
                            </div>
                            </div> <!--end x-content-->
                            
                        </div><!-- End Group panel -->
                    </div> <!--end col-md-6-->
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="x_panel">
                             <div class="x_title">
                                <h2>User Access Pane</h2>
                                <ul class="nav navbar-right ">
                                  <li ><a class="collapse-link" style="padding:5px; cursor:pointer;"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <h2>Available Access</h2>
                                <asp:GridView ID="AccessGrid"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" 
                                    AllowPaging="false" GridLines="None"  HorizontalAlign="Center" PagerStyle-CssClass="pagination" 
                                    DataKeyNames="UsrAccessCode,UsrAccessDesc,UsrAccessID" EmptyDataText="No value or Null" ShowHeaderWhenEmpty="True" OnRowCommand="AccessGrid_RowCommand" OnPageIndexChanging="AccessGrid_PageIndexChanging" ShowFooter="True" >
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="rbAccess" CommandName="Edit" CssClass="iCheck" />
                                            </ItemTemplate>
                                            <ItemStyle Width="50" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UsrAccessCode" HeaderText="Access Code" htmlencode="false" />
                                        <asp:BoundField DataField="UsrAccessDesc" HeaderText="Description" />
                                    </Columns> 
                                    <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                                    <PagerStyle CssClass="pagination pagination-lg" />
                                </asp:GridView> <!-- end gridview -->
                                <div class="clearfix"></div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12 ">
                                    <div class="">
                                        <asp:Button ID="btnUpdateAccessibleModule" csslass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdateAccessibleModules_Click" />
                                    </div>
                                </div>
                            </div>

                            </div>
                        </div>
                    </div>
                <%-- hasdkjfhakjshdfkljahskldjfhlakjsdhflkjasdkfhalskjdhfkljadsf --%>
                
            </div>
        </div>
    </div>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    
</asp:Content>
