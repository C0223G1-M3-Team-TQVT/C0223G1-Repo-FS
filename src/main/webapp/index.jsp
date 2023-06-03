<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins',sans-serif;
        }
        section{
            position: relative;
            width: 100%;
            min-height: 100vh;
            padding: 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;

        }
        header{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header.logo{
            position: relative;
            max-width: 80px;
        }
        header ul{
            position: relative;
            display: flex;
        }
        header ul li{
            list-style: none;
        }
        header ul li a{
            display: inline-block;
            color: #333;
            font-weight: 400;
            margin-left: 40px;
            text-decoration: none;

        }
        .content{
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .content .textBox{
            position: relative;
            max-width: 600px;
        }
        .content .textBox h2{
            color: #333;
            font-size: 4em;
            line-height: 1.4em;
            font-weight: 500;
        }
        .content .textBox h2 span{
            color: #d5a531;
            font-size: 1.2em;
            font-weight: 900;
        }
        .content .textBox p{
            color: #333;
        }
        .content .textBox a{
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
        .content .imgBox{
            width: 600px;
            display: flex;
            justify-content: flex-end;
            padding-right: 50px;
            margin-top: 50px;
        }
        .content .imgBox img{
            max-width: 340px;
        }
        .thumb{
            position: absolute;
            left: 50%;
            bottom: 20px;
            transform: translateX(-50%);
            display: flex;
        }
        .thumb li{
            list-style: none;
            display: inline-block;
            margin: 0 20px;
            cursor: pointer;
            transition: 0.5s;
        }
        .thumb li:hover{
            transform: translateY(-15px);
        }
        .thumb li img{
            max-width: 60px;
        }
        .circle{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #b97f9c;
            clip-path: circle(600px at right 850px);
        }


    </style>
</head>
<body>

<section>
    <div class="circle"></div>
    <header>
        <a href="#" ><img style="width: 100px" class="logo" src="hihtech-html/image_720.png" alt=""></a>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Đặt Hàng</a></li>
            <li><a href="#">Sản Phẩm</a></li>
            <li><a href="/bakery?action=login">Đăng nhập</a></li>
            <li><a href="#">Đăng kí</a></li>
            <li><a href="#">Search</a></li>
        </ul>
    </header>
    <div class="content">
        <div class="textBox">
            <h2>Hãy yêu con trai <br>bà bán <span class="banhmi">bánh mì</span> </h2>
            <p>lo lo lo cho em <br> lo lo lo lo gì <br> ngoài lo lo lo lo ve</p>
            <a href="#">Xem tiếp</a>
        </div>
        <div class="imgBox">
            <img src="img/120502-and-cake-the-masha-bear.png" class="starbucks">
        </div>
    </div>
    <ul class="thumb">
        <li>
            <img src="img/66-red-apple-png-image.png" alt="" onclick="imgSilder('img/66-red-apple-png-image.png');changeCircleColor('#850606')">
            <img  src="img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png" alt="" onclick="imgSilder('img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png');changeCircleColor('#231a1a')">
            <img  src="img/146915-cake-creamy-piece-free-hq-image.png" alt="" onclick="imgSilder('img/146915-cake-creamy-piece-free-hq-image.png');changeCircleColor('#e8b84b')">
        </li>
    </ul>

</section>
<script type="text/javascript">
    function imgSilder(anything){
        document.querySelector('.starbucks').src=anything;
    }

    function changeCircleColor(color){
        const circle=document.querySelector('.circle');
        circle.style.background=color;
    }

</script>
</body>
</html>
