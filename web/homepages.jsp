<!DOCTYPE html>
<html>
          <head>
                    <meta name="viewport" content="width=device-width" />

                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
                    <link href="css/style.css" rel="stylesheet" />
                    <link href="css/slick.css" rel="stylesheet" />
                    <link href="css/slick-theme.css" rel="stylesheet" />
                    <link href="css/formOrder.css" rel="stylesheet" />
                    <link href="css/v4.index.css" rel="stylesheet" />
                    <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css">
                    <link href="css/jquery.modal.min.css" rel="stylesheet" />
                    <link href="css/jquery.modal.custom.css" rel="stylesheet" /> 
                    <link href="css/jquery.toast.min.css" rel="stylesheet" />
                    <link href="css/chatbox.css" rel="stylesheet" />
                    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

                    <title>Five musketeers</title>
                    <script>
                              window.insider_object = {};
                    </script>
          </head>

          <body>
                    <header>
                              <section class="w-container">
                                        <div class="logo-search-user">
                                                  <div class="logo">
                                                            <a href="/">
                                                                      <img src="images/home/Newlogo.png" alt="" />
                                                            </a>
                                                  </div>

                                                  <div class="search">
                                                            <div class="search-box">
                                                                      <form method="get" action="/tim-kiem">
                                                                                <div class="search-bg">
                                                                                          <input id="kwd" name="kwd" type="text" placeholder="What you want to find?" />
                                                                                          <button type="submit">
                                                                                                    <i class="icon-SearchSolidOff"></i>
                                                                                                    <span>Search</span>
                                                                                          </button>
                                                                                </div>
                                                                      </form>
                                                            </div>

                                                            <div class="search-sugget">
                                                                      <strong>Hot search</strong>
                                                                      <a href="#">iPhone 16</a>
                                                            </div>
                                                  </div>

                                                  <div class="quick-for-user">
                                                            <a class="shop-location" title="Login"  href="login.jsp">
                                                                      <i class='bx bx-log-in-circle'></i>
                                                                      <span>Login</span>
                                                            </a>


                                                            <a id="member-login" class="user text-link" title="Access account" href="jsp/account/home.jsp" data-width="380" data-hight="630">
                                                                      <i class='bx bx-user-circle'></i>
                                                                      <span>Account</span>
                                                            </a>

                                                            <a class="cart text-link" href="cart.html">
                                                                      <i class='bx bx-shopping-bag'></i>
                                                                      <label class="cart-counter" id="cart-total">0</label>
                                                            </a>
                                                  </div>
                                        </div>
                              </section>
                    </header>

                    <div class="w-container body-wrapper">
                              <div class="wrapper">

                                        <div class="wrapper">

                                                  <div class="nav-full">

                                                            <nav>
                                                                      <h2>Categories</h2>
                                                                      <ul class="root">
                                                                                <li id="dien-thoai-di-dong">
                                                                                          <a href="/dien-thoai-di-dong" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2025/02/05/mobile.png;w=30;h=30;mode=pad" alt="?i?n tho?i" /></label>
                                                                                                    <span>
                                                                                                              Phone
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>

                                                                                <li id="laptop">
                                                                                          <a href="/laptop" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2025/02/05/laptop.png;w=30;h=30;mode=pad" alt="Laptop" /></label>
                                                                                                    <span>
                                                                                                              Laptop
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>

                                                                                <li id="tablet">
                                                                                          <a href="/tablet" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/06/27/maytinhmang.png;w=30;h=30;mode=pad" alt="Tablet" /></label>
                                                                                                    <span>
                                                                                                              Tablet
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>

                                                                                <li id="dich-vu-sua-chua">
                                                                                          <a href="/dich-vu-sua-chua" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-sua-chua.png;w=30;h=30;mode=pad" alt="S?a ch?a" /></label>
                                                                                                    <span>
                                                                                                              Fix
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                                <li id="dich-vu">
                                                                                          <a href="/dich-vu" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-dich-vu.png;w=30;h=30;mode=pad" alt="D?ch v?" /></label>
                                                                                                    <span>
                                                                                                              Service
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                                <li id="tin-tuc">
                                                                                          <a href="/tin-tuc" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-tin-hot.png;w=30;h=30;mode=pad" alt="Tin hot" /></label>
                                                                                                    <span>
                                                                                                              Hot news
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                                <li id="tin-khuyen-maiuu-dai-hot">
                                                                                          <a href="/tin-khuyen-mai/uu-dai-hot" target="_blank">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-uu-dai.png;w=30;h=30;mode=pad" alt="?u ?&#227;i" /></label>
                                                                                                    <span>
                                                                                                              Sales
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                      </ul>
                                                            </nav>
                                                            <nav>
                                                                      <h2>Old products</h2>
                                                                      <ul class="root">
                                                                                <li id="kho-san-pham-cu">
                                                                                          <a href="/kho-san-pham-cu" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-may-cu.png;w=30;h=30;mode=pad" alt="H&#224;ng c?" /></label>
                                                                                                    <span>
                                                                                                              Old products
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                                <li id="thu-cu-doi-moi">
                                                                                          <a href="/thu-cu-doi-moi" target="_self">

                                                                                                    <label><img src="https://cdn.hoanghamobile.com/Uploads/2024/11/14/logo-thu-cu-doi-moi.png;w=30;h=30;mode=pad" alt="Thu c? ??i m?i" /></label>
                                                                                                    <span>
                                                                                                              Old for new
                                                                                                    </span>
                                                                                          </a>
                                                                                </li>
                                                                      </ul>
                                                            </nav>

                                                  </div>

                                                  <div class="right-content">
                                                            <div class="tet-bg">
                                                                      <section>
                                                                                <div class="container main-slider" style="">
                                                                                          <div class="top-slider">
                                                                                                    <div class="top-slider-content">
                                                                                                              <a target="_blank" href="https://hhmb.net/DattruocS25series" title="??t tr??c Galaxy S25 Series">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/02/03/pre-order-s25-web.png" title="??t tr??c Galaxy S25 Series" />
                                                                                                              </a>
                                                                                                              <a target="_self" href="https://hhmb.net/Redmi-Note-14-Series" title="Redmi Note 14 Series - T?o t&#225;c AI">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/09/promotion-kv-redmi-note-14-series.png" title="Redmi Note 14 Series - T?o t&#225;c AI" />
                                                                                                              </a>
                                                                                                              <a target="_blank" href="https://hoanghamobile.com/dien-thoai-di-dong/samsung/samsung-galaxy-s24-series" title="?u ?&#227;i t?t Samsung Galaxy S24 Ultra">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/09/s24-web.png" title="?u ?&#227;i t?t Samsung Galaxy S24 Ultra" />
                                                                                                              </a>
                                                                                                              <a target="_blank" href="https://hhmb.net/iphone-16-pro-max" title="iPhone 16 Pro Max">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/24/banner-iphone-16-series-1200x375-4.png" title="iPhone 16 Pro Max" />
                                                                                                              </a>
                                                                                                              <a target="_blank" href="https://hhmb.net/ASUS-TUF" title="N?m m?i sung t&#250;c">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/07/tuf-hoang-ha-1200x375.jpg" title="N?m m?i sung t&#250;c" />
                                                                                                              </a>
                                                                                                              <a target="_blank" href="https://hhmb.net/asus-ai" title="ASUS AI | Ti&#234;n phong c&#244;ng ngh?">
                                                                                                                        <img style="width:100%" src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/02/05/asus-ai-1200x375.jpg" title="ASUS AI | Ti&#234;n phong c&#244;ng ngh?" />
                                                                                                              </a>
                                                                                                    </div>
                                                                                                    <div class="top-slider-thumb">
                                                                                                              <div class="slides">
                                                                                                                        <strong>Pre-order Galaxy S25 Series</strong>
                                                                                                                        <small>Recieve good price</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>Redmi Note 14 Series - AI creation</strong>
                                                                                                                        <small>Buy now</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>Samsung Galaxy S24 Ultra</strong>
                                                                                                                        <small>Open HSBC card and receive 2 million immediately</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>REDMAGIC 10 PRO</strong>
                                                                                                                        <small>Buy now</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>iPhone 16 Pro Max</strong>
                                                                                                                        <small>Upgrade price from only: 30.290.000?</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>TUF gamming laptop</strong>
                                                                                                                        <small>Buy now</small>
                                                                                                              </div>
                                                                                                              <div class="slides">
                                                                                                                        <strong>ASUS AI | AI technology</strong>
                                                                                                                        <small>Breakthrough</small>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>
                                                                      </section>

                                                                      <section>
                                                                                <div class="container" style="padding: 0; background:transparent">
                                                                                          <div class="quick-sales">
                                                                                                    <div class="item">
                                                                                                              <a href="https://hoanghamobile.com/dien-thoai/redmi-note-14?utm_source=Webssite&amp;utm_medium=Banner+web&amp;utm_campaign=Redmi-Note-14-Series" target="_blank">
                                                                                                                        <img src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/11/note14.png" title="Redmi Note 14" alt="Redmi Note 14" />
                                                                                                              </a>
                                                                                                    </div>
                                                                                                    <div class="item">
                                                                                                              <a href="https://hhmb.net/S23ultrasanphamhot" target="_blank">
                                                                                                                        <img src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/11/s23-ultra.png" title="Ch??ng tr&#236;nh ?u ?&#227;i t?t 2" alt="Ch??ng tr&#236;nh ?u ?&#227;i t?t 2" />
                                                                                                              </a>
                                                                                                    </div>
                                                                                                    <div class="item">
                                                                                                              <a href="https://hhmb.net/honor-200" target="_blank">
                                                                                                                        <img src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/01/11/honor200.png" title="Ch??ng tr&#236;nh ?u ?&#227;i t?t 3" alt="Ch??ng tr&#236;nh ?u ?&#227;i t?t 3" />
                                                                                                              </a>
                                                                                                    </div>
                                                                                                    <div class="item">
                                                                                                              <a href="https://hhmb.net/MacM1sanphamhot" target="_blank">
                                                                                                                        <img src="https://cdn.hoanghamobile.com/i/home/Uploads/2025/02/04/mac-3.png" title="Ch??ng tr&#236;nh ?u ?&#227;i t?t 4" alt="Ch??ng tr&#236;nh ?u ?&#227;i t?t 4" />
                                                                                                              </a>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>
                                                                      </section>








                                                                      <style>
                                                                                .product-ref.fls {
                                                                                          background: #F4F4F4;
                                                                                          border-radius: 10px;
                                                                                }

                                                                                .timer {
                                                                                          display: flex;
                                                                                          gap: 5px;
                                                                                }

                                                                                .timer strong {
                                                                                          font-size: 13px;
                                                                                          background: #FC521D;
                                                                                          width: 25px;
                                                                                          height: 25px;
                                                                                          padding: 0;
                                                                                          margin: 0px;
                                                                                }

                                                                                .timer span {
                                                                                          margin: 0;
                                                                                }

                                                                                .container-fls {
                                                                                          border-radius: 10px;
                                                                                          padding: 12px;
                                                                                          margin-bottom: 12px;
                                                                                }

                                                                                .container-fls .btnMore {
                                                                                          padding: 6px;
                                                                                          border-radius: 5px;
                                                                                          background-color: white;
                                                                                          color: #009981;
                                                                                          display: flex;
                                                                                          gap: 8px;
                                                                                          line-height: 20px;
                                                                                          cursor: pointer;
                                                                                          font-weight: 600;
                                                                                          display: flex;
                                                                                          align-items: center;
                                                                                          width: 95px;
                                                                                          justify-content: center;
                                                                                }

                                                                                .container-fls .btnMore:hover {
                                                                                          background: #009981;
                                                                                          color: #fff;
                                                                                }

                                                                                .container-fls .flashsale-bg {
                                                                                          height: 90px;
                                                                                          display: flex;
                                                                                          align-items: flex-end;
                                                                                          justify-content: flex-end;
                                                                                          margin-bottom: 12px;
                                                                                }

                                                                                .container-fls .index-flash-sale {
                                                                                          border-radius: 10px;
                                                                                          background: #fff;
                                                                                          padding: 12px;
                                                                                }

                                                                                .container-fls .slick-dotted.slick-slider {
                                                                                          margin-bottom: 18px;
                                                                                }
                                                                      </style>

                                                                      <div class="container list-for-you">
                                                                                <div class="title">For you page</div>
                                                                                <div class="v5-list">
                                                                                          <div class="v5-list-items">
                                                                                                    <div class="v5-list-container">
                                                                                                              <div id="pageHolder" class="v5-grid-items" style="grid-template-columns: repeat(4, minmax(0, 1fr));">

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy S25 Ultra - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25-ultra" data-id="6278" class="img">
                                                                                                                                            <img alt="Samsung Galaxy S25 Ultra - 12GB/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/23/image-removebg-preview.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6278" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy S25 Ultra - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25-ultra" class="text-limit">Samsung Galaxy S25 Ultra - 12GB/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>29,190,000 ?</strong>
                                                                                                                                            <strike>33,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>350,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? l&#234;n ??i S25 series h? tr? l&#234;n ??n 3 tri?u ??ng ">
                                                                                                                                                                Thu c? l&#234;n ??i S25 series h? tr? ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 30%  Buds 3 series, Watch7 series  khi mua k&#232;m v?i S25 series">
                                                                                                                                                                Gi?m 30%  Buds 3 series, Watch7 s...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 12 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy S25 Plus - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25-plus" data-id="6277" class="img">
                                                                                                                                            <img alt="Samsung Galaxy S25 Plus - 12GB/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/23/thumb_638731947924860898.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6277" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy S25 Plus - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25-plus" class="text-limit">Samsung Galaxy S25 Plus - 12GB/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>22,890,000 ?</strong>
                                                                                                                                            <strike>26,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>275,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? l&#234;n ??i S25 series h? tr? l&#234;n ??n 3 tri?u ??ng ">
                                                                                                                                                                Thu c? l&#234;n ??i S25 series h? tr? ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 30%  Buds 3 series, Watch7 series  khi mua k&#232;m v?i S25 series">
                                                                                                                                                                Gi?m 30%  Buds 3 series, Watch7 s...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 12 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy S25 - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25" data-id="6260" class="img">
                                                                                                                                            <img alt="Samsung Galaxy S25 - 12GB/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/23/thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6260" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy S25 - 12GB/256GB" href="/dien-thoai/samsung-galaxy-s25" class="text-limit">Samsung Galaxy S25 - 12GB/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>18,890,000 ?</strong>
                                                                                                                                            <strike>22,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>227,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? l&#234;n ??i S25 series h? tr? l&#234;n ??n 3 tri?u ??ng ">
                                                                                                                                                                Thu c? l&#234;n ??i S25 series h? tr? ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 30%  Buds 3 series, Watch7 series  khi mua k&#232;m v?i S25 series">
                                                                                                                                                                Gi?m 30%  Buds 3 series, Watch7 s...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 12 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="iPhone 16 Pro Max - Ch&#237;nh h&#227;ng VN/A" href="/dien-thoai/iphone-16-pro-max" data-id="5613" class="img">
                                                                                                                                            <img alt="iPhone 16 Pro Max - Ch&#237;nh h&#227;ng VN/A" src="https://cdn.hoanghamobile.com/Uploads/2024/09/10/iphone-16-pro-sa-mac-1.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-5613" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="iPhone 16 Pro Max - Ch&#237;nh h&#227;ng VN/A" href="/dien-thoai/iphone-16-pro-max" class="text-limit">iPhone 16 Pro Max - Ch&#237;nh h&#227;ng VN/A</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>32,450,000 ?</strong>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>389,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Lên ??i</span>
                                                                                                                                                      <label>tr? giá t?i:</label>
                                                                                                                                                      <strong>2,000,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr&#250;ng Vinfast VF3 khi s?m iPhone 16 Series t?i Ho&#224;ng H&#224; Mobile - (&#193;p d?ng t? nay ??n 31/03/2025)">
                                                                                                                                                                Tr&#250;ng Vinfast VF3 khi s?m iPhone ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m th&#234;m 700.000? khi tr? g&#243;p 0% - 0 ph&#237;, v?i th? TD Techcombank.">
                                                                                                                                                                Gi?m th&#234;m 700.000? khi tr? g&#243;p 0%...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 6 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="iPhone 13 (128GB) - Ch&#237;nh h&#227;ng VN/A" href="/dien-thoai-di-dong/apple-iphone-13-128gb-chinh-hang-vn-a" data-id="1297" class="img">
                                                                                                                                            <img alt="iPhone 13 (128GB) - Ch&#237;nh h&#227;ng VN/A" src="https://cdn.hoanghamobile.com/Uploads/2023/07/18/13-removebg-preview.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-1297" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="iPhone 13 (128GB) - Ch&#237;nh h&#227;ng VN/A" href="/dien-thoai-di-dong/apple-iphone-13-128gb-chinh-hang-vn-a" class="text-limit">iPhone 13 (128GB) - Ch&#237;nh h&#227;ng VN/A</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>12,590,000 ?</strong>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>151,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Lên ??i</span>
                                                                                                                                                      <label>tr? giá t?i:</label>
                                                                                                                                                      <strong>1,000,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p 0% v&#224; B?o h&#224;nh ??c quy?n 4 KH&#212;NG: 0 l&#227;i - 0 ph&#237; - 0 tr? tr??c - KH&#212;NG lo m&#225;y h?ng (&#193;p d?ng v?i th? t&#237;n d?ng v&#224; c&#244;ng ty t&#224;i ch&#237;nh)">
                                                                                                                                                                Tr? g&#243;p 0% v&#224; B?o h&#224;nh ??c quy?n ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 7 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="MacBook Air M1 13&quot; (8GB/256GB)" href="/lap-top/macbook-air-13-inch-2020-256gb-chinh-hang-apple-viet-nam-phien-ban-moi" data-id="831" class="img">
                                                                                                                                            <img alt="MacBook Air M1 13&quot; (8GB/256GB)" src="https://cdn.hoanghamobile.com/Uploads/2023/11/07/macbook-air-m1-silver.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-831" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="MacBook Air M1 13&quot; (8GB/256GB)" href="/lap-top/macbook-air-13-inch-2020-256gb-chinh-hang-apple-viet-nam-phien-ban-moi" class="text-limit">MacBook Air M1 13&quot; (8GB/256GB)</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>17,450,000 ?</strong>
                                                                                                                                            <strike>19,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>209,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>500,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n m?m Office t?i Ho&#224;ng H&#224; Mobile d&#224;nh ri&#234;ng cho h?c sinh, sinh vi&#234;n v&#224; gi&#225;o vi&#234;n.">
                                                                                                                                                                ?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m th&#234;m 700.000? khi tr? g&#243;p 0% - 0 ph&#237;, v?i th? TD Techcombank.">
                                                                                                                                                                Gi?m th&#234;m 700.000? khi tr? g&#243;p 0%...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 11 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="MacBook Air M2 13.6&quot; (16GB/256GB)" href="/laptop/macbook-air-m2-13-2022-16gb-256gb-chinh-hang-apple-viet-nam" data-id="2370" class="img">
                                                                                                                                            <img alt="MacBook Air M2 13.6&quot; (16GB/256GB)" src="https://cdn.hoanghamobile.com/Uploads/2022/06/07/mac-air-m2-stalight-1.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-2370" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="MacBook Air M2 13.6&quot; (16GB/256GB)" href="/laptop/macbook-air-m2-13-2022-16gb-256gb-chinh-hang-apple-viet-nam" class="text-limit">MacBook Air M2 13.6&quot; (16GB/256GB)</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>22,790,000 ?</strong>
                                                                                                                                            <strike>39,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>273,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>500,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n m?m Office t?i Ho&#224;ng H&#224; Mobile d&#224;nh ri&#234;ng cho h?c sinh, sinh vi&#234;n v&#224; gi&#225;o vi&#234;n.">
                                                                                                                                                                ?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m th&#234;m 700.000? khi tr? g&#243;p 0% - 0 ph&#237;, v?i th? TD Techcombank.">
                                                                                                                                                                Gi?m th&#234;m 700.000? khi tr? g&#243;p 0%...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 9 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy A16 4GB/128GB" href="/dien-thoai/samsung-galaxy-a16-4gb-128gb" data-id="6265" class="img">
                                                                                                                                            <img alt="Samsung Galaxy A16 4GB/128GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/samsung-a16-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6265" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy A16 4GB/128GB" href="/dien-thoai/samsung-galaxy-a16-4gb-128gb" class="text-limit">Samsung Galaxy A16 4GB/128GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>4,490,000 ?</strong>
                                                                                                                                            <strike>5,090,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>54,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>100,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng c? s?c Samsung 25W ch&#237;nh h&#227;ng tr? gi&#225; 490.000?">
                                                                                                                                                                T?ng c? s?c Samsung 25W ch&#237;nh h&#227;n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i su?t - 0 ph&#237; chuy?n ??i - 0 tr? tr??c (&#193;p d?ng cho Samsung Finance+, c&#244;ng ty t&#224;i ch&#237;nh v&#224; th? t&#237;n d?ng)">
                                                                                                                                                                ??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 3 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 14 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy A06 4GB/128GB" href="/dien-thoai/samsung-galaxy-a06-4gb-128gb" data-id="5598" class="img">
                                                                                                                                            <img alt="Samsung Galaxy A06 4GB/128GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/samsung-galaxy-a06-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-5598" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy A06 4GB/128GB" href="/dien-thoai/samsung-galaxy-a06-4gb-128gb" class="text-limit">Samsung Galaxy A06 4GB/128GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>2,990,000 ?</strong>
                                                                                                                                            <strike>3,490,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>36,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>90,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su?t, tr? tr??c 0 ??ng v?i Samsung Finance+.">
                                                                                                                                                                Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng C? s?c Samsung Type-C 25W kh&#244;ng k&#232;m c&#225;p - Ch&#237;nh h&#227;ng ( SL c&#243; h?n)">
                                                                                                                                                                T?ng C? s?c Samsung Type-C 25W kh...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 11 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Xiaomi 14T 12GB/512GB" href="/dien-thoai/xiaomi-14t" data-id="5702" class="img">
                                                                                                                                            <img alt="Xiaomi 14T 12GB/512GB" src="https://cdn.hoanghamobile.com/Uploads/2024/09/27/xiaomi-14t.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-5702" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Xiaomi 14T 12GB/512GB" href="/dien-thoai/xiaomi-14t" class="text-limit">Xiaomi 14T 12GB/512GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>11,990,000 ?</strong>
                                                                                                                                            <strike>14,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>144,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i su?t - 0 ph&#237; chuy?n ??i - 0 tr? tr??c (&#193;p d?ng cho c&#244;ng ty t&#224;i ch&#237;nh v&#224; th? t&#237;n d?ng)">
                                                                                                                                                                ??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 7 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 13 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="OPPO Reno12 F 5G (8GB/256GB)" href="/dien-thoai/oppo-reno12-f-5g" data-id="4677" class="img">
                                                                                                                                            <img alt="OPPO Reno12 F 5G (8GB/256GB)" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/thum-reno12-f-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-4677" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="OPPO Reno12 F 5G (8GB/256GB)" href="/dien-thoai/oppo-reno12-f-5g" class="text-limit">OPPO Reno12 F 5G (8GB/256GB)</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>8,290,000 ?</strong>
                                                                                                                                            <strike>9,490,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>99,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i su?t - 0 ph&#237; chuy?n ??i - 0 tr? tr??c (&#193;p d?ng cho c&#244;ng ty t&#224;i ch&#237;nh v&#224; th? t&#237;n d?ng)">
                                                                                                                                                                ??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 7 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 18 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy S24 FE 8GB/128GB " href="/dien-thoai/samsung-galaxy-s24-fe-8gb-128gb" data-id="5599" class="img">
                                                                                                                                            <img alt="Samsung Galaxy S24 FE 8GB/128GB " src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/samsung-galaxy-s24-fe-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-5599" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy S24 FE 8GB/128GB " href="/dien-thoai/samsung-galaxy-s24-fe-8gb-128gb" class="text-limit">Samsung Galaxy S24 FE 8GB/128GB </a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>13,990,000 ?</strong>
                                                                                                                                            <strike>16,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>168,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>100,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su?t, tr? tr??c 0 ??ng v?i Samsung Finance+.">
                                                                                                                                                                Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 8 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Xiaomi Redmi Note 14 Pro+ 5G 8GB/256GB" href="/dien-thoai/redmi-note-14-pro-plus-5g" data-id="6312" class="img">
                                                                                                                                            <img alt="Xiaomi Redmi Note 14 Pro+ 5G 8GB/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/04/xiaomi-redmi-note-14-pro-5g-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6312" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Xiaomi Redmi Note 14 Pro+ 5G 8GB/256GB" href="/dien-thoai/redmi-note-14-pro-plus-5g" class="text-limit">Xiaomi Redmi Note 14 Pro+ 5G 8GB/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>10,790,000 ?</strong>
                                                                                                                                            <strike>10,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-km">
                                                                                                                                                      <span>Khuy?n m?i</span>
                                                                                                                                                      <label>gi?m thêm: </label>
                                                                                                                                                      <strong>1,000,000 ?</strong>
                                                                                                                                            </p>
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>117,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng G&#243;i qu&#224; T?t tr? gi&#225; 1.000.000 cho ri&#234;ng kh&#225;ch h&#224;ng th&#226;n thi?t Ho&#224;ng H&#224;">
                                                                                                                                                                T?ng G&#243;i qu&#224; T?t tr? gi&#225; 1.000.00...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng g&#243;i b?o h&#224;nh premium (BH 24 th&#225;ng + BH r?i v? 1 l?n trong 6 th&#225;ng)">
                                                                                                                                                                T?ng g&#243;i b?o h&#224;nh premium (BH 24 ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 2 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="OPPO Reno13 F 8GB/256GB" href="/dien-thoai/oppo-reno13-f" data-id="6269" class="img">
                                                                                                                                            <img alt="OPPO Reno13 F 8GB/256GB" src="https://cdn.hoanghamobile.com/Uploads/2024/12/26/combo-product-reno13f-atus-purple.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6269" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="OPPO Reno13 F 8GB/256GB" href="/dien-thoai/oppo-reno13-f" class="text-limit">OPPO Reno13 F 8GB/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>8,990,000 ?</strong>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-km">
                                                                                                                                                      <span>Khuy?n m?i</span>
                                                                                                                                                      <label>gi?m thêm: </label>
                                                                                                                                                      <strong>300,000 ?</strong>
                                                                                                                                            </p>
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>104,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng g&#243;i b?o h&#224;nh 24 th&#225;ng (BH ti&#234;u chu?n 12 th&#225;ng)">
                                                                                                                                                                T?ng g&#243;i b?o h&#224;nh 24 th&#225;ng (BH ti...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i qua eSwop l&#234;n t?i 1 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i qua eSwop l&#234;n t?i ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 3 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 15 %</span></span>            <a title="Xiaomi Redmi 14C 4GB/128GB" href="/dien-thoai/xiaomi-redmi-14c-4gb-128gb" data-id="5555" class="img">
                                                                                                                                            <img alt="Xiaomi Redmi 14C 4GB/128GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/xiaomi-redmi-14c-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-5555" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Xiaomi Redmi 14C 4GB/128GB" href="/dien-thoai/xiaomi-redmi-14c-4gb-128gb" class="text-limit">Xiaomi Redmi 14C 4GB/128GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>2,990,000 ?</strong>
                                                                                                                                            <strike>3,290,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-km">
                                                                                                                                                      <span>Khuy?n m?i</span>
                                                                                                                                                      <label>gi?m thêm: </label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>33,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>140,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng PMH 200.000?.">
                                                                                                                                                                T?ng PMH 200.000?.
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 50% t?i ?a 700.000? khi m? th? t&#237;n d?ng Vpbank tr&#234;n SenID">
                                                                                                                                                                Gi?m 50% t?i ?a 700.000? khi m? t...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 3 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <a title="OPPO A18 4GB/64GB " href="/dien-thoai-di-dong/oppo-a18-4gb-64gb-chinh-hang" data-id="3915" class="img">
                                                                                                                                            <img alt="OPPO A18 4GB/64GB " src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/oppo-a18-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-3915" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="OPPO A18 4GB/64GB " href="/dien-thoai-di-dong/oppo-a18-4gb-64gb-chinh-hang" class="text-limit">OPPO A18 4GB/64GB </a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>2,890,000 ?</strong>
                                                                                                                                            <strike>2,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>35,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>145,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 50% t?i ?a 700.000? khi m? th? t&#237;n d?ng Vpbank tr&#234;n SenID">
                                                                                                                                                                Gi?m 50% t?i ?a 700.000? khi m? t...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p 0% v?i Home Credit.">
                                                                                                                                                                Tr? g&#243;p 0% v?i Home Credit.
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 2 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 16 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Realme 13+ 5G 8/256GB" href="/dien-thoai/realme-13-5g-8-256gb" data-id="6103" class="img">
                                                                                                                                            <img alt="Realme 13+ 5G 8/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/realme-13-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6103" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Realme 13+ 5G 8/256GB" href="/dien-thoai/realme-13-5g-8-256gb" class="text-limit">Realme 13+ 5G 8/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>7,990,000 ?</strong>
                                                                                                                                            <strike>9,490,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>96,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i ??c quy?n Sinh vi&#234;n: Tr? g&#243;p t?i 10 tri?u ??ng ch? c?n th? sinh vi&#234;n!">
                                                                                                                                                                ?u ?&#227;i ??c quy?n Sinh vi&#234;n: Tr? g...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="H? tr? tr? g&#243;p 0%.">
                                                                                                                                                                H? tr? tr? g&#243;p 0%.
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 7 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 16 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Vivo Y100 8/256GB" href="/dien-thoai/vivo-y100-8-256gb" data-id="6049" class="img">
                                                                                                                                            <img alt="Vivo Y100 8/256GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/vivo-y100-thumb-ads.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6049" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Vivo Y100 8/256GB" href="/dien-thoai/vivo-y100-8-256gb" class="text-limit">Vivo Y100 8/256GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>6,490,000 ?</strong>
                                                                                                                                            <strike>7,690,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>78,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i su?t - 0 ph&#237; chuy?n ??i - 0 tr? tr??c (&#193;p d?ng cho c&#244;ng ty t&#224;i ch&#237;nh v&#224; th? t&#237;n d?ng)">
                                                                                                                                                                ??c bi?t Tr? g&#243;p 3 kh&#244;ng: 0% l&#227;i ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 8 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 21 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy S24 Ultra - 12GB/256GB " href="/dien-thoai/samsung-galaxy-s24-ultra-chinh-hang" data-id="4039" class="img">
                                                                                                                                            <img alt="Samsung Galaxy S24 Ultra - 12GB/256GB " src="https://cdn.hoanghamobile.com/Uploads/2025/01/06/s24-ultra-vang-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-4039" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy S24 Ultra - 12GB/256GB " href="/dien-thoai/samsung-galaxy-s24-ultra-chinh-hang" class="text-limit">Samsung Galaxy S24 Ultra - 12GB/256GB </a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>26,990,000 ?</strong>
                                                                                                                                            <strike>33,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>324,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>100,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m th&#234;m 700.000? khi tr? g&#243;p 0% - 0 ph&#237;, v?i th? TD Techcombank.">
                                                                                                                                                                Gi?m th&#234;m 700.000? khi tr? g&#243;p 0%...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su?t, tr? tr??c 0 ??ng v?i Samsung Finance+.">
                                                                                                                                                                Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 10 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 30 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Samsung Galaxy Tab S9 FE Wifi 6GB/128GB" href="/may-tinh-bang/samsung-galaxy-tab-s9-fe-wifi-6gb-128gb" data-id="3820" class="img">
                                                                                                                                            <img alt="Samsung Galaxy Tab S9 FE Wifi 6GB/128GB" src="https://cdn.hoanghamobile.com/Uploads/2025/01/09/galaxy-tab-s9-fe-gray-thumb.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-3820" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Samsung Galaxy Tab S9 FE Wifi 6GB/128GB" href="/may-tinh-bang/samsung-galaxy-tab-s9-fe-wifi-6gb-128gb" class="text-limit">Samsung Galaxy Tab S9 FE Wifi 6GB/128GB</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>6,990,000 ?</strong>
                                                                                                                                            <strike>9,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>84,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>100,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su?t, tr? tr??c 0 ??ng v?i Samsung Finance+.">
                                                                                                                                                                Tr? g&#243;p t?i 06 th&#225;ng kh&#244;ng l&#227;i su...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Thu c? ??i m?i l&#234;n ??i ?i?n tho?i Android &amp; M&#225;y t&#237;nh b?ng, ti?t ki?m t?i 20 tri?u ??ng">
                                                                                                                                                                Thu c? ??i m?i l&#234;n ??i ?i?n tho?i...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 8 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 40 %</span></span>            <a title="Lenovo Tab M9 (3GB/32GB) - Ch&#237;nh h&#227;ng" href="/may-tinh-bang/lenovo-tab-m9-3gb-32gb-chinh-hang" data-id="3874" class="img">
                                                                                                                                            <img alt="Lenovo Tab M9 (3GB/32GB) - Ch&#237;nh h&#227;ng" src="https://cdn.hoanghamobile.com/Uploads/2025/01/09/lenovo-tab-m9.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-3874" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Lenovo Tab M9 (3GB/32GB) - Ch&#237;nh h&#227;ng" href="/may-tinh-bang/lenovo-tab-m9-3gb-32gb-chinh-hang" class="text-limit">Lenovo Tab M9 (3GB/32GB) - Ch&#237;nh h&#227;ng</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>2,390,000 ?</strong>
                                                                                                                                            <strike>3,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>29,000 ?</strong>
                                                                                                                                            </p>


                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Gi?m 50% t?i ?a 700.000? khi m? th? t&#237;n d?ng Vpbank tr&#234;n SenID">
                                                                                                                                                                Gi?m 50% t?i ?a 700.000? khi m? t...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="Mi?n ph&#237; chuy?n ??i tr? g&#243;p ho?c gi?m ??n 500.000? khi m? th? TPBank EVO">
                                                                                                                                                                Mi?n ph&#237; chuy?n ??i tr? g&#243;p ho?c ...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 2 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 25 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="MSI Modern 14 C7M-220VN" href="/laptop/laptop-msi-modern-14-c7m-220vn-chinh-hang" data-id="3876" class="img">
                                                                                                                                            <img alt="MSI Modern 14 C7M-220VN" src="https://cdn.hoanghamobile.com/Uploads/2023/10/24/msi-modern-14-c7m-1.png;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-3876" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="MSI Modern 14 C7M-220VN" href="/laptop/laptop-msi-modern-14-c7m-220vn-chinh-hang" class="text-limit">MSI Modern 14 C7M-220VN</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>8,990,000 ?</strong>
                                                                                                                                            <strike>11,990,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>108,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>300,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n m?m Office t?i Ho&#224;ng H&#224; Mobile d&#224;nh ri&#234;ng cho h?c sinh, sinh vi&#234;n v&#224; gi&#225;o vi&#234;n.">
                                                                                                                                                                ?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i ??c quy?n Sinh vi&#234;n: Tr? g&#243;p t?i 10 tri?u ??ng ch? c?n th? sinh vi&#234;n!">
                                                                                                                                                                ?u ?&#227;i ??c quy?n Sinh vi&#234;n: Tr? g...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 10 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 25 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Asus ExpertBook B1 B1402CVA-NK1280" href="/laptop/asus-expertbook-b1-b1402cva-nk1280" data-id="6015" class="img">
                                                                                                                                            <img alt="Asus ExpertBook B1 B1402CVA-NK1280" src="https://cdn.hoanghamobile.com/Uploads/2025/01/03/b1402cva-nk1280-thumb-ads.gif;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6015" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Asus ExpertBook B1 B1402CVA-NK1280" href="/laptop/asus-expertbook-b1-b1402cva-nk1280" class="text-limit">Asus ExpertBook B1 B1402CVA-NK1280</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>14,890,000 ?</strong>
                                                                                                                                            <strike>18,590,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-km">
                                                                                                                                                      <span>Khuy?n m?i</span>
                                                                                                                                                      <label>gi?m thêm: </label>
                                                                                                                                                      <strong>900,000 ?</strong>
                                                                                                                                            </p>
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>168,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>300,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n m?m Office t?i Ho&#224;ng H&#224; Mobile d&#224;nh ri&#234;ng cho h?c sinh, sinh vi&#234;n v&#224; gi&#225;o vi&#234;n.">
                                                                                                                                                                ?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng PMH 900.000?">
                                                                                                                                                                T?ng PMH 900.000?
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 10 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>

                                                                                                                        <div class="v5-item" style="grid-row: span 1;  grid-column: span 1; padding: 12px">

                                                                                                                                  <span class="sale-sticker"><span>Gi?m 40 %</span></span><span class="left-sticker">Góp 0%, 0 phí
                                                                                                                                  </span>            <a title="Laptop Acer Aspire 3 A314-23M-R4TX (NX.KEXSV.001)" href="/laptop/laptop-acer-aspire-3-a314-23m-r4tx-nx-kexsv-001" data-id="6188" class="img">
                                                                                                                                            <img alt="Laptop Acer Aspire 3 A314-23M-R4TX (NX.KEXSV.001)" src="https://cdn.hoanghamobile.com/Uploads/2025/01/03/acer-aspire-3-a314-23m-r4tx-thumb-ads.gif;trim.threshold=80;trim.percentpadding=0.5;width=240;height=240;mode=pad;paddingWidth=5;" id="product-img-6188" style="max-width: 180px; max-height: 180px;" />
                                                                                                                                            <div class="bottom-sticker-wrapper">

                                                                                                                                            </div>

                                                                                                                                  </a>
                                                                                                                                  <h3>
                                                                                                                                            <a title="Laptop Acer Aspire 3 A314-23M-R4TX (NX.KEXSV.001)" href="/laptop/laptop-acer-aspire-3-a314-23m-r4tx-nx-kexsv-001" class="text-limit">Laptop Acer Aspire 3 A314-23M-R4TX (NX.KEXSV.001)</a>
                                                                                                                                  </h3>
                                                                                                                                  <div class="price">
                                                                                                                                            <strong>9,990,000 ?</strong>
                                                                                                                                            <strike>16,390,000 ?</strike>
                                                                                                                                  </div>
                                                                                                                                  <div class="price-tags-home">
                                                                                                                                            <p class="price-tags price-tags-km">
                                                                                                                                                      <span>Khuy?n m?i</span>
                                                                                                                                                      <label>gi?m thêm: </label>
                                                                                                                                                      <strong>200,000 ?</strong>
                                                                                                                                            </p>
                                                                                                                                            <p class="price-tags price-tags-member">
                                                                                                                                                      <span>Member</span>
                                                                                                                                                      <label>gi?m ??n:</label>
                                                                                                                                                      <strong>117,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                            <p class="price-tags price-tags-edu">
                                                                                                                                                      <span>Hoàng Hà Edu</span>
                                                                                                                                                      <label>gi?m:</label>
                                                                                                                                                      <strong>300,000 ?</strong>
                                                                                                                                            </p>

                                                                                                                                  </div>
                                                                                                                                  <div class="promotion-list">
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n m?m Office t?i Ho&#224;ng H&#224; Mobile d&#224;nh ri&#234;ng cho h?c sinh, sinh vi&#234;n v&#224; gi&#225;o vi&#234;n.">
                                                                                                                                                                ?u ?&#227;i gi?m l&#234;n t?i 500.000? ph?n...
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div>
                                                                                                                                                      <label>KM</label>
                                                                                                                                                      <span title="T?ng PMH 200.000?.">
                                                                                                                                                                T?ng PMH 200.000?.
                                                                                                                                                      </span>
                                                                                                                                            </div>
                                                                                                                                            <div class="more">
                                                                                                                                                      + 13 ?u ?ãi khác
                                                                                                                                            </div>
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>
                                                                                </div>


                                                                      </div>


                                                                      <section>
                                                                                <div class="container">
                                                                                          <div class="news-home box-home">
                                                                                                    <div class="header">
                                                                                                              <div>Shop customers</div>
                                                                                                    </div>
                                                                                          </div>


                                                                                          <div class="testimonial">
                                                                                                    <div class="testimonial-slider">
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2021/12/24/anh-1.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>Actor Quang Trung</h3>
                                                                                                                                  <h4>Actor/Singer/ Artist</h4>
                                                                                                                                  <div class="note">
                                                                                                                                            Not only are the prices great, but the staff at Hoang Ha are also enthusiastic and extremely cute, so Trung has "scooped up" quite a few products here.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2022/03/01/liz-kim-cuong.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>Liz Kim C??ng</h3>
                                                                                                                                  <h4>Ca s? </h4>
                                                                                                                                  <div class="note">
                                                                                                                                           As a Samfan, Liz cannot miss the opportunity to own the new S22 Ultra product. I trust and choose Hoang Ha Mobile, one of Samsung's authorized dealers, to order and receive the product as soon as possible.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2021/12/24/anh-2-linh.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>NSND Trung Anh</h3>
                                                                                                                                  <h4>Di?n vi&#234;n truy?n h&#236;nh</h4>
                                                                                                                                  <div class="note">
                                                                                                                                            I know Hoang Ha through an advertising cooperation, from then on I know a competitive price brand that is growing and has more and more branches.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2021/11/26/canh-soai-ca.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>Di?n vi&#234;n Do&#227;n Qu?c ?am</h3>
                                                                                                                                  <h4>Di?n vi&#234;n truy?n h&#236;nh </h4>
                                                                                                                                  <div class="note">
                                                                                                                                            I learned about Hoang Ha through a few colleagues in the industry, and from there I spent quite a bit of money investing in new technology.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2021/11/26/mc-mu-tat.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>MC M&#249; T?t </h3>
                                                                                                                                  <h4>BTV/MC VTV, Di?n vi&#234;n</h4>
                                                                                                                                  <div class="note">
                                                                                                                                            The first time I came to buy iPhone 13 Pro Max, I found Hoang Ha staff very friendly, the price was too good. I will definitely come back to buy next time.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                              <div class="item">
                                                                                                                        <div class="img">
                                                                                                                                  <img src="https://cdn.hoanghamobile.com/i/idol/Uploads/2021/11/26/manh-hung.jpg?mode=crop" />
                                                                                                                        </div>

                                                                                                                        <div class="info">
                                                                                                                                  <h3>Di?n vi&#234;n M?nh H?ng </h3>
                                                                                                                                  <h4>Di?n vi&#234;n truy?n h&#236;nh </h4>
                                                                                                                                  <div class="note">
                                                                                                                                            A reliable address for your needs to buy phones and accessories at good prices.
                                                                                                                                  </div>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </div>

                                                                                </div>
                                                                      </section>


                                                            </div>
                                                  </div>
                                        </div>



                              </div>
                    </div>

                    <footer>
                              <div class="w-container">
                                        <div class="bg">
                                                  <div class="col-content">
                                                            <div class="link-content">
                                                                      <h4><a>Support - service</a></h4>
                                                                      <ul>
                                                                                <li><a href="/mua-hang-tra-gop">Policy and instructions for installment purchases</a></li>
                                                                                <li><a href="/huong-dan-dat-hang">Purchase instructions and shipping policy</a></li>
                                                                                <li><a href="/order/check">Order Tracking</a></li>
                                                                                <li><a href="/chinh-sach-bao-hanh">Exchange and warranty policy</a></li>
                                                                                <li><a href="/tin-tuc/dat-hang/dich-vu-bao-hanh-mo-rong-hoang-ha-mobile/">Extended warranty service</a></li>
                                                                      </ul>
                                                            </div>
                                                            <div class="link-content">
                                                                      <h4><a>Contact information</a></h4>
                                                                      <ul>
                                                                                <li><a href="/cham-soc-khach-hang">Customer care</a></li>
                                                                                <li><a href="/trung-tam-bao-hanh">Warranty lookup</a></li>
                                                                      </ul>
                                                            </div>
                                                            <div>
                                                                      <div>
                                                                                <h4>Payment methods</h4>
                                                                                <ul class="list-logo">
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

                                                                      <div>
                                                                                <h4>Shipping method</h4>
                                                                                <ul class="list-logo">
                                                                                          <li>
                                                                                                    <img src="images/home/vnpost.png">
                                                                                          </li>
                                                                                </ul>

                                                                      </div>
                                                            </div>
                                                            <div style="display: flex; gap:20px">
                                                                      <div>
                                                                                <h4>Hotline</h4>
                                                                                <a class="hotline" href="#">1234.5678</a>
                                                                                <div>(From 8h30 - 21h30)</div>
                                                                      </div>
                                                            </div>
                                                  </div>
                                        </div>
                                        <style>
                                                  footer .bg .col-content > div {
                                                            width: 25%;
                                                  }
                                        </style>
                                        <script>
                                                  function changesrc(src) {
                                                            var source = $(src).attr("src");
                                                            if (source.endsWith("active.png"))
                                                                      source = source.replace("_active.png", ".png")
                                                            else
                                                                      source = source.replace(".png", "_active.png")
                                                            $(src).attr("src", source);
                                                  }
                                        </script>


                              </div>
                    </footer>
                    <div id="popup-modal"></div>
                    <div id="sticker-modal"></div>
                    <div class="search-bg"></div>

                    <div class="popup_blur" style="position: fixed; inset: 0px; width: 100%; height: 100%; z-index: 1000; background-color: rgba(0, 0, 0, 0.5); display: none "></div>






                    <script type='application/ld+json'>
                              {"@context":"https:\/\/schema.org","@type":"WebSite","@id":"#website","url":"https:\/\/hoanghamobile.com\/","name":"Ho&#224;ng H&#224; Mobile - H? th?ng b&#225;n l? thi?t b? di ??ng v&#224; c&#244;ng ngh? ch&#237;nh h&#227;ng gi&#225; t?t","potentialAction":{"@type":"SearchAction","target":"https:\/\/hoanghamobile.com\/tim-kiem?kwd={search_term_string}","query-input":"required name=search_term_string"}}
                    </script>

                    <!-- Google Tag Manager -->
                    <script>
                              (function (w, d, s, l, i) {
                                        w[l] = w[l] || [];
                                        w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
                                        var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                                        j.async = true;
                                        j.src = annsnnpoem sontke 120@annnsmeon
                                                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                                        f.parentNode.insertBefore(j, f);
                              })(window, document, 'script', 'dataLayer', 'GTM-5QM3X2');
                    </script>
                    <!-- End Google Tag Manager -->



                    <!-- accesstrade-->
                    <script src="https://static.accesstrade.vn/js/trackingtag/tracking.min.js"></script>
                    <script type="text/javascript">
                              AT.init({"campaign_id": 626, "is_reoccur": 1, "is_lastclick": 1});
                              AT.track();
                    </script>
                    <!-- accesstrade-->

                    <script src="js/jquery-3.5.1.min.js"></script>
                    <script src="js/jquery.cookie.js"></script>
                    <script src="js/slick.min.js"></script>
                    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
                    <script type="text/javascript" src="js/jssor.slider-28.0.0.min.js"></script>
                    <script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
                    <script src="js/jquery.lazy.min.js"></script>
                    <script src="js/jquery.modal.min.js"></script>
                    <script src="js/jquery.lazy.plugins.min.js"></script>
                    <script src="js/jquery.toast.min.js"></script>
                    <script src="js/jquery.fancybox.min.js"></script>
                    <script src="/js/jquery.autocomplete.js"></script>
                    <script src="js/rater.js"></script>
                    <script src="js/nprogress.min.js"></script>
                    <script src="js/jquery.easy-ticker.min.js"></script>
                    <script src="js/loadingoverlay.min.js"></script>
                    <script type="text/javascript" src="js/app.js"></script>
                    <script type="text/javascript" src="js/app.web.js"></script>
                    <script src="js/v4.index.js"></script>
                    <script src="js/chatbox.js"></script>
                    <script type="text/javascript">
                              hh_home();
                    </script>

                    <script>
                              $(document).ready(function () {
                                        imageSlick('.top-slider-content', '.top-slider-thumb');
                                        //Infinity loading product item
                                        $(window).scroll(function () {
                                                  if ($(window).scrollTop() > $(document).height() - $(window).height() - 1500) {
                                                            var position = Math.round(($(document).height() - $(window).height() - 1000) / 1000);
                                                            if (position > currrentPage && !loading) {
                                                                      loadMore(1);
                                                            }
                                                  }
                                        });
                              });
                    </script>

                    <script type="text/javascript">
                              $(document).ready(function () {
                                        setTimeout(showPopup(368), 1000);
                              });
                    </script>

                    <script type="text/javascript">
                              function removeStick() {
                                        sessionStorage.setItem('stickRemove', 1);
                                        $('.footer-stick-right').hide();
                              }

                              $(document).ready(function () {
                                        if (sessionStorage.getItem('stickRemove')) {
                                                  $('.footer-stick-right').hide();
                                        } else {
                                                  $('.footer-stick-right').show();
                                        }
                              });

                    </script>

                    <script>
                              $(document).ready(function () {
                                        $("a[data-toggle='collapse']").click(function () {
                                                  $(this).find(".fa").toggleClass("fa-plus fa-minus");
                                        });
                              });
                    </script>

          </body>
</html>
