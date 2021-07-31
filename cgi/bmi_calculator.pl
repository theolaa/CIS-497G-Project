#!/usr/bin/perl -w -T
use strict;
use warnings;
use 5.008;
 
use Data::Dumper;
use CGI;
my $query = new CGI();
 
my %data;
$data{firstname} =$query->param('firstname');
$data{firstname}=~s/(<([^>]+)>)/""/ig;
$data{lastname} = $query->param('lastname');
$data{lastname}=~s/(<([^>]+)>)/""/ig;
$data{email} = $query->param('email');
$data{email}=~s/(<([^>]+)>)/""/ig;

# print $query->header;
print "Content-type: text/html\n\n";

if (($data{firstname} eq '') || ($data{email} eq '')) {
	print "Missing User Data<br>You will be redirected after five seconds<script>setTimeout(function () {window.location = '../'}, 5000)</script>";

} else {
	
#$data{country} = $query->param('country');
#$data{psw} = $query->param('psw');
#$data{psw_repeat} = $query->param('psw_repeat');
 
print <<HTML;
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../style.css">
<script src="https://smtpjs.com/v3/smtp.js"></script>
</head>
<body>
<h1> Hi </h1>
HTML
print ("<h1> <span id='name'>$data{firstname}</span>, Congratulations your account is successfully created! </h1>");
print ("<h2> Lets calculate your BMI! </h2>");
print <<HTML;

<div id="div1" class="modal-content">
        <div class="container2">
          <p>Please fill in the details to find your BMI.</p>
          <hr>
          <label for="Height">Height</label>
        <input type="number" id="height" name="height" placeholder="Your height  in cm ..">

        <label for="weight">Weight</label>
        <input type="number" id="weight" name="weight" placeholder="Your weight in kg..">

        <button type="submit" class="signupbtn" onclick="calculateBMI()">Calculate BMI</button>
		<button type="submit" class="signupbtn" onclick="sendEmail()">Email results to: $data{email}</button>
<br/><br/><br/><br/>
        <p id="BMI"></p>
        <p id="BMI-result"></p>
		<p id="emailbtn"></p>
        </div>
</div>
HTML

print <<HTML;

<script language="JavaScript">

var email="$data{email}";

function calculateBMI() {
var weight = document.getElementById("weight").value;
var height = document.getElementById("height").value;
var result = "";
if(weight > 0 && height > 0){	
var BMI = Math.round(weight/(height/100*height/100));
document.getElementById("BMI").innerHTML = "Your BMI is " + BMI;
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
}

//document.write("<button style=\\"left:20px\\" type=\\"button\\" onclick=\\"sendEmail()\\" class=\\"signupbtn\\"> Email results to: $data{email} </button>");


function sendEmail() {
	result = document.getElementById("BMI-result").innerText;
	bmi = document.getElementById("BMI").innerText;
	name = document.getElementById("name").innerText;
	if (result == "" && bmi == "")
	{
		alert("Enter Height & Weight");
	}
	else{
		Email.send({
    		SecureToken : "63a9ea58-9372-4a8d-bb2f-92af80ace97a",
    		To : "$data{email}",
    		From : "theolaanstra\@gmail.com",
    		Subject : "BMI Results",
    		Body : "Hi " + name + ",\\n Your BMI result says that \\"" + result + "\\"\\r\\n" + bmi
		}).then(
			function(message) {
				console.log("Email Status: " + message);
				if (message == "OK") {
					document.getElementById("emailbtn").innerHTML = "Email sent - check your junk folder!";
				} else {
					document.getElementById("emailbtn").innerHTML = "<br/><br/>" + message;
				}
			}
		);
	}
}
</script>
</body>
</html>
HTML

}