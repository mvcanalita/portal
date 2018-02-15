function showMsg(msg) {

    $('#notifyMe').text(msg);
    $('#notifyMe').stop().fadeIn(400).delay(3000).fadeOut(500);
}

$(document).ready(function () {

    var empCode = $('#EmpCode');
    var inUsername = $('#Username');
    var inPassword = $('#password');
    var inConfirmPass = $('#confirmPass');
    var inEmail = $('#email');
    var inMotto = $('#motto');
    var gMale = $('#genderM');
    var gFemale = $('#genderF');

    if (empCode.is('[disabled=disabled]')) {
        empCode.removeAttr('disabled');
    }

    //jQuery Smart Wizard

    $('#wizard').smartWizard({
        enableFinishButton: false,
        labelFinish: 'Submit',
        noForwardJumping: false,
        keyNavigation: false,
        reverseButtonsOrder: true,
        onLeaveStep: leaveAStepCallback,
        onFinish: onFinishCallback,
        transitionEffect: 'fade'
    });

    

    function leaveAStepCallback(objs, context) {
        return validateSteps(context.fromStep);
    }

    function onFinishCallback(objs, context) {
        if (validateAllSteps()) {
            setTimeout(function () {
                $('#closeModal').trigger('click');
                $('form').submit();
            }, 2000);
            
        }
    }

    function validateSteps(stepnumber) {
        var isStepValid = true;

        if (stepnumber == 1) {

            if (empCode.val().length <= 0) {
                showMsg('Please fill all fields to proceed.');
                return isStepValid = false;
            } else {
                return isStepValid = true;
            }

        } else if (stepnumber == 2) {

            if (inUsername.val().length <= 0 || inUsername.val().length <= 0) {
                showMsg('Please fill all fields to proceed.');
                return isStepValid = false;
            } else if (!(inPassword.val() == inConfirmPass.val())) {
                showMsg('Passwords did not match.');
                return isStepValid = false;
            } else if (inPassword.val().length <= 3) {
                showMsg('Your password is wayyyyy to short.');
                return isStepValid = false;
            } else if (inUsername.attr('data-value') == '1') {
                showMsg('Username already in use.');
                return isStepValid = false;
            } else {
                return isStepValid = true;
            }
            
        } else if (stepnumber == 3) {
            if (inEmail.val().length <= 0 || $('#motto') <= 0) {
                showMsg('Please fill all fields to proceed.');
                return isStepValid = false;
            } else {
                return isStepValid = true;
            }
        } else {
            return true;
        }

    }

    function validateAllSteps() {
        var isStepValid = true;
        // all step validation logic
        if (empCode.val().length <= 0) {
            isStepValid = false;
        } else if (inUsername.val().length <= 0 || inUsername.val().length <= 0) {
            isStepValid = false;
        } else if (!(inPassword.val() == inConfirmPass.val())) {
            isStepValid = false;
        } else if (inPassword.val().length <= 3) {
            isStepValid = false;
        } else if (inEmail.val().length <= 0 || inMotto <= 0) {
            isStepValid = false;
        } else {
            isStepValid = registerUser();
        }
        return isStepValid;
    }

    $('#wizard_verticle').smartWizard({
        transitionEffect: 'slide'
    });

    $('.buttonNext').addClass('btn btn-success');
    $('.buttonPrevious').addClass('btn btn-primary');
    $('.buttonFinish').addClass('btn btn-default');

    //End Smart Wizard

    $('#verify').click(function () {
        var empID = empCode.val();

        $.ajax({
            url: "/Toolkit/webMethod.asmx/getEmpDetails",
            method: 'post',
            contentType: 'application/json',
            data: '{ empCode: ' + empID + '}',
            dataType: 'json',
            success: function (data) {
                if (data.d) {
                    $('.buttonNext').trigger('click');
                } else {
                    showMsg('You dont exist!');
                }
            },
            error: function (error) {
                showMsg('An error occured. Please make sure to fill the input box before verifying.');
            }
        });
    });


    inUsername.focusout(function () {

        $.ajax({
            url: "/Toolkit/webMethod.asmx/isAvailable",
            method: 'post',
            contentType: 'application/json',
            data: "{ Uname: '" + inUsername.val() + "'}",
            dataType: 'json',
            success: function (data) {

                if (data.d.Exist) {
                    showMsg('Username ' + inUsername.val() + ' is already in use.');
                    inUsername.attr('data-value', '1');
                } else {
                    inUsername.attr('data-value', '0');
                }
            },
            error: function (error) {
                showMsg(error);
            }
        });
    });

    //The insert method

    function registerUser(){
        var isSuccess = false;

        var regDetails = {};
        regDetails.regID = 0;
        regDetails.regUsrname = inUsername.val();
        regDetails.regPassword = inPassword.val();
        regDetails.regEmpCode = empCode.val();
        regDetails.regEmail = inEmail.val();
        regDetails.regGender = ((gMale.checked == 'checked') ? true : (gFemale.checked == 'checked') ? false : true);
        regDetails.regMotto = inMotto.val();

        $.ajax({
            url: "/Toolkit/webMethod.asmx/RegisterUser",
            method: 'post',
            contentType: 'application/json',
            data: '{ udtls : '+ JSON.stringify(regDetails) + ' }',
            dataType: 'json',
            success: function(regMsg){
                if (regMsg.d) {
                    showMsg('Successfully Registered');
                    isSuccess = regMsg.d;
                } else {
                    showMsg('Ooops! something went wrong.')
                    isSuccess = regMsg.d;
                }
            },
            error: function (err) {
                showMsg(err);
            }
        });

        return isSuccess;
    }



});