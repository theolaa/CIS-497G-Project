<?php 
  echo "PHP is WORKING"
?>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
</head>
<body>
 <div class="navbar">
  <img src="..\Images\logo.jpg" class="brand-logo" >
      <ul class="navbar-container">
        <a href="#title" class="left-underline nav-button"><h2>The IT Expert</h2></a>
        <li class="nav-item"><a href="#slide3" class="left-underline nav-button" data-scroll>Contact Us</a></li>
        <li class="nav-item"><a href="#slide2" class="left-underline nav-button" data-scroll>About Us</a></li>
        <li class="nav-item"><a href="#slide1" class="left-underline nav-button" data-scroll>Services</a></li>
        <li class="nav-item"><a href="#title" class="left-underline nav-button" data-scroll>Home</a></li>
      </ul>
    </div>

<div id="title" class="slide">
  <div class="title">
    <h1>Summer Sale!</h1>
    <p>CloudSafe ® Total Protection offers antivirus, identity and privacy protection. With VPN. <br/><br/>
    <strong>Only $49.99 per month</strong>. Get your systems protected today!<br/><br/>
    <a href="#slide1" class="left-underline nav-button" style=" font-style: bold; color:rgb(211, 137, 0);">Check it out!</a></p>
  </div>
 </div>

<div id="slide1" class="slide">
  <div class="title">
    <h1>What we offer?</h1>
    <p>We offer automated security visibility and compliance monitoring for workloads that run in any on-premises, public cloud, or hybrid cloud environment.
      Cloud security risk understanding is also a key feature, with trust ratings to help inform security policies. <br/><br/>
      <a href="#slide3" class="left-underline nav-button" style=" font-style: bold; color:rgb(211, 137, 0);">Sign up today!</a></p>
  </div>
</div>

<div id="slide2" class="slide">
  <div class="title">
    <h1>Who we are?</h1>
    <p>Our team of dedicated ethical hackers and security analysts work together to optimize our security protocols & programs. Our aim is to provide personalized anti-virus Artificial Intelligence and Cloud based solutions as per the need of the customer.</p>
  </div>
  <img src="..\Images\1.jpg" id="img1">
  <img src="..\Images\2.jpg" id="img2"> 
</div>

<div id="slide3" class="slide">
  <div class="title">
    <h1>Connect with us!</h1>
    <h3>Reach out to us to get a quote today!</h3>

<div class="container">
  <form action="#">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label for="country">Country</label>
    <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
    </select>

    <label for="subject">Subject</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form>
</div>
  </div>
</div>

<footer>
<div id="slide4" class="slide header">

  <h2 style="color:black">The IT Expert</h2>
<br/><br/>
  <strong style="color:black">Send your questions to us at <a class="left-underline nav-button" style=" font-style: bold; color:rgb(211, 137, 0);" href="mailto:info@theexpert.com">info@theexpert.com</a>. </strong>
  <br/><br/>
  <strong style="color:black">OR </strong> 
  <br/><br/>
  <strong style="color:black">Call us at 555-555-5555. </strong>
</div>


  <div class="footer-copyright">
    <div class="container" style="text-align: center;">
      © 2011-2021 The IT Expert, All rights reserved.
    </div>
  </div>
</footer>
</body>
</html>