<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="jdaPortal.User.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tab-content {
            background-color: #ffffff;
            border-bottom: 1px solid #dddddd;
            padding: 10px;
        }
        .nav-tabs > li.active > a,
        .nav-tabs > li.active > a:hover,
        .nav-tabs > li.active > a:focus {
          color: #014a46;
          cursor: default;
          font-weight: bold;
          background-color: #ffffff;
          border: 1px solid #dddddd;
          border-bottom-color: transparent;
          border-right: 5px solid #b1b1b1;
        }
        input.labelauty:checked + label {
	        background-color: #3c5a78;
	        color: #ffffff;
        }
        input.labelauty:checked:not([disabled]) + label:hover {
	        background-color: #31669b;
        }

        .tab-content {
            min-height: 200px;
        }
        .clear-btn {
            background-color: transparent;
            border: none;
            font-style: italic;
            text-decoration: underline;
        }
        .clear-btn:hover{
            color: #3c5a78;
            font-weight: bold;
        }
        .searchAvatar {
            height: 52px;
            width:52px;
            padding:2px;
            border: 2px inset rgba(23,50,150,0.5);
        }
    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
        <div class="col-md-12 col-sm-12">
            <div id="exTab2" class="container">	
                <ul class="nav nav-tabs">
			        <li class="active" role="presentation">
                        <a  href="#1" data-toggle="tab" class="some-tabs">User Management</a>
			        </li>
			        <li role="presentation"><a href="#2" data-toggle="tab" class="some-tabs">Without clearfix</a>
			        </li>
			        <li role="presentation"><a href="#3" data-toggle="tab" class="some-tabs">Solution</a>
			        </li>
		        </ul>

			    <div class="tab-content clearfix">
			        <div class="tab-pane fade in active" id="1">
                        <div role="main">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Start user search result -->
                            <asp:GridView ID="listPnl"  runat="server" CssClass="table table-hover table-responsive" AutoGenerateColumns="False" 
                                AllowPaging="True" GridLines="None"  HorizontalAlign="Center" PagerStyle-CssClass="pagination"  PageSize="10"
                                DataKeyNames="UsrInfoID,UsrName,UsrPass,UsrIsLog,UsrStatus,UsrLastLog,UsrGroupID,UsrModuleAccess,UsrEmpCode,UsrFName,UsrMName,UsrLName,
                                UsrPosition,UsrSection,UsrAddress,UsrEAdd,DepName,DepCode,UsrGroupName,usrActive" OnRowCommand="listPnl_RowCommand" EmptyDataText="No value or Null" ShowHeaderWhenEmpty="True" HeaderStyle-CssClass="no_hover">
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
                                            <asp:LinkButton runat="server" ID="linkEdit" data-toggle="modal" data-target="#mod_usrDetails" CommandName="Edit" OnClientClick="return false" CssClass="table-option">
                                                <span data-type="tooltip" data-tooltip="Edit" data-pos="right"><i class="material-icons">Select</i></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="50" />
                                    </asp:TemplateField>
                                </Columns> 
                                <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast" />
                                <PagerStyle CssClass="pagination pagination-lg" />
                            </asp:GridView> <!-- end gridview -->
                        </div>
                        <br />
                        
				    <div class="tab-pane fade" id="2">
                        <h3>Notice the gap between the content and tab after applying a background color</h3>
				    </div>
                    <div class="tab-pane" id="3">
                        <h3>add clearfix to tab-content (see the css)</h3>
				    </div>
			    </div>
            </div>
        </div>  
    </div>
    
    <div class="modal fade" id="mod_usrDetails" tabindex="-1" role="dialog" aria-labelledby="mod_usrDetails">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content" style="border-radius: 10px;">
                <div class="modal-header modal-header-mod" >
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="modal-close-btn-mod" >&times;</span></button>
                    <h4 class="modal-title" style="text-align:center;">User Details</h4>    
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <div class="col-md-5 col-sm-5">
                            <img src="~/img/avatar/Male-1.jpg"  id="usrAva" runat="server" class="img-circle searchAvatar pull-right" alt="user image" />
                        </div>
                        <div class="col-md-7 col-sm-7">
                            <div class="pull-left">
                                <h4 style="margin-top:5px;text-align:left;">User fullname Here <br /><small style="font-size:12px;"><i class="fa fa-user"></i> We dont talk anymore</small></h4>
                                
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    <div class="ln_solid"></div>
                        <%--<div class="col-md-12">
                            <input  id="rdMale" type="checkbox" name="rdGender" class="to-labelauty-icon" data-labelauty="User Account Active|User Account Lock" />
                        </div>--%>
                    <div class="container">
                        <ul class="nav nav-tabs">
                            <li role="presentation" class="active">
                                <a  href="#tabUsrPrf" data-toggle="tab" class="some-tabs">Profile</a>
			                </li>
			                <li role="presentation">
                                <a href="#tabUsrAcc" data-toggle="tab" class="some-tabs">Access</a>
			                </li>
                        </ul>
                        <div class="tab-content clearfix" style="position: relative;overflow-y: scroll;">
                            <div class="tab-pane fade in active" id="tabUsrPrf">
                                <input  id="rdMale" type="checkbox" name="rdGender" class="to-labelauty-icon" data-labelauty="User Account Active|User Account Lock" />
                                <button type="button" class="clear-btn" id="updateProfile" style="right:5px;bottom:10px; position: absolute;" >Update Profile</button>
                            </div>
                            <div class="tab-pane fade " id="tabUsrAcc">

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer" >
                    <button type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #3c5a78;">Done</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $('#mod_usrDetails').modal({
                show: false,
                backdrop: 'static',
                keyboard: true
            });

            function reposition() {
                var modal = $(this),
                    dialog = modal.find('.modal-dialog');
                modal.css('display', 'block');

                // Dividing by two centers the modal exactly, but dividing by three 
                // or four works better for larger screens.
                dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height()) / 2));
            }
            // Reposition when a modal is shown
            $('.modal').on('show.bs.modal', reposition);
            // Reposition when the window is resized
            $(window).on('resize', function () {
                $('.modal:visible').each(reposition);
            });
        });
        $('.no_hover').on('mouseover', function () {
            $(this).css('background-color', '#fff');
        });
    </script>
</asp:Content>
