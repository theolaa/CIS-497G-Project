#!/usr/bin/perl -T
use strict;
use warnings;
use 5.008;
 
use Data::Dumper;
use CGI;
my $query = new CGI();
 
my %data;
$data{firstname} = $q->param('firstname');
$data{lastname} = $q->param('lastname');
$data{email} = $q->param('email');
$data{country} = $q->param('country');
$data{psw} = $q->param('psw');
$data{psw-repeat} = $q->param('psw-repeat');
 
print $query->header;
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
print ("<h1> $data{firstname}, Congratulations your account is successfully created! </h1>")
print ("<h2> Lets calculate your BMI! </h2>")
print <<HTML;
<form name="f1" class="modal-content" action="calculateBMI()" method="post">
        <div class="container2">
          <p>Please fill in the details to find your BMI.</p>
          <hr>
          <label for="Height">Height</label>
        <input type="text" id="height" name="height" placeholder="Your height  in cm ..">

        <label for="weight">Weight</label>
        <input type="text" id="weight" name="weight" placeholder="Your weight in kg..">

        <button type="submit" class="signupbtn">Calculate BMI</button>

        <p id="BMI"> </p>
        <p id="BMI-result"> </p>
        </div>
</form>
HTML

print ("<button type="submit" onclick="sendEmail" class="signupbtn"> Email results to: $data{email} </button>");

print <<HTML;
<script language="JavaScript">
var email=$data{email}
function calculateBMI() {
var weight = document.f1.weight.value;
var height = document.f1.height.value;
var result = "";
if(weight > 0 && height > 0){	
var BMI = weight/(height/100*height/100);
document.getElementByID("BMI").innerHTML= BMI;
if(BMI < 18.5){
document.getElementByID("BMI-result").innerHTML= "That you are too thin.";
result="That you are too thin.";
}
if(BMI > 18.5 && BMI < 25){
document.getElementByID("BMI-result").innerHTML= "That you are healthy.";
result="That you are healthy.";
}
if(BMI > 25){
document.getElementByID("BMI-result").innerHTML= "That you have overweight.";
result="That you have overweight.";
}
}
else{
alert("Please Fill in everything correctly");
}
}

function sendEmail() {
	Email.send({
	Host: "smtp.gmail.com",
	Username : "arfhadextra@gmail.com",
	Password : "arfhad@1234",
	To : email,
	From :"arfhadextra@gmail.com",
	Subject : "BMI Results",
	Body : "Hi \n Your BMI result says" + result ,
	}).then(
		message => alert("mail sent successfully")
	);
</script>
</body>
</html>
HTML