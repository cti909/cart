let name = document.getElementById("name");
let username = document.getElementById("username");
let password = document.getElementById("password");
let email = document.getElementById("email");
let phone = document.getElementById("phone");
let address = document.getElementById("address");
let position = document.querySelector('input[name="position"]:checked');

if (name.value != "" && username != "" && password != "" && position.value != "")  {
    payload = JSON.stringify({
        "name": name.value,
        "username": username.value,
        "password": password.value,
        "email": email.value,
        "phone": phone.value,
        "address": address.value,
        "position": position.value,
        "password": password.value,
    })
    $.ajax({
        url : "/accounts/register",
        type: "POST",
        data : payload,
        dataType : "json",
    }).done(function(data){
        console.log(data);
        window.location.href = "/accounts/login"
    });
} else {
    alert("You should enter name, username, password, position");
}