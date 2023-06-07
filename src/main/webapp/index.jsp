<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        @import url('https://th.bing.com/th?id=OIP.faUG1lf2gcBIH2F3soOTdgHaIR&w=236&h=264&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .card-text{

        }

        section {
            position: relative;
            width: 100%;
            min-height: 100vh;
            padding: 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;

        }

        header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header.logo {
            position: relative;
            max-width: 80px;
        }

        header ul {
            position: relative;
            display: flex;
        }

        header ul li {
            list-style: none;
        }

        header ul li a {
            display: inline-block;
            color: #333;
            font-weight: 400;
            margin-left: 40px;
            text-decoration: none;

        }

        .content {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .content .textBox {
            position: relative;
            max-width: 600px;
        }

        .content .textBox h2 {
            color: #333;
            font-size: 4em;
            line-height: 1.4em;
            font-weight: 500;
        }

        .content .textBox h2 span {
            color: #d5a531;
            font-size: 1.2em;
            font-weight: 900;
        }

        .content .textBox p {
            color: #333;
        }

        .content .textBox a {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 20px;
            background: #484646;
            color: #ffffff;
            border-radius: 40px;
            font-weight: 500;
            letter-spacing: 1px;
            text-decoration: none;
        }

        .content .imgBox {
            width: 600px;
            display: flex;
            justify-content: flex-end;
            padding-right: 50px;
            margin-top: 50px;
        }

        .content .imgBox img {
            max-width: 340px;
        }

        .thumb {
            position: absolute;
            left: 50%;
            bottom: 20px;
            transform: translateX(-50%);
            display: flex;
        }

        .thumb li {
            list-style: none;
            display: inline-block;
            margin: 0 20px;
            cursor: pointer;
            transition: 0.5s;
        }

        .thumb li:hover {
            transform: translateY(-15px);
        }

        .thumb li img {
            max-width: 60px;
        }

        .circle {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #b97f9c;
            clip-path: circle(600px at right 850px);
        }
        li:hover a{
            box-shadow: 0 0 2px #c539d5;
            color: #c539d5;
        }
    </style>
</head>
<body>

<section>
    <div class="circle"></div>
    <header>
        <a href="#"><img style="width: 100px" class="logo" src="hihtech-html/image_720.png" alt=""></a>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="/receipt-servlet">Đặt Hàng</a></li>
            <li><a href="/cake">Sản Phẩm</a></li>
            <li><a href="/bakery?action=login">Đăng nhập</a></li>
            <li><a href="/employee?action=list">Nhân viên</a></li>
            <li><a href="/detailreceipt?action=a">Hóa đơn</a></li>
        </ul>
    </header>
    <div class="content">
        <div class="textBox">
            <h2>Hãy yêu con trai <br>bà bán <span class="banhmi">bánh mì</span></h2>
            <p>lo lo lo cho em <br> lo lo lo lo gì <br> ngoài lo lo lo lo ve</p>
            <a href="#">Xem tiếp</a>
        </div>
        <div class="imgBox">
            <img src="img/120502-and-cake-the-masha-bear.png" class="starbucks">
        </div>
    </div>
    <ul class="thumb">
        <li>
            <img src="img/66-red-apple-png-image.png" alt=""
                 onclick="imgSilder('img/66-red-apple-png-image.png');changeCircleColor('#850606')">
            <img src="img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png" alt=""
                 onclick="imgSilder('img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png');changeCircleColor('#231a1a')">
            <img src="img/146915-cake-creamy-piece-free-hq-image.png" alt=""
                 onclick="imgSilder('img/146915-cake-creamy-piece-free-hq-image.png');changeCircleColor('#e8b84b')">
        </li>
    </ul>
</section>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://images.pexels.com/photos/1629998/pexels-photo-1629998.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH NGỌT</a>
    </div>
</div>

<div style="text-align: center">
    <p>BAKERY & CAFE</p>
    <p> Địa chỉ: gì đó, quận Hải Châu, Đà Nẵng</p>
    <p> Điện thoại: 0236 3 888 348</p>
    <p> email</p>
</div>

<script type="text/javascript" src="../../bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.bundle.js">
    function imgSilder(anything) {
        document.querySelector('.starbucks').src = anything;
    }

    function changeCircleColor(color) {
        const circle = document.querySelector('.circle');
        circle.style.background = color;
    }

</script>
</body>
</html>

