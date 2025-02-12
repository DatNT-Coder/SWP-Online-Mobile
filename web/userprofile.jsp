<%-- 
    Document   : account
    Created on : Feb 8, 2025, 4:16:55 PM
    Author     : naokh
--%>

<!-- account.jsp -->
<%@page import="model.User"%>
<%@page import="constant.CommonConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
        return;
    }
%>
<!DOCTYPE html>
<html>
          <head>

                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="">
                    <meta name="author" content="">
                    <title>User Profile</title>
                    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
                    <link rel="preload" as="script" href="/js-css/web_v1.3.5.3.js">
                    <link rel="preload" as="style" href="css/web_v1.3.5.3.css">
                    <link href="css/web_v1.3.5.3.css" rel="stylesheet" type="text/css">
                    <style>
                              .product-center .current-product-price label.text-green {
                                        display: none
                              }
                    </style>
                    <script>
                              window.insider_object = {};
                    </script>


                    <link href="css/user.css" rel="stylesheet" />


                    <meta property="og:type" content="website" />
                    <meta property="fb:app_id" content="252305948121462" />

                    <script>
                              window.insider_object.user = {"uuid": "user_naokhung2000", "gender": "F", "birthday": "", "has_transacted": false, "transaction_count": 0, "gdpr_optin": true, "name": "Lotso", "surname": "", "username": "naokhung2000", "email": "naokhung2000@gmail.com", "email_optin": true, "phone_number": "0869333522", "sms_optin": true, "language": "vi-VN", "returning": true, "list_id": null, "phoneIsvalid": true};
                    </script>

                    <script async src="//hoanghamobilevn.api.useinsider.com/ins.js?id=10005327"></script>
          </head>

          <body class="account">


                    <form action="/Account/LogOff" id="logoutForm" method="post">
                              <input type="hidden" name="ReturnUrl" id="ReturnUrl" value="/account/index" />
                              <input name="__RequestVerificationToken" type="hidden" value="O1b1Eu88FnFJKWUmXDNrNUQxh3P7cCamhtz38ytPuZLzwRmxNOE6M0ZS_DhPuRnV4Q6XCFhgt1SpiOpryA3uo4ud7RJjCSDwXzOiKzSem6TRhmACBtCQ-uTtdd1XLkJmbgkeOw2" />
                    </form>

                    <section class="account">
                              <div class="sidebar">
                                        <div class="ctn">
                                                  <div class="header">
                                                            <div class="logo">
                                                                      <a href="/"><img src="/Content/web/img/logo-text.png" alt="Hoàng Hà Mobile" /></a>
                                                            </div>

                                                            <div class="info">
                                                                      <div class="avt" id="myAvatar">
                                                                                <strong>L</strong>
                                                                      </div>

                                                                      <div class="summer">
                                                                                <p><strong>Lotso</strong></p>
                                                                                <p class="change-avatar"><a href="javascript:;" onclick="$('#avtImage').trigger('click'); return false;"><i class="icon-change-avatar"></i> Thay đổi ảnh đại diện</a></p>

                                                                                <p>
                                                                                          Hạng thành viên: <strong>MEMBER</strong>
                                                                                </p>
                                                                                <span class="verified"><i class="icon-VerifySolidOn"></i><span>&nbsp;Đã xác thực</span></span>

                                                                                <input type="file" name="upfile" id="avtImage" accept="image/*" style="display: none;" />
                                                                      </div>
                                                            </div>
                                                  </div>

                                                  <div class="hotline">
                                                            <div>
                                                                      <strong>Bạn cần hỗ trợ?</strong>
                                                                      <a href="tel:19002091"><i class="icon-calling"></i> <strong>1900.2091</strong></a>
                                                            </div>
                                                  </div>
                                        </div>
                              </div>


                              <div class="body-content">
                                        <div class="account-layout">
                                                  <div class="row equaHeight" data-obj=".col .box-bg-white">
                                                            <div class="col">
                                                                      <h3>Thông tin cá nhân</h3>
                                                                      <div class="box-bg-white">
                                                                                <div class="account-info">
                                                                                          <div class="tools">
                                                                                                    <a href="/account/info" title="Thay đổi thông tin cá nhân"><i class="icon-edit-squad"></i></a>
                                                                                          </div>

                                                                                          <p><strong>Full Name:</strong> <i><%= user.getFull_name() %></i></p>
                                                                                          <p><strong>Registration Date:</strong></p>
                                                                                          <p><strong>Gender:</strong><i><%= user.getGender() %></i></p>
                                                                                          <p><strong>Email:</strong> <i><%= user.getEmail() %></i></p>
                                                                                          <p><strong>Address:</strong> </p>
                                                                                          <p><strong>Phone Number:</strong> <i><%= user.getPhone() %></i>  </p>

                                                                                </div>
                                                                      </div>
                                                            </div>

                                                            <div class="col">
                                                                      <h3>Đơn hàng đã đặt</h3>
                                                                      <div class="box-bg-white">
                                                                                <div style="padding:25px;">
                                                                                          <table class="table table-border table-lgpading">
                                                                                                    <tr>
                                                                                                              <th>#</th>
                                                                                                              <th>Mã đơn hàng</th>
                                                                                                              <th>Ngày đặt</th>
                                                                                                              <th>Tổng tiền</th>
                                                                                                              <th>Giảm giá</th>
                                                                                                              <th>Sản phẩm đặt hàng</th>
                                                                                                    </tr>

                                                                                          </table>
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </div>

                                                  <div class="row">
                                                            <div class="col" style="max-width:100%;">
                                                                      <h3>Giỏ Hàng Chưa Thanh Toán</h3>
                                                                      <div class="box-bg-white" style="padding:25px;">

                                                                                <div class="tools">
                                                                                          <a href="/account/wishlist" title="Chỉnh sửa danh sách sản phẩm yêu thích"><i class="icon-edit-squad"></i></a>
                                                                                </div>
                                                                                <div class="review-content comment-content" style="max-width:100%; padding:0 30px;">
                                                                                          <p>Bạn chưa gửi đánh giá nào cả.</p>
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </div>

                                                  <div class="row">
                                                            <div class="col">
                                                                      <h3>Quản lý đánh giá</h3>

                                                                      <div class="box-bg-white" style="padding:25px;">

                                                                                <div class="tools">
                                                                                          <a href="/account/review" title="Xem tất cả các đánh giá bạn đã gửi"><i class="icon-eye"></i></a>
                                                                                </div>

                                                                                <div class="review-content comment-content" style="max-width:100%; padding:0 30px;">
                                                                                          <p>Bạn chưa gửi đánh giá nào cả.</p>
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </div>

                                                  <div class="row">
                                                            <div class="col">
                                                                      <h3>Quản lý bình luận</h3>

                                                                      <div class="box-bg-white" style="padding:25px;">

                                                                                <div class="tools">
                                                                                          <a href="/account/comment" title="Xem tất cả các bình luận bạn đã gửi"><i class="icon-eye"></i></a>
                                                                                </div>

                                                                                <div class="review-content comment-content" style="max-width:100%; padding:0 30px;">
                                                                                          <p>Bạn chưa gửi bình luận nào cả.</p>
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </div>
                                        </div>



                              </div>
                    </section>

                    <script type='application/ld+json'>
                              {"@context":"https:\/\/schema.org","@type":"WebSite","@id":"#website","url":"https:\/\/hoanghamobile.com\/","name":"Ho&#224;ng H&#224; Mobile - Hệ thống b&#225;n lẻ thiết bị di động v&#224; c&#244;ng nghệ ch&#237;nh h&#227;ng gi&#225; tốt","potentialAction":{"@type":"SearchAction","target":"https:\/\/hoanghamobile.com\/tim-kiem?kwd={search_term_string}","query-input":"required name=search_term_string"}}
                    </script>

                    <!-- Google Tag Manager -->
                    <script>
                              (function (w, d, s, l, i) {
                                        w[l] = w[l] || [];
                                        w[l].push({'gtm.start': new Date().getTime(), event: 'gtm.js'});
                                        var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                                        j.async = true;
                                        j.src =
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

                    <script src="/js-css/web_v1.3.5.3.js"></script>


                    <script src="/Content/web/js/app.users.js?c=638746283622777098"></script>
                    <script type="text/javascript">
                              $(document).ready(function () {
                                        var reqPath = '/account' + location.pathname.toLowerCase();
                                        var hasActived = false;
                                        $('nav ul li a').each(function (idx, value) {
                                                  var href = $(this).attr('href').toLowerCase();
                                                  if (href && reqPath.indexOf(href) >= 0) {
                                                            $(this).addClass('actived');
                                                            hasActived = true;
                                                  }
                                        });

                                        if (!hasActived) {
                                                  $('nav ul li:eq(0) a').addClass('actived');
                                        }
                              });
                    </script>


                    <script type="text/javascript">
                              $('.lr-slider').owlCarousel({
                                        nav: true,
                                        itemClass: 'lr-item',
                                        loop: false,
                                        autoplay: true,
                                        autoplayHoverPause: true,
                                        responsiveClass: true,
                                        margin: 10,
                                        responsive: {
                                                  0: {
                                                            items: 1,
                                                            nav: true
                                                  },
                                                  320: {
                                                            items: 1,
                                                            nav: true
                                                  },
                                                  540: {
                                                            items: 1,
                                                            nav: true
                                                  },
                                                  760: {
                                                            items: 2,
                                                            nav: true
                                                  },
                                                  980: {
                                                            items: 3,
                                                            nav: true
                                                  },
                                                  1420: {
                                                            items: 4,
                                                            nav: true
                                                  },
                                                  1640: {
                                                            items: 5,
                                                            nav: true
                                                  },
                                                  1920: {
                                                            items: 8,
                                                            nav: true
                                                  }
                                        }
                              });

                              displayRate($(".display-rating"));
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

          </body>
</html>