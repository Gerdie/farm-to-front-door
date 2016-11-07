"use strict";

//login form event handler
function validateUser(evt) {
    evt.preventDefault();
    
    var loginInfo = $("#login").serialize();

    $.post('/login', loginInfo, function(result) {

        if (result === "Fail") {
            $('#login-fail').html("Incorrect username or password");
        } else {
            $('#LoginModal').modal('hide');
            $('#loginNav').attr('src', '/logout').html('Log Out');
        }
    })

    
}

//login form event binding
$('#login').on('submit', validateUser);