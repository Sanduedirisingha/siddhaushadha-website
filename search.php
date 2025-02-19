<?php
$title = 'Search';
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
            window.location.href="search.php";</script>';  
        } else {
            echo '<script>alert("Product not added to cart!")</script>';
        }
    }
}        


?>

<link rel="stylesheet" href="./css/shop.css">
<link rel="stylesheet" href="./css/search.css">

    <div class="title-section">
        <div class="title-section-container">
            <h1><?php echo $title ?></h1>
            <br>
            <ul class="breadcrump">
                <li><i class="fa-solid fa-house"></i> Home</li>
                <li>&gt; <?php echo $title ?></li>
            </ul>
        </div>
    </div>
    <div class="main-container" style="display:block;align-items: flex-start;">

    <div class="search-page-bar">
                <div class="search">
                    <form action="" method="get" class="search-page-form">
                        <input type="text" name="search" placeholder="Search products...">
                        <button type="submit" name="submit-search" class="search-btn">
                        <i class="fa fa-search"></i>
                    </button>
                    </form>
                </div>
                
    </div>

        
        <div class="product-container">
            <?php
                $select_products = mysqli_query($con, "SELECT * FROM products") or die('query failed');
                $select_category= mysqli_query($con, "SELECT name FROM categories INNER JOIN products ON categories.id = products.category_id") or die('query failed');

                if(isset($_GET['submit-search'])){
                    $search = $_GET['search'];
                    $search_products = mysqli_query($con, "SELECT * FROM products WHERE title LIKE '%$search%' OR producer LIKE '%$search%'") or die('query failed');

                if(mysqli_num_rows($search_products) > 0){
                    while(($fetch_products = mysqli_fetch_assoc($search_products)) AND ($fetch_category = mysqli_fetch_assoc($select_category))){
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

                            
                            <div class="btn-1">
                            <button type="submit" value="Add to cart" name="add_to_cart" class="btn"><img src="./src/cart.svg" alt="" style="width:25px; margin-right:10px;"> Add to cart</button>
                            </div>
                            
                            
                            
                            
                        </div>
                    </form>
                </div>        
                <?php
                    }
                    } else {echo '<p class="empty">No result found!</p>';
                    }  
                    } else {
                        echo '<p class="empty">Seach something</p>';
                    }
                ?>

        </div>
        
        

<?php
    include './templates/newsletter.php';
    include './templates/footer.php';
?>
