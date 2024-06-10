<?php
include_once 'lib/session.php';
include_once 'classes/product.php';
include_once 'classes/cart.php';

$cart = new cart();
$totalQty = $cart->getTotalQtyByUserId();

$product = new product();
$list = mysqli_fetch_all($product->getFeaturedProducts(), MYSQLI_ASSOC);
?>
<?php
    if (isset($_GET['search'])) {
        $search = addslashes($_GET['search']);
        if (empty($search)) {
            echo '<script type="text/javascript">alert("Yêu cầu dữ liệu không được để trống!");</script>';
        } else {
            $list = $product->getProductByName($search);
           
        }
    } 
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Trang chủ</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <style>
        
    </style>
</head>

<body>
    <nav>
        <!-- <label class="logo"><a href="index.php">HB-SHOP</a></label> -->
        <a href="index.php"><img height="80px" src="https://cdn.pnj.io/images/logo/pnj.com.vn.png" alt=""></a>
        <ul>
            <li><a href="index.php" class="active">Trang chủ</a></li>
            <li><a href="productList.php">Sản phẩm</a></li>
            
            <li><a href="order.php" id="order">Đơn hàng</a></li>
            <li>
                <a href="checkout.php">
                    Giỏ hàng
                    <i class="fa fa-shopping-bag"></i>
                    <sup class="sumItem">
                        <?= ($totalQty['total']) ? $totalQty['total'] : "0" ?>
                    </sup>
                </a>
            </li>
            <?php
            if (isset($_SESSION['user']) && $_SESSION['user']) { ?>
                <li><a href="info.php" id="signin">Thông tin cá nhân</a></li>
                <li><a href="logout.php" id="signin">Đăng xuất</a></li>
            <?php } else { ?>
                <li><a href="register.php" id="signup">Đăng ký</a></li>
                <li><a href="login.php" id="signin">Đăng nhập</a></li>
            <?php } ?>
        </ul>
    </nav>

    <div class="slideshow-container" style="margin: 100px 0 0 0;">

        <div class="mySlides fade">
        <img src="https://cdn.pnj.io/images/promo/208/v1-tabsale-t5-24-chung-1972x640CTA.jpg" style="width:100%">
        </div>

        <div class="mySlides fade">
        <img src="https://cdn.pnj.io/images/promo/196/egift-t12-23-1972x640CTA.jpg" style="width:100%">
        </div>

        <div class="mySlides fade">
        <img src="https://cdn.pnj.io/images/promo/199/pnjfast-t1-24-1972x640CTA.jpg" style="width:100%">
        </div>

        </div>

        <div style="text-align:center">
        <span class="dot"></span> 
        <span class="dot"></span> 
        <span class="dot"></span> 
    </div>

    <div class="row2">
        <div class="column2">
            <img src="https://cdn.pnj.io/images/promo/209/fixbanner_Family.jpg" alt="Nature" style="width:100%" >
        </div>
        <div class="column2">
            <img src="https://cdn.pnj.io/images/promo/209/fixbanner-euphoria.jpg" alt="Snow" style="width:100%">
        </div>
        <div class="column2">
            <img src="https://cdn.pnj.io/images/promo/206/Banner_BST_Sakura-494x247_CTA.png" alt="Mountains" style="width:100%" >
        </div>
    </div>

    <div class="featuredProducts">
        <h1>Tất cả sản phẩm</h1>
        <form class="c-search" action="" method="get">
            <input type="text" name="search" placeholder="Nhập tên sản phẩm">
            <button type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
    

    <div class="container" style="grid-template-columns: auto auto auto auto;">
        
        
        <?php
        if ($list) {
        foreach ($list as $key => $value) { ?>
            <div class="card">
                <div class="imgBx">
                    <a href="detail.php?id=<?= $value['id'] ?>"><img src="admin/uploads/<?= $value['image'] ?>" alt="" title="<?= $value['name'] ?>"></a>
                </div>
                <div class="content">
                    <div class="productName">
                        <a href="detail.php?id=<?= $value['id'] ?>" title="<?= $value['name'] ?>">
                            <h3><?= $value['name'] ?></h3>
                        </a>
                    </div>
                    <div>
                        Đã bán: <?= $value['soldCount'] ?>
                    </div>
                    <div class="original-price">
                        <?php
                        if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                            Giá gốc: <del><?= number_format($value['originalPrice'], 0, '', ',') ?>VND</del>
                        <?php } else { ?>
                            <p>...</p>
                        <?php } ?>
                    </div>
                    <div class="price">
                        Giá bán: <?= number_format($value['promotionPrice'], 0, '', ',') ?>VND
                    </div>
                    <div class="action">
                        <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">Thêm vào giỏ</a>
                        <a class="detail" href="detail.php?id=<?= $value['id'] ?>">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        <?php }?>
        <?php } else { ?>
            <h3>Chưa có sản phẩm nào...</h3>
        <?php } ?>
    </div>
    <footer>
        <div class="social">
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
        </div>
        <ul class="list">
            <li>
                <a href="./">Trang Chủ</a>
            </li>
            <li>
                <a href="productList.php">Sản Phẩm</a>
            </li>
        </ul>
        <p class="copyright">copy by PNJ.com 2024</p>
    </footer>
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}    
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>
</body>

</html>