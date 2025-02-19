<?php
$title = 'Shop';
include './php/config.php';
session_start();


if(isset($_SESSION['admin_id'])){
        $user_id = $_SESSION['admin_id'];
        include './templates/admin_header.php';
    } elseif(isset($_SESSION['user_id'])){
        $user_id = $_SESSION['user_id'];
        include './templates/user_header.php';
}   else
        include './templates/header.php';


if(isset($_POST['add_to_cart'])){

    if (!isset($user_id)){
        echo '<script>alert("Please login to add products to cart!");
        window.location.href="login.php";</script>';
    }else {

    $product_id = $_POST['product_id'];
    $product_title = $_POST['product_title'];
    $product_price = $_POST['product_price'];
    $product_image = $_POST['product_image'];
    $product_quantity = $_POST['product_quantity'];

    $sql = "SELECT * FROM cart WHERE title = '$product_id' AND user_id = '$user_id'";
    $result = mysqli_query($con, $sql);

    if(mysqli_num_rows($result) > 0){
        echo '<script>alert("Product already added to cart!")</script>';
    } else {
        $sql = "INSERT INTO cart (user_id, title, price, quantity, image) VALUES ('$user_id', '$product_title', '$product_price', '$product_quantity', '$product_image')";
        $result = mysqli_query($con, $sql);

        if($result){
            echo '<script>alert("Product Added to Cart Successfully!"); 
            window.location.href="shop.php";</script>';  
        } else {
            echo '<script>alert("Product not added to cart!")</script>';
        }
    }
}
}   
 
?>    
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="./css/shop.css">

        
            
        <div id="slider">
        <figure><a href="shop.php">
        <img src="./src/banners1.jpeg">
        <img src="./src/banner5.jpg">
        <img src="./src/banners3.jpg">
        <img src="./src/banners4.jpg">
        </a></figure>
        </div>

        <p class="maintitle">Welcome to Siddhaushadha Ayurvedic Company</p>
        <div class="row">
            <div class="col-1">
                    <img src="./src/qickdelivery.png">
                    <p class="banner1"><b>Quick Delivery</b></p>
            
            </div>
            <div class="col-1">
                    <img src="./src/securepayment.png">
                    <p class="banner1"><b>Secure Payment</b></p>
        
            </div>
            <div class="col-1">
                <img src="./src/bestquality.png">
                <p class="banner1"><b>Best Quality</b></p>
    
            </div>
        </div>
        <!--featured categories-->
        <div class="main-container" style="display:block;align-items: flex-start;">
        <h1 style="text-align:center;">Featured Products</h1>
        <div class="product-container" style="margin:30px 0;">
            <?php
                $select_products = mysqli_query($con, "SELECT * FROM products") or die('query failed');
                $select_category= mysqli_query($con, "SELECT name FROM categories INNER JOIN products ON categories.id = products.category_id") or die('query failed');

                if(mysqli_num_rows($select_products) > 0){
                    while(($fetch_products = mysqli_fetch_assoc($select_products)) AND ($fetch_category = mysqli_fetch_assoc($select_category))){
        
            ?>
            <div class="product-card">
                    <form action="" method="post" class="cart-box">
                        <img class="image" src="./src/uploads/<?php echo $fetch_products['image'] ?>" alt="">
                        <div class="info">
                            <h3><?php echo $fetch_products['title'] ?></h3>
                            <p><?php echo $fetch_category['name'] ?></p>
                            <div class="price-qty">
                                <span>$<?php echo $fetch_products['price'] ?></span>
                                <input type="number" name="product_quantity" value="1" min="1" id="product_quantity" class="qty">
                            </div>
                            <input type="hidden" name="product_id" value="<?php echo 
                            $fetch_products['id'] ?>">
                            <input type="hidden" name="product_title" value="<?php echo 
                            $fetch_products['title'] ?>">
                            <input type="hidden" name="product_price" value="<?php echo 
                            $fetch_products['price'] ?>">
                            <input type="hidden" name="product_image" value="<?php echo 
                            $fetch_products['image'] ?>">

                            <?php 

                                echo '<div class="btn-1">
                                <button type="submit" value="Add to cart" name="add_to_cart" class="btn"><img src="./src/cart.svg" alt="" style="width:25px; margin-right:10px;"> Add to cart</button>
                                </div>';
                            
                            ?>
                            
                        </div>
                    </form>
                </div>        
                <?php
                    }
                    } else {
                        echo '<p class="empty">No products added yet!</p>';
                    }
                ?>

        </div>
        <h1 style="text-align:center;">Customer Reviews</h1>
    <br>
    
    <div  id="slideshow">
        <div class="slider">
           
          
            <div class="slide">
                <h2 class="feedbacktopic">"Amazing service."</h2>
                <img class=feedbackss src="src/image1.png";>
                <p class="description">One of the best market palce for products. I really wonder about their services and product collection </p>
            </div>

            <div class="slide">
                <h2 class="feedbacktopic">"Best market palce. Highly Recommended"</h2>
                <img class=feedbackss src="src/image2.png";>
                <p class="description">I have been given this from my friend who is from Sri Lanka. And ever since, whenever I have head ache this works the best. I sleep with the balm on then next morning my head ache is gone.</p>
            </div>
            
            <div class="slide">
                <h2 class="feedbacktopic">"Best collection"</h2>
                <img class=feedbackss src="./src/image3.png";>
                <p class="description">This is nice local shop .I recommend this shop .if anybody wants to buy something you can go without driver or without the guide then you can get good price there.you can go by walking or uber taxi.i brought red oil and sandalwood cream and saffron cream it is very excellent. </p>

            </div>

            <div class="slide">
                <h2 class="feedbacktopic">"Execellent customer service"</h2>
                <img class=feedbackss src="src/image4.png";>
                <p class="description">Friendly and fast communication. They help me solve my problem within few minutes. Really glad about that. </p>
            </div>

        </div>
    </div>
</body>

<?php
    include './templates/newsletter.php';
    include './templates/footer.php';
?>


    