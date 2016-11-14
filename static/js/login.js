"use strict";

//login form event handler -- secure if SSL
function validateUser(evt) {
    evt.preventDefault();
    
    // var loginInfo = $("#login").serialize();

    $.post('/login', $("#login").serialize(), function(result) {

        if (result === "Fail") {
            $('#login-fail').html("Incorrect username or password");
        } else if (result === "CookieFail") {
            $('#login-fail').html("Please enable cookies to log in");
        } else {
            $('#LoginModal').modal('hide');
            $('#loginNav').attr('src', '/logout').html('Log Out');
        }
    })

    
}

//login form event binding
$('#login').on('submit', validateUser);
