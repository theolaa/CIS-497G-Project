#!/usr/bin/perl -T
use strict;
use warnings;
use 5.008;
 
use Data::Dumper;
use CGI;
my $query = new CGI();
 
my %data;
$data{firstname} = $query->param('firstname');
$data{lastname} = $query->param('lastname');
$data{email} = $query->param('email');
$data{country} = $query->param('country');
$data{psw} = $query->param('psw');
$data{psw_repeat} = $query->param('psw_repeat');
 
# print $query->header;
print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<script src="https://smtpjs.com/v3/smtp.js"></script>
</head>
<body>
<h1> Hi </h1>
HTML
print ("<h1> $data{firstname}, Congratulations your account is successfully created! </h1>");
print ("<h2> Lets calculate your BMI! </h2>");
print <<HTML;

<div name="f1" class="modal-content">
        <div class="container2">
          <p>Please fill in the details to find your BMI.</p>
          <hr>
          <label for="Height">Height</label>
        <input type="text" id="height" name="height" placeholder="Your height  in cm ..">

        <label for="weight">Weight</label>
        <input type="text" id="weight" name="weight" placeholder="Your weight in kg..">

        <button type="submit" class="signupbtn" onclick="calculateBMI()">Calculate BMI</button>

        <p id="BMI"> </p>
        <p id="BMI-result"> </p>
        </div>
</div>
HTML

print <<HTML;
<script language="JavaScript">
var email="$data{email}"
function calculateBMI() {
var weight = document.getElementById("weight").value;
var height = document.getElementById("height").value;
var result = "";
if(weight > 0 && height > 0){	
var BMI = Math.round(weight/(height/100*height/100));
document.getElementById("BMI").innerHTML = BMI;
if(BMI < 18.5){
document.getElementById("BMI-result").innerHTML= "You are too thin.";
result="That you are too thin.";
}
if(BMI > 18.5 && BMI < 25){
document.getElementById("BMI-result").innerHTML= "You are healthy.";
result="That you are healthy.";
}
if(BMI > 25){
document.getElementById("BMI-result").innerHTML= "You are overweight.";
result="You are overweight.";
}
}
else{
alert("Please Fill in everything correctly");
}
document.body.innerHTML += "<button type=\\"button\\" onclick=\\"sendEmail()\\" class=\\"signupbtn\\"> Email results to: $data{email} </button>"
}

function sendEmail() {
	result = document.getElementById("BMI-result").innerText;
	bmi = document.getElementById("BMI").innerText;
	///*
	Email.send({
	Host: "smtp.elasticemail.com",
	Username : "account_validation\@learn.taliaq.com",
	Password : "8CDE0ED2F1E5FA245FBCD6EE5B35CD9D0942",
	To : "$data{email}",
	From :"theolaanstra\@gmail.com",
	Subject : "BMI Results",
	Body : "Hi \\n Your BMI result says that \\"" + result + "\\"\\r\\nYour BMI is " + bmi
	}).then(
		function(message) {
		console.log("Email Status: " + message);
		if (message == "OK") {
			document.body.innerHTML += "<br>Email sent - check your junk folder!";
		} else {
			document.body.innerHTML += "<br>" + message;
		}
	}
	);
	//*/
	}
</script>
</body>
</html>
HTML
