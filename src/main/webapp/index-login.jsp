<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
<%--    <style>--%>
<%--        @import url('https://th.bing.com/th?id=OIP.faUG1lf2gcBIH2F3soOTdgHaIR&w=236&h=264&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2');--%>

<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            box-sizing: border-box;--%>
<%--            font-family: 'Poppins', sans-serif;--%>
<%--        }--%>

<%--        .col-2 {--%>
<%--            text-align: center;--%>
<%--            border-color: white;--%>
<%--            height: 60px;--%>
<%--            padding-top: 15px;--%>
<%--        }--%>

<%--        .card-img-top {--%>
<%--            height: 200px;--%>
<%--        }--%>

<%--        .card {--%>
<%--            text-align: center;--%>

<%--        }--%>

<%--        a.card-text {--%>
<%--            color: deeppink;--%>
<%--            font-family: "Lucida Console"--%>
<%--        }--%>

<%--        section {--%>
<%--            position: static;--%>
<%--            width: 100%;--%>
<%--            min-height: 100vh;--%>
<%--            padding: 100px;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--            background: #ffffff;--%>

<%--        }--%>

<%--        header {--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            padding: 20px 100px;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>

<%--        }--%>

<%--        header.logo {--%>
<%--            position: relative;--%>
<%--            max-width: 80px;--%>
<%--        }--%>

<%--        header ul {--%>
<%--            position: relative;--%>
<%--            display: flex;--%>
<%--        }--%>

<%--        header ul li {--%>
<%--            list-style: none;--%>
<%--        }--%>

<%--        header ul li a {--%>
<%--            display: inline-block;--%>
<%--            color: #333;--%>
<%--            font-weight: 400;--%>
<%--            margin-left: 40px;--%>
<%--            text-decoration: none;--%>

<%--        }--%>

<%--        .content {--%>
<%--            position: relative;--%>
<%--            width: 100%;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--        }--%>

<%--        .content .textBox {--%>
<%--            position: relative;--%>
<%--            max-width: 600px;--%>
<%--        }--%>

<%--        .content .textBox h2 {--%>
<%--            color: #333;--%>
<%--            font-size: 4em;--%>
<%--            line-height: 1.4em;--%>
<%--            font-weight: 500;--%>
<%--        }--%>

<%--        .content .textBox h2 span {--%>
<%--            color: #d5a531;--%>
<%--            font-size: 1.2em;--%>
<%--            font-weight: 900;--%>
<%--        }--%>

<%--        .content .textBox p {--%>
<%--            color: #333;--%>
<%--        }--%>

<%--        .content .textBox a {--%>
<%--            display: inline-block;--%>
<%--            margin-top: 20px;--%>
<%--            padding: 8px 20px;--%>
<%--            background: #484646;--%>
<%--            color: #ffffff;--%>
<%--            border-radius: 40px;--%>
<%--            font-weight: 500;--%>
<%--            letter-spacing: 1px;--%>
<%--            text-decoration: none;--%>
<%--        }--%>

<%--        .content .imgBox {--%>
<%--            width: 600px;--%>
<%--            display: flex;--%>
<%--            justify-content: flex-end;--%>
<%--            padding-right: 50px;--%>
<%--            margin-top: 50px;--%>
<%--        }--%>

<%--        .content .imgBox img {--%>
<%--            max-width: 340px;--%>
<%--        }--%>

<%--        .thumb {--%>
<%--            position: absolute;--%>
<%--            left: 50%;--%>
<%--            bottom: 20px;--%>
<%--            transform: translateX(-50%);--%>
<%--            display: flex;--%>
<%--        }--%>

<%--        .thumb li {--%>
<%--            list-style: none;--%>
<%--            display: inline-block;--%>
<%--            margin: 0 20px;--%>
<%--            cursor: pointer;--%>
<%--            transition: 0.5s;--%>
<%--        }--%>

<%--        .thumb li:hover {--%>
<%--            transform: translateY(-15px);--%>
<%--        }--%>

<%--        .thumb li img {--%>
<%--            max-width: 60px;--%>
<%--        }--%>

<%--        .circle {--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background: #b97f9c;--%>
<%--            clip-path: circle(600px at right 850px);--%>
<%--        }--%>

<%--        .toast {--%>
<%--            background-color: #bb8496;--%>
<%--            color: #fff;--%>
<%--            padding: 15px;--%>
<%--            border-radius: 20px;--%>
<%--            position: fixed;--%>
<%--            bottom: 530px;--%>
<%--            right: 30px;--%>
<%--            z-index: 1;--%>
<%--            display: none;--%>
<%--        }--%>

