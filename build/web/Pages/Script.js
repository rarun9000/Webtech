function validateForm() {
    var x = ["fname","uname", "pass", "cpass", "email"];
    for (i = 0; i < x.length; i++) {
        if (!check(x[i])) {
            document.getElementById(x[i]+"error").innerText="";
            alert("Fill all details");
            return;
        }
    }
    //alert("Your Registration was successful");
    document.form1.submit();
    return;
}

function validateForm1() {
    var x = ["fname","uname", "pass", "cpass", "email"];
    for (i = 0; i < x.length; i++) {
        if (!check(x[i])){
            document.getElementById(x[i]+"error").innerText="";
            return 0;
        }
    }    
    return 1;
}

function check(name) {
    var c = 1;
    if (name == "cpass") {
        c = 0;
        var span = document.getElementById(name + "error");
        var cpass = document.getElementById(name);
        var pass = document.getElementById("pass");
        if (pass.value == "" || cpass.value != pass.value) {
            span.innerText = "confirm password mismatch";
        } else {
            span.innerText = "";
            c = 1;
        }
    } else {
        c = 0;
        var ele = document.getElementById(name);
        var span = document.getElementById(name + "error");
        if (ele.value.trim().length < 1 && (name != "pass" || name != "email")) {
            span.innerText = "Enter valid " + name;
        } else {

            if (name == "uname" && new RegExp("^[0-9]").test(ele.value))
                span.innerText = "Username cannot start with number";
            else if (name == "pass" && ele.value.trim().length < 6)
                span.innerText = "Password cannot be less than 6 characters";
            else if (name == "email" && !(new RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")).test(ele.value.trim()))
                span.innerText = "Invalid Email Id";
            else if (name == "fname" && !(new RegExp("^[a-zA-Z]").test(ele.value)))
                span.innerText = "Invalid Name";
            else {
                c = 1;
                span.innerText = "";
            }
        }
    }
    return c;
}
function clear1() {
    var x = ["fname","uname", "pass", "cpass", "email"];
    document.getElementById("m").checked = true;
    document.getElementById("f").checked = false;
    var i;
    for (i = 0; i < x.length; i++) {
        document.getElementById(x[i]).value = "";
        document.getElementById(x[i] + "error").innerText = "";
    }
}

function display()
{
    if(validateForm1()==1){
        DispWin = window.open('', 'NewWin', 'toolbar=no,status=no,width=300,height=200')
        message = "<ul><li><b>NAME: </b>" + document.form1.fname.value;    
        message += "<li><b>USERNAME: </b>" + document.form1.uname.value;
        message += "<li><b>E-MAIL: </b>" + document.form1.email.value + "</ul>";
        DispWin.document.write(message);
    }
    else{
        alert("Fill all details");
    }
}