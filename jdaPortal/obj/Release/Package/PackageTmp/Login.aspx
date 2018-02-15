<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="jdaPortal.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>PDF Converted Files</title>

    <link href="Framework/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="Framework/bootstrap/css/bootstrap-wizard.css" rel="stylesheet" />
    <link href="Framework/gc-scrollbar.css" rel="stylesheet" />
    <link href="Framework/labelauty/jquery-labelauty.css" rel="stylesheet" />
    <link href="Libraries/Toast/Toast.css" rel="stylesheet" />
    <style>
        @font-face {
            font-family: 'caviar_dreamsregular';
            src: url('Framework/fonts/CaviarRegular/CaviarDreams-webfont.eot');
            src: url('Framework/fonts/CaviarRegular/CaviarDreams-webfont.eot?#iefix') format('embedded-opentype'),
                 url('Framework/fonts/CaviarRegular/CaviarDreams-webfont.woff') format('woff'),
                 url('Framework/fonts/CaviarRegular/CaviarDreams-webfont.ttf') format('truetype'),
                 url('Framework/fonts/CaviarRegular/CaviarDreams-webfont.svg#caviar_dreamsregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'lobster_regular';
            src: url('Framework/fonts/lobsterRegular/lobster-regular-webfont.woff') format('woff'),
                 url('Framework/fonts/lobsterRegular/lobster-regular.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        .myNotify {
            display: none;
            width: 200px;
            height: 20px;
            height: auto;
            position: absolute;
            left: 50%;
            margin-left: -100px;
            top: 80px;
            background-color: #090909;
            color: #F0F0F0;
            font-family: Calibri;
            font-size: 15px;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            z-index: 99999;
            -webkit-box-shadow: 0px 0px 10px -1px rgba(35,35,35,1);
            -moz-box-shadow: 0px 0px 10px -1px rgba(35,35,35,1);
            box-shadow: 0px 0px 10px -1px rgba(35,35,35,1);
        }
        html,body {
            margin:0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        .header h3,h2,h1 {
            margin:0;
            line-height: 50px;
            
        }

        .content {
            width: 100%;
            background-color: transparent;
            color: white;
            margin-top:8%;
        }

        body {
            background: url('img/cropped.jpg') no-repeat;
            background-attachment: fixed;
            background-size: cover;
            overflow-wrap:break-word;
        }


        .navbar-inner {
            background:transparent;
            box-shadow: none;
        }

        .login-pane {
            background-color: transparent;
            width: 330px;
            margin: 0 auto;
            z-index: 4;
        }
        .login-pane-title {
            color: #fbebeb;
            font-family: lobster_regular,Helvetica;
            font-weight: 100;
            margin: 40px 0 40px 0;
            
        }

        .login-pane-content {
            margin: 20px 5px;
            padding: 0 10px 0 10px;
        }
        .login-pane-content input[type='text'],input[type='password'] {
           opacity: 0.9;
        }

        .line-separator{
            margin:5px;
            background-color: rgba(200,200,200,0.5);
            height:2px;
            border-radius:1px;
        }

        .red-tooltip + .tooltip > .tooltip-inner {background-color: #ff6a00;}

        .login-pane-footer {
            margin: 20px 0;
        }

        a.login-pane-footer-fp:hover {
            text-decoration:none;
            font-style:normal;
            cursor: pointer;
        }
        
        a.nav-link-reg {
            cursor: pointer;
        }

        a.nav-link-reg:hover {
            text-decoration:none;
            font-style:normal;
        }

        input[type='text']:focus,input[type='password']:focus,textarea:focus,.form-control:focus {
            border-color: #f89346;
            box-shadow: 0 0 5px #f89346;
        }

        input[type='button'] {
            border: none;
            outline:none;
        }

        #step-1,#step-2,#step-3,#step-4,#step-5 div {
            color: black;
        }
        .forced-width {
            max-width: 200px;
        }

        .modal-content {
            background: url('img/wizard.jpg') no-repeat;
            background-size:cover;
        }
        .wizard-steps {
            background-color: transparent;
        }
        .wizard-nav-list > li > a {
            background-color: transparent;
        }

        .has-padding {
            margin-left: 5px;
            margin-right: 5px;
            background-color: #ff6a00;
        }
        .form-details-verify {
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }
    </style>

    
</head>
<body>
    <form id="form1" novalidate runat="server" >
    <div class="body-wrap">
        <div>
            <nav class="navbar navbar-inverse navbar-inner" style="border: none;">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="RegisterPage.aspx" style="color:white; font-family: 'caviar_dreamsregular';"><span style="font-weight:bold; color: #ff6a00;text-shadow: 0 1px 3px #000;">Reports</span> Portal</a>
                    </div> <!-- header closing -->
                    <p class="navbar-text navbar-right">No Account yet? Click <a id="showRegWiz" class="nav-link-reg" style="font-style:italic;">here</a>.</p>
                </div>
            </nav>
        </div>
        <div class="content">
            <div class="login-pane">
                <div class="login-pane-title text-center">
                    <h1 style="text-shadow: 2px 2px 5px rgb(0,0,0);">Welcome Stranger</h1>
                </div>
                <div class="login-pane-content">
                    <div class="input-group">
                        <span class="input-group-addon "><span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" runat="server" id="txtlgUser" class="form-control text-center" placeholder="Username" aria-describedby="basic-addon1" />
                        
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon "><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" runat="server" id="txtlgPass" class="form-control text-center" placeholder="Password" aria-describedby="basic-addon1" />
                        
                    </div>
                </div>
                <div class="line-separator"></div>
                <div class="login-pane-footer">
                    <div class="col-md-6 col-sm-6 col-xs-6" style="line-height:32px">
                        <small style="text-shadow: 1px 1px 3px rgb(0,0,0);"><a data-toggle="modal" data-target="#modal_forgot_password" class="login-pane-footer-fp">Forgot your password?</a></small>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <button type="button" runat="server" onserverclick="btnLogin_Click" class="btn btn-warning col-md-12 col-sm-12 col-xs-12" id="btnLogin">Sign In</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">

        </div>
      
    </div> <%--end body wrap--%>
    <div id="notifyMe" class="myNotify"></div>
    

    <%--start of modal--%>
    <div class="modal fade" id="modal_forgot_password" tabindex="-1" role="dialog" aria-labelledby="modal_forgot_password">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h5 class="modal-title" style="text-shadow: 1px 0px 10px rgb(165,115,100);"><span style="font-family: lobster_regular; font-size:1.2em;">Forgetfulness</span> is a form of Freedom.</h5>
                </div>
                <div class="modal-body">
                    <form >
                        <div class="form-group-sm">
                            <label for="forg_username" class="">Username</label>
                            <asp:TextBox ID="forg_username" Placeholder="Username" runat="server" CssClass="form-control"></asp:TextBox> 
                        </div>
                        <div class="form-group-sm ">
                            <label for="securityQuestion">Security Question</label>
                            <asp:DropDownList ID="forg_securityQuestion" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0" Text="Select Security Question" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="What is your favorite novel?"></asp:ListItem>
                                <asp:ListItem Value="2" Text="What is your favorite ice cream flavor?"></asp:ListItem>
                                <asp:ListItem Value="3" Text="What would you do in a world war situation?"></asp:ListItem>
                                <asp:ListItem Value="4" Text="What is your favorite childhood memory?"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Describe the perfect girl/guy?"></asp:ListItem>
                                <asp:ListItem Value="6" Text="What are you talented at?"></asp:ListItem>
                                <asp:ListItem Value="7" Text="Where is the ideal place for a first date?"></asp:ListItem>
                                <asp:ListItem Value="8" Text="How much do you weigh?"></asp:ListItem>
                                <asp:ListItem Value="9" Text="If you could live anywhere in the world, where would it be?"></asp:ListItem>
                                <asp:ListItem Value="10" Text="What is your biggest wish for this year?"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group-sm"> 
                            <label for="for_SecQAns" class="">Username</label>
                            <asp:TextBox ID="for_SecQAns" runat="server" Placeholder="Please provide your answer" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:HiddenField ID="hdnFld" Value="" runat="server" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                    <button id="btnRecover" type="button" class="btn btn-sm btn-primary" >Recover</button>
                </div>
            </div>
        </div>
    </div>
    <%--end of modal--%>
    </form>
    <div>

        <div class="wizard" id="regWizard" data-title="Registration Wizard">
            <div class="wizard-card" data-cardname="Terms">
                <h3>Terms</h3>
                <div style="overflow-y: scroll;max-height:220px;">
                    <div>
                        <ol>
                            <li><strong>Introduction</strong></li>
                        </ol>
                        <p>These Website Standard Terms and Conditions written
                             on this webpage shall manage your use of this website.
                             These Terms will be applied fully and affect to your
                             use of this Website. By using this Website,
                             you agreed to accept all terms and conditions written in here.
                             You must not use this Website if you disagree with any of these
                             Website Standard Terms and Conditions.</p><p>Minors or people
                              below 18 years old are not allowed to use this Website.</p>
                        <ol start="2">
                            <li><strong>Intellectual Property Rights</strong></li>
                        </ol>
                        <p>Other than the content you own, under these Terms, Prince Retail
                             Group and/or its licensors own all the intellectual property
                             rights and materials contained in this Website.</p>
                        <p>You are granted limited license only for purposes of 
                            viewing the material contained on this Website.</p>
                        <ol start="3">
                            <li><strong>Restrictions</strong></li>
                        </ol>
                        <p>You are specifically restricted from all of the following</p>
                        <ul>
                            <li>publishing any Website material in any other media;</li>
                            <li>selling, sublicensing and/or otherwise commercializing any Website material;</li>
                            <li>publicly performing and/or showing any Website material;</li>
                            <li>using this Website in any way that is or may be damaging to this Website;</li>
                            <li>using this Website in any way that impacts user access to this Website;</li>
                            <li>using this Website contrary to applicable laws and regulations,
                                 or in any way may cause harm to the Website, or to any person
                                 or business entity;</li>
                            <li>engaging in any data mining, data harvesting, 
                                data extracting or any other similar activity in relation to 
                                this Website;</li>
                            <li>using this Website to engage in any advertising or marketing.</li>
                        </ul>
                        <p>Certain areas of this Website are restricted from being access by 
                            you and Prince Retail Group may further restrict access by you to 
                            any areas of this Website, at any time, in absolute discretion. 
                            Any user ID and password you may have for this Website are confidential
                             and you must maintain confidentiality as well.</p>
                        <ol start="4">
                            <li><strong>Your Content</strong></li>
                        </ol>
                        <p>In these Website Standard Terms and Conditions, 
                            “Your Content” shall mean any audio, video text, images or other material
                             you choose to display on this Website. By displaying Your Content, you 
                            grant Prince Retail Group a non-exclusive, worldwide irrevocable,
                             sub licensable license to use, reproduce, adapt, publish, translate and 
                            distribute it in any and all media.</p>
                        <p>Your Content must be your own and must not be invading any third-party’s 
                            rights. Prince Retail Group reserves the right to remove any of Your 
                            Content from this Website at any time without notice.</p>
                        <ol start="5">
                            <li><strong>No warranties</strong></li>
                        </ol>
                        <p>This Website is provided “as is,” with all faults, 
                            and Prince Retail Group express no representations or warranties, of any 
                            kind related to this Website or the materials contained on this Website.
                             Also, nothing contained on this Website shall be interpreted as advising
                             you.</p>
                        <ol start="6">
                            <li><strong>Limitation of liability</strong></li>
                        </ol><p>In no event shall Prince Retail Group, nor any of its officers, 
                            directors and employees, shall be held liable for anything arising out 
                            of or in any way connected with your use of this 
                            <a href="../Login.aspx" target="_blank">Website</a> whether such liability 
                            is under contract. &nbsp;Prince Retail Group, including its officers, directors
                             and employees shall not be held liable for any indirect, consequential or special 
                            liability arising out of or in any way related to your use of this Website.</p>
                        <ol start="7">
                            <li><strong>Indemnification</strong></li>
                        </ol><p>You hereby indemnify to the fullest extent Prince Retail Group from and against
                             any and/or all liabilities, costs, demands, causes of action, damages and expenses
                             arising in any way related to your breach of any of the provisions of these Terms.</p>
                        <ol start="8">
                            <li><strong>Severability</strong></li>
                        </ol><p>If any provision of these Terms is found to be invalid under any applicable law,
                             such provisions shall be deleted without affecting the remaining provisions herein.</p>
                        <ol start="9">
                            <li><strong>Variation of Terms</strong></li>
                        </ol><p>Prince Retail Group is permitted to revise these Terms at any time as it sees fit,
                             and by using this Website you are expected to review these Terms on a regular basis.</p>
                        <ol start="10">
                            <li><strong>Assignment</strong></li>
                        </ol>
                        <p>The Prince Retail Group is allowed to assign, transfer, and subcontract its rights and/or
                             obligations under these Terms without any notification. However, you are not allowed to assign,
                             transfer, or subcontract any of your rights and/or obligations under these Terms.</p>
                        <ol start="11">
                            <li><strong>Entire Agreement</strong></li>
                        </ol><p>These Terms constitute the entire agreement between Prince Retail Group and you in
                             relation to your use of this Website, and supersede all prior agreements and understandings.</p>
                        <ol start="12">
                            <li><strong>Governing Law &amp; Jurisdiction</strong></li>
                        </ol>
                        <p>These Terms will be governed by and interpreted in accordance with the laws of the State of 
                            Philippines, and you submit to the non-exclusive jurisdiction of the state and federal 
                            courts located in Philippines for the resolution of any disputes.</p>
                    </div>
                </div>
            </div>

            <div class="wizard-card" data-cardname="User_Credentials">
                <h3>User Credentials</h3>
                <div class="wizard-input-section">
                    
					<div class="form-group">
						<div class="col-sm-5 col-md-7 input-group validated_hris_id">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-tag"></span></span>
							<input type="text" class="form-control wizard-ipunt-fields-clear" id="hris_id" placeholder="HRIS Number" data-validate="validateHRISnum" />
						</div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-5 col-md-7 input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" class="form-control wizard-ipunt-fields-clear" id="usr_name" name="usr_name" placeholder="Username" data-validate="validateUsrname" /> <%--data-validate="validateUsrname"--%>
						</div>
					</div>
                    <div class="form-group">
                        <div class="col-sm-5 col-md-7 input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" class="form-control wizard-ipunt-fields-clear" id="usr_pass" name="usr_pass" placeholder="Password" data-validate="validatePassword" /> <%--data-validate="validatePassword"--%>
						</div>
					</div>
                    <div class="form-group">
                        <div class="col-sm-5 col-md-7 input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-check"></span></span>
							<input type="password" class="form-control wizard-ipunt-fields-clear" id="usr_confirm_pass" name="usr_confirm_pass" placeholder="Confrim Password" data-validate="validateConfirmPassword" /> <%--data-validate="validateConfirmPassword"--%>
						</div>
					</div>
				</div>
            </div> <!--end usr credentials card-->

            <div class="wizard-card" data-cardname="Other_Details">
                <h3>User Details</h3>

                <div class="wizard-input-section">
                    <p>
                        What do your friends call you?
                    </p>

                    <div class="form-group">
                        <div class="col-sm-8">
					        <input type="text" class="form-control wizard-ipunt-fields-clear" id="usr_nname" name="usr_nname" placeholder="Nick Name Here" data-validate="validateNickName" /> <%--data-validate="validateNickName"--%>
				        </div>
			        </div>
                    <p class="form-group">
                        <span data-validate="validateRadio" style="padding-left:15px;">Take a pick.</span> 
                    </p>
                    <div class="form-group">
                        <input  id="rdMale" type="radio" name="rdGender" class="form-control to-labelauty-icon wizard-ipunt-fields-clear" data-labelauty="I am Handsome.|Splendid Choice (M)" />
                        <input id="rdFemale" class="wizard-ipunt-fields-clear form-control  to-labelauty-icon" type="radio" name="rdGender" data-labelauty="I am Beautiful.|Awezomeee (F)"/>
                    </div>
                    <p>
                        Say what you wanna say and let the words fall out
                    </p>
                    <div class="form-group">
                        <div class="col-sm-10 col-md-10">
                            <textarea id="motto" class="form-control wizard-ipunt-fields-clear" style="resize:none; max-height:53px;" data-validate="validateMotto"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="wizard-card" data-cardname="Recovery_Details">
                <h3>Recovery Details</h3>
                <div class="wizard-input-section">
                    <div class="form-group col-md-10">
                        <label for="securityEmail">Recovery Email</label>
                        <input type="text" id="securityEmail" class="form-control wizard-ipunt-fields-clear" data-validate="validateEmail"/>
                    </div>
                    <div class="form-group col-md-10">
                        <label for="securityQuestion">Security Question</label>
                            <select class="form-control wizard-ipunt-fields-clear" id="securityQuestion">
                                <option value="0" selected>Select Security Question</option>
                                <option value="1">What is your favorite novel?</option>
                                <option value="2">What is your favorite ice cream flavor?</option>
                                <option value="3">What would you do in a world war situation?</option>
                                <option value="4">What is your favorite childhood memory?</option>
                                <option value="5">Describe the perfect girl/guy?</option>
                                <option value="6">What are you talented at?</option>
                                <option value="7">Where is the ideal place for a first date?</option>
                                <option value="8">How much do you weigh?</option>
                                <option value="9">If you could live anywhere in the world, where would it be?</option>
                                <option value="10">What is your biggest wish for this year?</option>
                            </select>
                    </div>
                    <div class="form-group col-md-10">
                        <label for="securityAnswer">Answer</label>
                        <input type="text" id="securityAnswer" class="form-control wizard-ipunt-fields-clear" />
                    </div>
                </div>
            </div>

            <div class="wizard-card" data-cardname="Verification">
                <h3>Check Details</h3>
                <span style="font-style:italic;">Are these correct?</span>

                <div class="wizard-input-section">
                    <div style="overflow-y:scroll;max-height:220px;">
                        <p><br />
                            Hi <span id="vrNname" class="form-details-verify"></span>,
                            you have entered <span id="vrEmpID" class="form-details-verify"></span> 
                            as your employee ID and <span id="vrUname" class="form-details-verify"></span> as your username.
                            <br /><br />
                            Also,you choose <span id="vrEmail" class="form-details-verify"></span> as your recovery email while
                            " <span id="vrSecQ" class="form-details-verify"></span> " is your security question. Please do remember that <span id="SecA" class="form-details-verify"></span>
                            is your answer for your security question.
                            <br /><br />
                            You also indicated that your gender is <span id="vrGender" class="form-details-verify"></span> and that <span id="vrMotto" class="form-details-verify"></span> 
                            is your guiding principle.
                            <br /><br />
                            By clicking submit, you accept to our terms and condition and use this site only for the sole purpose of accessing and generating reports.
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- wizard validation an other stuff.. -->

            <div class="wizard-error">
		        <div class="alert alert-error">
				    <strong>There was a problem</strong> with your submission.
				    Please correct the errors and re-submit.
			    </div>
		    </div>
	
		    <div class="wizard-failure">
			    <div class="alert alert-error">
				    <strong>There was a problem</strong> submitting the form.
				    Please try again in a minute.
			    </div>
		    </div>
	
		    <div class="wizard-success">
			    <div class="alert alert-success">
				    <span class="create-server-name"></span>Account Created <strong>Successfully.</strong>
			    </div>
	
			    <a class="btn btn-default create-another-account">Create another Account</a>
			    <span style="padding:0 10px">or</span>
			    <a class="btn btn-success im-done">Done</a>
		    </div>
        </div>

    </div>

    
    <script src="Framework/jquery-2.2.1.min.js"></script>
    <script src="Framework/bootstrap/js/bootstrap.js"></script>
    <script src="Framework/bootstrap/js/bootstrap-wizard.js"></script>
    <script src="Framework/labelauty/jquery-labelauty.js"></script>
    <script src="Libraries/Toast/Toast.js"></script>
    <script>
        var fEmpcode;
        var fUname;
        var fUpass;
        var fNname;
        var fGender;
        var fMotto;
        var fRecEmail;
        var fSecQuestion = {};
        var fSecQAns;
        
        
        function showMsg(msg) {

            $('#notifyMe').text(msg);
            $('#notifyMe').stop(true).fadeIn(400).delay(2000).fadeOut(400);
        }
        // Tooltip
        $(document).ready(function () {

            $('#modal_forgot_password').modal({ keyboard: true, backdrop: 'static',show: false });

            $('#txtlgPass').keypress(function (e) {
                if (e.which == 13) {
                    $('#btnLogin').click();
                }
            });

            $.fn.wizard.logging = true;
            $(':radio').labelauty({ same_width: true });

            var iWizard = $("#regWizard").wizard({
                backdrop: 'static',
                keyboard: true,
                contentHeight: 400,
                contentWidth: 650,
                showCancel: true
            });

            $('#showRegWiz').on('click', function (e) {
                e.preventDefault();
                iWizard.show();
            });

            iWizard.on('submit', function (wizard) {
                setTimeout(function () {
                    registerUser(wizard);
                    wizard.hideButtons();
                    wizard._submitting = false;
                    
                }, 2000);
            });
            
            iWizard.el.find(".wizard-success .create-another-account").click(function () {
                iWizard.reset();
            });
            iWizard.el.find(".wizard-success .im-done").click(function () {
                iWizard.hide();
                setTimeout(function () {
                    iWizard.reset();
                }, 250);

            });

            $('[data-toggle="tooltip"]').tooltip({
                container: 'body'
            });
            //Registers user
            function registerUser(c) {
                var employee = {};
                employee.regUsrname = fUname;
                employee.regPassword = fUpass;
                employee.regEmpCode = fEmpcode;
                employee.regEmail = fRecEmail;
                employee.regGender = fGender;
                employee.regMotto = fMotto;
                employee.regNN = fNname;
                employee.regQuestionID = $('#securityQuestion option:selected').val();
                employee.regQuestionAns = fSecQAns;
                $.ajax({
                    url: '/Toolkit/webMethod.asmx/RegisterUser',
                    method: 'post',
                    contentType: 'application/json;charset-utf-8',
                    data: '{ udtls : ' + JSON.stringify(employee) + '}',
                    success: function(){
                        c.showSubmitCard("success");
                        c.updateProgressBar(0);
                    },
                    error: function (err) {
                        c.showSubmitCard("success");
                    }
                });
            };

            $('#hris_id').focusout(function () {
                $.ajax({
                    url: "/Toolkit/webMethod.asmx/getEmpDetails",
                    method: 'post',
                    contentType: 'application/json',
                    data: '{ empCode: "' + $(this).val() + '"}',
                    dataType: 'json',
                    success: function (data) {
                        if (!data.d.Exist) {
                            iWizard.errorPopover($('#hris_id'), 'No record in HRIS', false);
                        } else {
                            $('.wizard-input-section').find('div#' + $('#hris_id').attr('aria-describedby')).fadeOut(400);
                        }
                    },
                    error: function (error) {
                        showMsg(error);
                    }
                });
            });

            $(':input').focusin(function () {
                remErrorContentOnFocus(this);
            });

            var usrMsg = {};
            usrMsg.Exist = 'Username already taken';
            usrMsg.NotExist = 'Username available';

            $('#usr_name').focusout(function () {
                callAjax(iWizard, '/Toolkit/webMethod.asmx/isAvailable', 'post', 'application/json', $('#usr_name').val(), 'Uname', 'json', false, usrMsg, this);
            });

            iWizard.on('readySubmit', function () {
                setValues(fEmpcode, fUname, fNname, fGender, fMotto, fRecEmail, fSecQuestion.dbText.toString(), fSecQAns);
            });

            iWizard.on('reset', function () {
                clear_form_elements();
                $('.validated_hris_id').stop(true).slideUp(400);
            });

            passwordRecovery('#forg_username');

            $('#btnRecover').on('click', function () {
                sendMsg($('#forg_username'), $('#forg_securityQuestion'), $('#for_SecQAns'));
            });
        });

        // Password recovery starts here

        function passwordRecovery(el) { //checking for the username
            
            $(el).focusout(function () {
                $.ajax({
                    url: '/Toolkit/webMethod.asmx/isAvailable',
                    method: 'post',
                    contentType: 'application/json',
                    data: '{ Uname : "' + $(el).val() + '"}',
                    dataType: 'json',
                    success: function (sRes) {
                        if (sRes.d.Exist) {
                            $(el).css('background-color', 'rgba(111,247,84,0.2)');
                            $('#hdnFld').val('1');
                        } else {
                            $(el).css('background-color', 'rgba(232, 76, 76,0.2)');
                            $('#hdnFld').val('0');
                        }
                    },
                    error: function (err) {
                        showMsg(err);
                    }
                });
            });
        }

        

        function sendMsg(el1,el2,el3) { //this is the part for database and web method calling.
            //variables here
            var username = $(el1).val();
            var securityQ = $(el2).val();
            var securityA = $(el3).val();

            var EmailRecovery = {};

            //validate if the textbox has input
            if (username == '') {
                showMsg('Blank username.')
            } else if (securityQ == 0) {
                showMsg('Select question.')
            } else if (securityA == '') {
                showMsg('Answer is blank.')
            } else if (!$('#hdnFld').val()) {
                showMsg('Username not recognize.')
            } else {

                EmailRecovery.UserName = username;
                EmailRecovery.SecurityQuestionID = securityQ;
                EmailRecovery.SecurityQuestionAns = securityA;

                $.ajax({

                    url: '/Toolkit/webMethod.asmx/recoverEmail',
                    method: 'post',
                    contentType: 'application/json;charset-utf-8',
                    data: '{ erecover : ' + JSON.stringify(EmailRecovery) + ' }',
                    dataType: 'json',
                    success: function (msg) {
                        
                        if (msg.d == 'Message Sent') {
                            $(el1).val('');
                            $(el2).prop("selectedIndex", 0);
                            $(el3).val('');
                            $('#modal_forgot_password').modal('hide');
                            setInterval(showMsg(msg.d), 2000);
                        } else {
                            setInterval(showMsg(msg.d), 2000);
                        }
                       
                    },
                    error: function (err) {
                        showMsg(err)
                    }

                });
            }
 
        }

        

        // Password recovery ends here
        
        function remErrorContentOnFocus(el, fDur) {
            $('.wizard-input-section').find('div#' + $(el).attr('aria-describedby')).fadeOut(fDur);
        }

        function validateUsrname(el) { //validates Username
            var name = el.val();
            var retValue = {};

            if (name == "") {
                retValue.status = false;
                retValue.msg = "Input jda username";
            } else if (name.length > 10) {
                retValue.status = false;
                retValue.msg = "Username max char is 10";
            }
            else {
                fUname = name;
                retValue.status = true;
            }

            return retValue;
        };

        function validateHRISnum(el) { //validates HRIS number
            var name = el.val();
            var retValue = {};

            if (name == "") {
                retValue.status = false;
                retValue.msg = "Please enter HRIS ID";
            } else if (name.length > 6) {
                retValue.status = false;
                retValue.msg = "ID max length is 6";
            } else {
                fEmpcode = name;
                retValue.status = true;
            }

            return retValue;
        };

        function validatePassword(el) { //validates password
            var iPass = el.val();
            var retValue = {};

            if (iPass.length < 3) {
                retValue.status = false;
                retValue.msg = 'Password is too short';
            } else if (iPass == "") {
                retValue.status = false;
                retValue.msg = 'Please enter password';
            } else {
                fUpass = iPass;
                retValue = true;
            }

            return retValue;
        }

        function validateConfirmPassword(el) { //validates confirm password
            var iCPass = el.val();
            var iPass = $('#usr_pass').val();
            var retValue = {};

            if (iCPass != iPass) {
                retValue.status = false;
                retValue.msg = 'Password did not match';
            } else if (iCPass == "") {
                retValue.status = false;
                retValue.msg = 'Confirm password';
            } else {
                retValue = true;
            }

            return retValue;
        }

        function validateNickName(el) { //validates nickname and add value to nickname global variable
            var nn = el.val();
            var rValue = {};

            if (nn == '') {
                rValue.status = false;
                rValue.msg = 'Please enter Nick Name'
            } else {
                fNname = nn;
                rValue.status = true;
            }
            return rValue;
        }

        function validateRadio(el) { //validates gender selection and adds global value to variable
            var rVal = {};
            var gMale = $('#rdMale').prop('checked');
            var gFemale = $('#rdFemale').prop('checked');

            if (!gMale && !gFemale) {
                rVal.status = false;
                rVal.msg = 'Kindly select gender';
            } else {
                fGender = gMale ? true : (gFemale ? false : true);
                rVal.status = true;
            }

            return rVal;
        }

        function validateEmail(el) { //validates email and sets value to global variable
            var eAdd = el.val();
            var rVal = {};

            if (eAdd == '') {
                rVal.status = false;
                rVal.msg = 'Please eneter email address.'
            } else if (!validateEmailFormat(eAdd)) {
                rVal.status = false;
                rVal.msg = 'Invalid email format.'
            } else {
                fSecQuestion.dbVal = $('#securityQuestion option:selected').val();
                fSecQuestion.dbText = $('#securityQuestion option:selected').text();
                fSecQAns = $('#securityAnswer').val();
                fRecEmail = eAdd;
                rVal.status = true;
            }
            return rVal;
        }

        function validateEmailFormat($email) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,6})?$/;
            return emailReg.test($email);
        }

        function validateMotto(el) {
            var vMotto = el.val();
            var retVal = {};

            if (vMotto == '') {
                retVal.status = false;
                retVal.msg = 'Enter motto.'
            } else {
                fMotto = vMotto;
                retVal.status = true;
            }

            return retVal;

        }

        function callAjax(wizard, _url, _method, _contentType, _data, _parameterVariable, _dataType, _isArray, _successMsg, el) {
            var dataVar = _isArray ? "{ " + _parameterVariable + ":'" + JSON.stringify(_data) + "'}" : "{" + _parameterVariable + ":'" + _data + "'}";
            $.ajax({
                url: _url,
                method: _method,
                contentType: _contentType,
                data: dataVar,
                dataType: _dataType,
                success: function (sRes) {
                    if (sRes.d.Exist) {
                        wizard.errorPopover($(el), _successMsg.Exist, false);
                    } else {
                        remErrorContentOnFocus(el, 400);
                    }
                },
                error: function (err) {
                    showMsg(err);
                }
            });
        }

        function setValues(empid, uname, nn, genderSpecific, mottoSpecific, recEmail, secQ, secA) { //sets only the respective spans with values from global variable
            var UsrGender = (genderSpecific ? 'Male' : 'Female');

            $('#vrNname').text(nn);
            $('#vrEmpID').text(empid);
            $('#vrUname').text(uname);
            $('#vrEmail').text(recEmail);
            $('#vrSecQ').text(secQ);
            $('#SecA').text(secA);
            $('#vrGender').text(UsrGender);
            $('#vrMotto').text(mottoSpecific);
        }

        function clear_form_elements() {
            $('input.wizard-input-fields-clear[type=text]').val('');
            $('input.wizard-input-fields-clear[type=password]').val('');
            $('input.wizard-input-fields-clear[type=radio]').removeAttr('checked');
            $('textarea').val('');
        }
        // /Tooltip
    </script>
</body>
</html>
