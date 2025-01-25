<%-- 
   Document   : homepages
   Created on : Jan 24, 2025, 10:03:02 PM
   Author     : naokh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

          <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="">
                    <meta name="author" content="">
                    <title>Home | E-Shopper</title>
                    <link href="css/bootstrap.min.css" rel="stylesheet">
                    <link href="css/font-awesome.min.css" rel="stylesheet">
                    <link href="css/prettyPhoto.css" rel="stylesheet">
                    <link href="css/price-range.css" rel="stylesheet">
                    <link href="css/animate.css" rel="stylesheet">
                    <link href="css/main.css" rel="stylesheet">
                    <link href="css/responsive.css" rel="stylesheet">
                    <link href="css/slick.css" rel="stylesheet">
                    <link href="css/slick-theme.css" rel="stylesheet">
                    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css" />
                    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css" />
                    <script src="js/html5shiv.js"></script>
                    <script src="js/respond.min.js"></script>
                    <link rel="shortcut icon" href="images/ico/favicon.ico">
                    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
          </head><!--/head-->

          <body>
                    <header id="header"><!--header-->
                              <div class="header_top"><!--header_top-->
                                        <div class="container">
                                                  <div class="row">
                                                            <div class="col-sm-6">
                                                                      <div class="contactinfo">
                                                                                <ul class="nav nav-pills">
                                                                                          <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                                                                          <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                      <div class="social-icons pull-right">
                                                                                <ul class="nav navbar-nav">
                                                                                          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                                                          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                                                          <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                                                          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                                                                          <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                  </div>
                                        </div>
                              </div><!--/header_top-->

                              <div class="header-middle"><!--header-middle-->
                                        <div class="container">
                                                  <div class="row">
                                                            <div class="col-sm-4">
                                                                      <div class="logo pull-left">
                                                                                <a href="homepages.jsp"><img style="width: 100px;" src="images/home/logo.png" alt="" /></a>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                      <div class="search_box">
                                                                                <input type="text" placeholder="What do you want to find?" />
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                      <div class="shop-menu">
                                                                                <ul class="nav navbar-nav">
                                                                                          <li><a href="#"><i class="fa fa-user"></i> Account</a></li>
                                                                                          <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
                                                                                          <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                                                                          <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                                                                          <li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                  </div>
                                        </div>
                              </div><!--/header-middle-->
                              <div class="header-bottom"><!--header-bottom-->
                              </div><!--/header-bottom-->
                    </header><!--/header-->

                    <section id="slider"><!--slider-->
                              <div class="container">
                                        <!-- Slider Section -->
                                        <section class="slider-area slider">
                                                  <div>
                                                            <a href="#"><img src="images/home/banner1.png" alt="banner1"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner2.png" alt="banner2"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner3.png" alt="banner3"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner4.png" alt="banner4"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner5.png" alt="banner5"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner6.png" alt="banner6"></a>
                                                  </div>
                                                  <div>
                                                            <a href="#"><img src="images/home/banner7.jpg" alt="banner7"></a>
                                                  </div>
                                        </section>

                                        <div id="slider-buttons" class="slider-buttons">
                                                  <button data-slide="0"></button>
                                                  <button data-slide="1"></button>
                                                  <button data-slide="2"></button>
                                                  <button data-slide="3"></button>
                                                  <button data-slide="4"></button>
                                                  <button data-slide="5"></button>
                                                  <button data-slide="6"></button>
                                        </div>

                                        <div class="slider-arrows">
                                                  <div class="arrow-left">&lt;</div>
                                                  <div class="arrow-right">&gt;</div>
                                        </div>

                                        <!-- Static Images Section -->
                                        <div class="row static-images">
                                                  <div class="col-sm-3">
                                                            <a href="#"><img src="images/home/item1.png" class="img-responsive" alt="Item 1" /></a>
                                                  </div>
                                                  <div class="col-sm-3">
                                                            <a href="#"><img src="images/home/item2.png" class="img-responsive" alt="Item 2" /></a>
                                                  </div>
                                                  <div class="col-sm-3">
                                                            <a href="#"><img src="images/home/item3.png" class="img-responsive" alt="Item 3" /></a>
                                                  </div>
                                                  <div class="col-sm-3">
                                                            <a href="#"><img src="images/home/item4.jpg" class="img-responsive" alt="Item 4" /></a>
                                                  </div>
                                        </div>
                              </div>
                    </section><!--/slider-->

                    <section>
                              <div class="container">
                                        <div class="row">
                                                  <div class="col-sm-3">
                                                            <div class="left-sidebar">
                                                                      <h2>Category</h2>
                                                                      <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                                                                <div class="panel panel-default">
                                                                                </div>

                                                                                <div class="panel panel-default">
                                                                                          <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                              <a data-toggle="collapse" data-parent="#accordian" href="#Phone">
                                                                                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                        Phone
                                                                                                              </a>
                                                                                                    </h4>
                                                                                          </div>
                                                                                          <div id="Phone" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                              <ul>
                                                                                                                        <li><a href="#">Apple</a></li>
                                                                                                                        <li><a href="#">Sam Sung</a></li>
                                                                                                                        <li><a href="#">Xiaomi</a></li>
                                                                                                                        <li><a href="#">OPPO</a></li>
                                                                                                                        <li><a href="#">Realme</a></li>
                                                                                                                        <li><a href="#">Vivo</a></li>
                                                                                                                        <li><a href="#">Asus</a></li>
                                                                                                                        <li><a href="#">Msi</a></li>
                                                                                                                        <li><a href="#">Lenovo</a></li>
                                                                                                                        <li><a href="#">Acer</a></li>
                                                                                                              </ul>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="panel panel-default">
                                                                                          <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                              <a data-toggle="collapse" data-parent="#accordian" href="#Laptop">
                                                                                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                        Laptop
                                                                                                              </a>
                                                                                                    </h4>
                                                                                          </div>

                                                                                          <div id="Laptop" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                              <ul>
                                                                                                                        <li><a href="#">Apple</a></li>
                                                                                                                        <li><a href="#">Asus</a></li>
                                                                                                                        <li><a href="#">Msi</a></li>
                                                                                                                        <li><a href="#">Lenovo</a></li>
                                                                                                                        <li><a href="#">Acer</a></li>
                                                                                                              </ul>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="panel panel-default">
                                                                                          <div class="panel-heading">
                                                                                                    <h4 class="panel-title">
                                                                                                              <a data-toggle="collapse" data-parent="#accordian" href="#Tablet">
                                                                                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                                                                        Tablet
                                                                                                              </a>
                                                                                                    </h4>
                                                                                          </div>
                                                                                          <div id="Tablet" class="panel-collapse collapse">
                                                                                                    <div class="panel-body">
                                                                                                              <ul>
                                                                                                                        <li><a href="#">Apple</a></li>
                                                                                                                        <li><a href="#">Sam Sung</a></li>
                                                                                                                        <li><a href="#">Xiaomi</a></li>
                                                                                                              </ul>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>
                                                                      </div><!--/category-products-->

                                                                      <div class="brands_products"><!--brands_products-->
                                                                                <h2>Brands</h2>
                                                                                <div class="brands-name">
                                                                                          <ul class="nav nav-pills nav-stacked">
                                                                                                    <li><a href="#"> <span class="pull-right">(50)</span>Apple</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(56)</span>Samsung</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(27)</span>Xiaomi</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(32)</span>OPPO</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(5)</span>Realme</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(9)</span>VIVO</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(4)</span>Asus</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(4)</span>MSI</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(4)</span>Lenovo</a></li>
                                                                                                    <li><a href="#"> <span class="pull-right">(4)</span>Acer</a></li>
                                                                                          </ul>
                                                                                </div>
                                                                      </div><!--/brands_products-->

                                                                      <div class="price-range"><!--price-range-->
                                                                                <h2>Price Range</h2>
                                                                                <div class="well text-center">
                                                                                          <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600"
                                                                                                 data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br />
                                                                                          <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                                                                                </div>
                                                                      </div><!--/price-range-->

                                                                      <div class="shipping text-center"><!--shipping-->
                                                                                <img src="images/home/shipping.jpg" alt="" />
                                                                      </div><!--/shipping-->

                                                            </div>
                                                  </div>

                                                  <div class="col-sm-9 padding-right">
                                                            <div class="features_items"><!--features_items-->
                                                                      <h2 class="title text-center">For you products</h2>
                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">

                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product1.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>

                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">
                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product2.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">
                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product3.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">
                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product4.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <img src="images/home/new.png" class="new" alt="" />
                                                                                          </div>
                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">
                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product5.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <img src="images/home/sale.png" class="new" alt="" />
                                                                                          </div>
                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                                      <div class="col-sm-4">
                                                                                <div class="product-image-wrapper">
                                                                                          <div class="single-products">
                                                                                                    <div class="productinfo text-center">
                                                                                                              <img src="images/home/product6.jpg" alt="" />
                                                                                                              <h2>$56</h2>
                                                                                                              <p>Easy Polo Black Edition</p>
                                                                                                              <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                  class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                    </div>
                                                                                                    <div class="product-overlay">
                                                                                                              <div class="overlay-content">
                                                                                                                        <h2>$56</h2>
                                                                                                                        <p>Easy Polo Black Edition</p>
                                                                                                                        <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                            class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="choose">
                                                                                                    <ul class="nav nav-pills nav-justified">
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                                                                              <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                                                                                    </ul>
                                                                                          </div>
                                                                                </div>
                                                                      </div>

                                                            </div><!--features_items-->

                                                            <div class="category-tab"><!--category-tab-->
                                                                      <div class="col-sm-12">
                                                                                <ul class="nav nav-tabs">
                                                                                          <li class="active"><a href="#tshirt" data-toggle="tab">Phone</a></li>
                                                                                          <li><a href="#blazers" data-toggle="tab">Laptop</a></li>
                                                                                          <li><a href="#sunglass" data-toggle="tab">Tablet</a></li>
                                                                                </ul>
                                                                      </div>
                                                                      <div class="tab-content">
                                                                                <div class="tab-pane fade active in" id="tshirt">
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="tab-pane fade" id="blazers">
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="tab-pane fade" id="sunglass">
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="tab-pane fade" id="kids">
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>

                                                                                <div class="tab-pane fade" id="poloshirt">
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery2.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery4.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery3.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="col-sm-3">
                                                                                                    <div class="product-image-wrapper">
                                                                                                              <div class="single-products">
                                                                                                                        <div class="productinfo text-center">
                                                                                                                                  <img src="images/home/gallery1.jpg" alt="" />
                                                                                                                                  <h2>$56</h2>
                                                                                                                                  <p>Easy Polo Black Edition</p>
                                                                                                                                  <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                      class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                        </div>

                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>
                                                                      </div>
                                                            </div><!--/category-tab-->

                                                            <div class="recommended_items"><!--recommended_items-->
                                                                      <h2 class="title text-center">recommended items</h2>

                                                                      <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                                                                <div class="carousel-inner">
                                                                                          <div class="item active">
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend1.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend2.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend3.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                          <div class="item">
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend1.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend2.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                                    <div class="col-sm-4">
                                                                                                              <div class="product-image-wrapper">
                                                                                                                        <div class="single-products">
                                                                                                                                  <div class="productinfo text-center">
                                                                                                                                            <img src="images/home/recommend3.jpg" alt="" />
                                                                                                                                            <h2>$56</h2>
                                                                                                                                            <p>Easy Polo Black Edition</p>
                                                                                                                                            <a href="#" class="btn btn-default add-to-cart"><i
                                                                                                                                                                class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                                                                                  </div>

                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>
                                                                                <a class="left recommended-item-control" href="#recommended-item-carousel"
                                                                                   data-slide="prev">
                                                                                          <i class="fa fa-angle-left"></i>
                                                                                </a>
                                                                                <a class="right recommended-item-control" href="#recommended-item-carousel"
                                                                                   data-slide="next">
                                                                                          <i class="fa fa-angle-right"></i>
                                                                                </a>
                                                                      </div>
                                                            </div><!--/recommended_items-->
                                                  </div>
                                        </div>
                              </div>
                    </section>

                    <footer id="footer"><!--Footer-->
                              <div class="footer-widget">
                                        <div class="container">
                                                  <div class="row">
                                                            <div class="col-sm-2">
                                                                      <div class="single-widget">
                                                                                <h2>Support & Services</h2>
                                                                                <ul class="nav nav-pills nav-stacked">
                                                                                          <li><a href="">Policies and instructions</a></li>
                                                                                          <li><a href="">Buying and shipping</a></li>
                                                                                          <li><a href="">Order tracking</a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                      <div class="single-widget">
                                                                                <h2>Information and policies</h2>
                                                                                <ul class="nav nav-pills nav-stacked">
                                                                                          <li><a href="">1</a></li>
                                                                                          <li><a href="">2</a></li>
                                                                                          <li><a href="">3</a></li>
                                                                                          <li><a href="">4</a></li>
                                                                                          <li><a href="">5</a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                      <div class="single-widget">
                                                                                <h2>Services and other information</h2>
                                                                                <ul class="nav nav-pills nav-stacked">
                                                                                          <li>
                                                                                                    <img src="images/home/visa.png" />
                                                                                                    <img src="images/home/mastercard.png" />
                                                                                                    <img src="images/home/jcb.png" />
                                                                                                    <img src="images/home/samsungpay.png" />
                                                                                                    <img src="images/home/vnpay.png" />
                                                                                                    <img src="images/home/zalopay.png" />
                                                                                          </li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                      <div class="single-widget">
                                                                                <h2>Connect with us</h2>
                                                                                <ul class="nav nav-pills nav-stacked">
                                                                                          <li><a href="">Company Information</a></li>
                                                                                          <li><a href="">Careers</a></li>
                                                                                          <li><a href="">Store Location</a></li>
                                                                                          <li><a href="">Affillate Program</a></li>
                                                                                          <li><a href="">Copyright</a></li>
                                                                                </ul>
                                                                      </div>
                                                            </div>
                                                            <div class="col-sm-3 col-sm-offset-1">
                                                                      <div class="single-widget">
                                                                                <h2>SIGN UP TO RECEIVE PROMOTION NEWS</h2>
                                                                                <form action="#" class="searchform">
                                                                                          <label> * voucher will be sent in 24h to your email ( new customers only )</label>
                                                                                          <input type="text" placeholder="Your email address" />
                                                                                          <button type="submit" class="btn btn-default"><i
                                                                                                              class="fa fa-arrow-circle-o-right"></i></button>
                                                                                          <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                                                                </form>
                                                                      </div>
                                                            </div>

                                                  </div>
                                        </div>
                              </div>

                              <div class="footer-bottom">
                                        <div class="container">
                                                  <div class="row">
                                                            <p class="pull-left">Copyright © 2013 E-Shopper. All rights reserved.</p>
                                                            <p class="pull-right">Designed by <span><a target="_blank"
                                                                                                       href="http://www.themeum.com">Themeum</a></span></p>
                                                  </div>
                                        </div>
                              </div>

                    </footer><!--/Footer-->


                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="js/jquery.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/jquery.scrollUp.min.js"></script>
                    <script src="js/price-range.js"></script>
                    <script src="js/jquery.prettyPhoto.js"></script>
                    <script src="js/main.js"></script>
                    <script src="js/slick.js"></script>
                    <script src="js/jquery-3.2.1.js"></script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
                    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
                    <script>
                              $(document).ready(function () {
                                        // Initialize Slick Slider
                                        $(".slider-area").slick({
                                                  dots: false,
                                                  vertical: true,
                                                  centerMode: false,
                                                  autoplay: true,
                                                  speed: 300,
                                                  slidesToShow: 1,
                                                  slidesToScroll: 1
                                        });

                                        // Handle button clicks
                                        $("#slider-buttons button").on("click", function () {
                                                  const slideIndex = $(this).data("slide");

                                                  // Go to the selected slide
                                                  $(".slider-area").slick("slickGoTo", slideIndex);

                                                  // Update active button state
                                                  $("#slider-buttons button").removeClass("active");
                                                  $(this).addClass("active");
                                        });

                                        // Update active button on slide change
                                        $(".slider-area").on("afterChange", function (event, slick, currentSlide) {
                                                  $("#slider-buttons button").removeClass("active");
                                                  $(`#slider-buttons button[data-slide="${currentSlide}"]`).addClass("active");
                                        });

                                        // Set the first button as active initially
                                        $("#slider-buttons button[data-slide='0']").addClass("active");
                              });

                              $(".arrow-right").on("click", function () {
                                        $(".slider-area").slick("slickNext");
                              });

                              // Handle custom left arrow click (previous slide)
                              $(".arrow-left").on("click", function () {
                                        $(".slider-area").slick("slickPrev");
                              });
                    </script>
          </body>

</html>