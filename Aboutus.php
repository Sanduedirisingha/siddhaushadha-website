<?php
$title = 'About Us';
session_start();

if(isset($_SESSION['admin_id'])){
  $user_id = $_SESSION['admin_id'];
  include './templates/admin_header.php';
} elseif(isset($_SESSION['user_id'])){
  $user_id = $_SESSION['user_id'];
  include './templates/user_header.php';
}   else
  include './templates/header.php';
?>
     <link rel="stylesheet" href="./css/aboutus.css">


    <div class="topic"><b>About Us</b></div>
<br>
<div class ="description">
    <p>Ayurveda, Sri Lanka's traditional science, is combined with modern technological science. We now make over 100+ herbal items. We have finished the R&D of over 250 herbal items, which are now ready for manufacturing. Our manufacturing facility does not manufacture any poisonous or damaging items.
We have four major brands, and each brand offers a variety of items such as shampoo, hair oil, soaps, lotions, scrubs, and packs. These goods each have their own set of benefits, and they come in a number of sizes. We also provide contract manufacturing as "Private Labelling Job Work" to our customers.
This facility may be customised to our customers' specifications and compositions.
We have our own R&D centre, complete with cutting-edge technology.
Currently we are exporting our products in many countries. Our main regions of exports are European Union, Russian Federation and Asian Countries.</p><br>
 
   
   <h3><b><center>WE ARE PROUD OF OUR HISTORY</center></b></h3>
   <h5>ESTABLISHED IN 1963</h5><br>
   <img class="owner" src="src/about.jpg" alt="About"><br>
    <p>Siddhaushadha company is one of the pioneering companies of ayurvedic products in srilanka.
        The founder is this company was ayurvedic doctor A.D.C wijesundara who was known as 'Podi Ralahami' a prominent ayurvedic scholar and a well renowned physician in yakkala. 
        He was also a nephew of late ayurvedic doctor pandith wickramarachici who commenced the 'Gampaha ' Siddhaurveda Vidyalaya as the center of learning of ayrvedic medicine.</p><br>
        

</div>
<div class="row">

<div class="col">
     <img src="src/mission2.jpg" alt="Mission">
 </div>
 <div class="col">
     <img src="src/vission2.jpg" alt="Vison">
 </div>
</div>
</div>  

<br>
<?php
include './templates/newsletter.php';
include './templates/footer.php';
?>

    

    