<%--    </style>--%>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }


        .toggle {
            position: relative;
            width: 60px;
            height: 60px;
            background: url(https://i.ibb.co/HrfVRcx/menu.png);
            background-repeat: no-repeat;
            background-size: 30px;
            background-position: center;
            cursor: pointer;
        }

        .toggle.active {
            background: url(https://i.ibb.co/rt3HybH/close.png);
            background-repeat: no-repeat;
            background-size: 25px;
            background-position: center;
            cursor: pointer;
        }

        .showcase {
            position: absolute;
            right: 0;
            width: 100%;
            min-height: 100vh;
            padding: 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #111;
            transition: 0.5s;
            z-index: 2;
        }

        .showcase.active {
            right: 300px;
        }

        .showcase video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #d3dada;
            mix-blend-mode: overlay;
        }

        .text {
            position: relative;
            z-index: 10;
        }

        .text h2 {
            font-size: 5em;
            font-weight: 800;
            color: #fff;
            line-height: 1em;
            text-transform: uppercase;
        }

        .text h3 {
            font-size: 4em;
            font-weight: 700;
            color: #fff;
            line-height: 1em;
            text-transform: uppercase;
        }

        .text p {
            font-size: 1.1em;
            color: #fff;
            margin: 20px 0;
            font-weight: 400;
            max-width: 700px;
        }

        .text a {
            display: inline-block;
            font-size: 1em;
            background: #fff;
            padding: 10px 30px;
            text-transform: uppercase;
            text-decoration: none;
            font-weight: 500;
            margin-top: 10px;
            color: #111;
            letter-spacing: 2px;
            transition: 0.2s;
        }

        .text a:hover {
            letter-spacing: 6px;
        }

        .social {
            position: absolute;
            z-index: 10;
            bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .toast {
            background-color: #bb8496;
            color: #fff;
            padding: 15px;
            border-radius: 5px;
            position: fixed;
            top: 60px;
            right: 5px;
            z-index: 1;
            display: none;
        }

        .social li {
            list-style: none;
        }

        .social li a {
            display: inline-block;
            margin-right: 20px;
            filter: invert(1);
            transform: scale(0.5);
            transition: 0.5s;
        }

        .social li a:hover {
            transform: scale(0.5) translateY(-15px);
        }

        .menu {
            position: absolute;
            top: 0;
            right: 0;
            width: 300px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .menu ul {
            position: relative;
        }

        .menu ul li {
            list-style: none;
        }

        .menu ul li a {
            text-decoration: none;
            font-size: 24px;
            color: #111;
        }

        .menu ul li a:hover {
            color: #03a9f4;
        }

        @media (max-width: 991px) {
            .showcase,
            .showcase header {
                padding: 40px;
            }

            .text h2 {
                font-size: 3em;
            }

            .text h3 {
                font-size: 2em;
            }
        }

        .content {
            position: absolute;
            margin-top: 370px;

        }


        .footer-dark {
            padding: 50px 0;
            color: rgba(21, 19, 19, 0.76);
            background-color: #bdbdbe;
        }

        .footer-dark h3 {
            margin-top: 0;
            margin-bottom: 12px;
            font-weight: bold;
            font-size: 16px;
        }

        .footer-dark ul {
            padding: 0;
            list-style: none;
            line-height: 1.6;
            font-size: 14px;
            margin-bottom: 0;
        }

        .footer-dark ul a {
            color: inherit;
            text-decoration: none;
            opacity: 0.6;
        }

        .footer-dark ul a:hover {
            opacity: 0.8;
        }

        @media (max-width: 767px) {
            .footer-dark .item:not(.social) {
                text-align: center;
                padding-bottom: 20px;
            }
        }

        .footer-dark .item.text {
            margin-bottom: 36px;
        }

        @media (max-width: 767px) {
            .footer-dark .item.text {
                margin-bottom: 0;
            }
        }

        .footer-dark .item.text p {
            opacity: 0.6;
            margin-bottom: 0;
        }

        .footer-dark .item.social {
            text-align: center;
        }

        @media (max-width: 991px) {
            .footer-dark .item.social {
                text-align: center;
                margin-top: 20px;
            }
        }

        .footer-dark .item.social > a {
            font-size: 20px;
            width: 36px;
            height: 36px;
            line-height: 36px;
            display: inline-block;
            text-align: center;
            border-radius: 50%;
            box-shadow: 0 0 0 1px rgba(21, 19, 19, 0.76);
            margin: 0 8px;
            color: rgba(21, 19, 19, 0.76);
            opacity: 0.75;
        }

        .footer-dark .item.social > a:hover {
            opacity: 0.9;
        }

        .footer-dark .copyright {
            text-align: center;
            padding-top: 24px;
            opacity: 0.3;
            font-size: 13px;
            margin-bottom: 0;
        }
    </style>
</head>
<body>

<jsp:include page="/header-login.jsp"></jsp:include>
<%--<c:if test='${message != null}'>--%>
<%--    <center>--%>
<%--        <div id="toastMessage" class="toast"></div>--%>
<%--    </center>--%>
<%--</c:if>--%>


<section class="showcase">
    <video src="https://player.vimeo.com/external/479732217.sd.mp4?s=39562d1370d6cc9a5f5db52a302fc57e15361a3e&profile_id=164&oauth2_token_id=57447761"
           muted loop autoplay></video>
    <div class="text">
        <h3 style="color:white ">SÁNG TẠO, KIÊN TRÌ </h3>
        <h3 style="color:white ">VÀ CHĂM CHỈ </h3>
        <h4 style="color:white ">là những yếu tố tạo nên sự thành công</h4>
        <h4 style="color:white ">của người thợ làm bánh</h4>
        <a href="#">Explore</a>
    </div>
    <ul class="social">
        <li><a href="#"><img src="https://i.ibb.co/x7P24fL/facebook.png"></a></li>
        <li><a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
        <li><a href="#"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
    </ul>
</section>
<div style="width: 100%;height: 45em; border: none"></div>
<%--<tr>--%>
<%--    <div class="row content" style="text-align: center;float: left" >--%>
<%--        <h2 class="content" >--%>
<%--            SWEETIE BAKERY--%>
<%--        </h2>--%>
<%--        <p> aniodoiawdoiawoidnoanwiodaown nôiawd</p>--%>
<%--    </div>--%>
<%--</tr>--%>

<div class="container">
    <div class="row" style="padding-top: 50px">
        <div class=" col-4 col-md-4">
        </div>
        <div class="col-4 col-md-4">
            <h2 style="text-align: center;font-family:'Book Antiqua';color: #bb8496 ">SWEETIE BAKERY</h2>
        </div>
        <div class="col-4 col-md-4">
        </div>
    </div>
    <div class="row">
        <div class="col">
            Sweetie bakery , cái tên đã nói lên sự ngọt ngào trong từng sản phẩm của chúng tôi
            . Với mong muốn đem lại 1 bữa ăn nhẹ với những chiếc bánh ngọt là điểm mạnh của quán chúng tôi, quý khách sẽ
            được thưởng thức
            những chiếc bánh với hương vị ngọt ngào , tinh tế và có một chút gì đó dễ thương . Hãy đến đây thưởng thức
            và ủng hộ chúng tôi ,
            cửa hàng sẽ luôn ghi nhận những đánh giá và và chấp nhận những sai xót ở thời kỳ đầu để cải thiện và ngày
            càng phát triển hơn nữa.
        </div>
    </div>
</div>
<div class="row" style="padding-bottom: 50px">
    <div class="col" style="text-align: center;font-family: 'Arial Black'">
        <h4>XIN CHÂN THÀNH CẢM ƠN</h4>
    </div>
</div>
<div class="row" style="background-color: #ffd5de">
    <div class="col-12 col-md-8" style="text-align: center">
        <img src="https://png.pngtree.com/png-vector/20190130/ourlarge/pngtree-mbe-style-cartoon-cute-chocolate-strawberry-fruit-cake-material-foodmbe-cakembe-png-image_645783.jpg"
             style="width:100%;height:800px ">
    </div>
    <div class="col-12 col-md-4" style="text-align: center">
        <img src="https://img.lovepik.com/free_png/32/53/15/77Y58PICGra58PICYNe24fe3t_PIC2018.png_860.png"
             style="width:70%;height:800px ">
    </div>
</div>
<div class="footer-dark">
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 item">
                    <h3>Thành viên</h3>
                    <ul style="color: #171515">
                        <li><a href="#">Mai Phước Tài</a></li>
                        <li><a href="#">Phan Thanh Thiện</a></li>
                        <li><a href="#">Nguyễn Long Vũ</a></li>
                        <li><a href="#">Nguyễn Hữu Quốc</a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-3 item">
                    <h3>Thuộc về</h3>
                    <ul style="color: #171515">
                        <li><a href="#">SWEETIE BAKERY</a></li>
                        <li><a href="#">Team 2</a></li>
                    </ul>
                </div>
                <div class="col-md-6 item text">
                    <h3 style="color: #171515">SWEETIE BAKERY</h3>
                    <p style="color: #171515">
                        Cảm ơn vì đã tin tưởng và ủng hộ chúng tôi , chúng tôi sẽ cải thiện từng ngày để đem đến những
                        điều ngọt ngào nhất dành cho bạn
                    </p>
                </div>
            </div>
            <p class="copyright" style="color: #171515">SWEETIE BAKERY © 2023</p>
        </div>
    </footer>
</div>
<div id="toastMessage" class="toast" style="z-index: 100;background: #b97f9c;color: white" ></div>
<script>
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;
        setTimeout(function () {
            toast.style.display = "none";
        }, 3000);
    }

    window.addEventListener('load', function () {
        showToast("${message}");
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js">
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>

