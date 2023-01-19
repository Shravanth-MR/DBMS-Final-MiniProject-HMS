
  <?php include 'header.php';
  if(isset($_POST[submit]))
{
  
		$sql ="INSERT INTO queries(name,email,phone,department,message) values('$_POST[name]','$_POST[email]','$_POST[phone]','$_POST[department]','$_POST[message]')";
		if($qsql = mysqli_query($con,$sql))
		{
			echo "<script>alert('Query sent successfully');</script>";
		}
		else
		{
			echo mysqli_error($con);
		}
}
  
  ?>

  
  <!-- Content -->
  <div id="content"> 
    
    <!-- Contact Us -->
    <section class="p-t-b-150"> 
      <!-- CONTACT FORM -->
      <div class="container"> 
        <!-- Tittle -->
        <div class="heading-block">
          <h4>GET IN TOUCH</h4>
          <hr>
          <span>We are here to help you solve with your queries, Ping us and we will respond to you.Thanks for beinlg with us.</span> </div>
        <div class="contact">
          <div class="contact-form"> 
            <!-- FORM  -->
            <form role="form" id="contact_form" class="contact-form" action="" name="frmcontact" method="post" onSubmit="return validateform()">
              <div class="row">
                <div class="col-md-6">
                  <ul class="row">
                    <li class="col-sm-12">
                      <label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Name" 
                        value="<?php echo $rsedit[name]; ?>">
                      </label>
                    </li>
                    <li class="col-sm-12">
                      <label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="Email"
                        value="<?php echo $rsedit[email]; ?>">
                      </label>
                    </li>
                    <li class="col-sm-12">
                      <label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone" maxlength="10"
                        value="<?php echo $rsedit[phone]; ?>">
                      </label>
                    </li>
                  </ul>
                </div>
                <div class="col-md-6">
                  <ul class="row">
                    <li class="col-sm-12">
                      <label>
                        <input type="text" class="form-control" name="department" id="department" placeholder="Department"
                        value="<?php echo $rsedit[department]; ?>">
                      </label>
                    </li>
                    <li class="col-sm-12">
                      <label>
                        <textarea class="form-control" name="message" id="message" rows="5" placeholder="Message" value="<?php echo $rsedit[message]; ?>"></textarea>
                      </label>
                    </li>
                    <li class="col-sm-12 no-margin">
                      <button type="submit" value="Submit" name="submit" class="btn btn-default" id="submit" onClick="proceed();">SEND MESSAGE</button>
                    </li>
                  </ul>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <!-- MAP -->
    <!-- <section class="map-block margin-top-100">
      <div class="map-wrapper" id="map-canvas" data-lat="23.740051" data-lng="90.371239" data-zoom="13" data-style="1"></div>
      <div class="markers-wrapper addresses-block"> <a class="marker" data-rel="map-canvas" data-lat="23.740051" data-lng="90.371239" data-string="Medical Hospital"></a> </div>
    </section>
  </div> -->
  
  <!-- Footer -->

  <?php include 'footer.php';?>

  <script type="application/javascript">
var alphaExp = /^[a-zA-Z]+$/; //Variable to validate only alphabets
var alphaspaceExp = /^[a-zA-Z\s]+$/; //Variable to validate only alphabets and space
var numericExpression = /^[0-9]+$/; //Variable to validate only numbers
var alphanumericExp = /^[0-9a-zA-Z]+$/; //Variable to validate numbers and alphabets
var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/; //Variable to validate Email ID 

function validateform() {
   if (document.frmcontact.name.value == "") {
        alert("Name should not be empty..");
        document.frmcontact.name.focus();
        return false;
    } 
    else if (!document.frmcontact.name.value.match(alphaspaceExp)) {
        alert("Name not valid..");
        document.frmcontact.name.focus();
        return false;
    }
     else if (document.frmcontact.phone.value == "") {
        alert("Mobile number should not be empty..");
        document.frmcontact.phone.focus();
        return false;
    } 
    else if (!document.frmcontact.phone.value.match(numericExpression)) {
        alert("Mobile number not valid..");
        document.frmcontact.phone.focus();
        return false;
    } 
    else if (document.frmcontact.loginid.value == "") {
        alert("Email should not be empty..");
        document.frmcontact.loginid.focus();
        return false;
    } 
    else if (!document.frmpatient.loginid.value.match(emailExp)) {
        alert("Email ID not valid..");
        document.frmpatient.loginid.focus();
        return false;
    } 
     else {
        return true;
    }
}
</script>