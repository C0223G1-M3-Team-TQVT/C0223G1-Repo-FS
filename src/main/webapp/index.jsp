<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .toast {
            background-color: #bb8496;
            color: #fff;
            padding: 15px;
            border-radius: 20px;
            position: fixed;
            bottom:530px;
            right: 30px;
            z-index: 1;
            display: none;
        }
        @import url('https://th.bing.com/th?id=OIP.faUG1lf2gcBIH2F3soOTdgHaIR&w=236&h=264&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .col-2 {
            text-align: center;
            border-color: white;
            height: 60px;
            padding-top: 15px;
        }

        .card-img-top {
            height: 200px;
        }

        .card {
            text-align: center;

        }

        a.card-text {
            color: deeppink;
            font-family: "Lucida Console"
        }

        section {
            position: static;
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

    </style>
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>

<section>
    <c:if test='${message != null}'>
        <center>
            <div id="toastMessage" class="toast"></div>
        </center>
    </c:if>
    <div class="circle"></div>
    <div class="content">
        <div class="textBox">
            <p style="color: #b97f9c;font-family: 'Felix Titling';font-size: 70px;">SWEETER THAN YOUR EX</p>

            <img   style="height: 300px;width: 300px;border-radius: 50%" src="img/image (1).png">
        </div>
        <div class="imgBox">
            <img src="" class="starbucks">
        </div>
    </div>
    <%--    <ul class="thumb">--%>
    <%--        <li>--%>
    <%--            <img src="img/66-red-apple-png-image.png" alt=""--%>
    <%--                 onclick="imgSilder('img/66-red-apple-png-image.png');changeCircleColor('#850606')">--%>
    <%--            <img src="img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png" alt=""--%>
    <%--                 onclick="imgSilder('img/159089-dark-cake-chocolate-free-transparent-image-hq_600x600.png');changeCircleColor('#231a1a')">--%>
    <%--            <img src="img/146915-cake-creamy-piece-free-hq-image.png" alt=""--%>
    <%--                 onclick="imgSilder('img/146915-cake-creamy-piece-free-hq-image.png');changeCircleColor('#e8b84b')">--%>
    <%--        </li>--%>
    <%--    </ul>--%>
</section>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://th.bing.com/th/id/R.cbac73649f11f534c4091fa05ac322fd?rik=11EKSS9JbcBLJg&riu=http%3a%2f%2fmedia.vietq.vn%2ffiles%2fctvhanh%2fbanh_ngot.jpg&ehk=hUEIhZtXqSKpHKZOFQg2Tknn5mRT0fpCcd030cWdS1g%3d&risl=&pid=ImgRaw&r=0"
         class="card-img-top" alt="...">
    <div class="card-body">
        <p><a class="card-text" href="">BÁNH NGỌT</a></p>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://th.bing.com/th/id/R.2b441c3085718166d5b0bde44862dd09?rik=puuilu1SfOQjQQ&riu=http%3a%2f%2fanphutan
    .com%2fwp-content%2fuploads%2f2018%2f08%2fbanh-mousse-viet-quat.jpg&ehk=sdNZ7RveTlYO0Ba7Jk1IDfD%2f5%2bTT6mKCn6zp%2fBI%2b9NE%3d&risl=&pid=ImgRaw&r=0"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH LẠNH</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://th.bing.com/th/id/R.b78eeff1d8318e10b5b856987b87128c?rik=5a1xRA5Ps0YXXA&riu=http%3a%2f%2ffoodisa
    fourletterword.com%2fwp-content%2fuploads%2f2020%2f11%2fVietnamese_Chicken_Banh_Mi_Recipe_Banh_Mi_Ga_Roti_new2.
    jpg&ehk=57vR67zsj1QYi95KKPIdFUstdMy2CVRIGiK0U8sUVbk%3d&risl=&pid=ImgRaw&r=0"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH MÌ</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://th.bing.com/th/id/R.ead6bd00a32a6be90b45b6be7ddc8f18?rik=rmD93FVVmSo5iA&pid=ImgRaw&r=0"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">PIZZA & HAMBURGER</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://tranthinhlam.com/wp-content/uploads/2020/07/ma-bs0017_82.png"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">BÁNH KEM</a>
    </div>
</div>

<div class="card col-4" style="height: 350px; padding: 50px; float: left; border: none">
    <img src="https://th.bing.com/th/id/R.f6b0d6f6999a2b50ad299961f70e3833?rik=wA%2bFov8zEwzn9g&riu=http%3a%2f%2f
    banggiabanhtrungthu.com%2fkcfinder%2fupload%2fimages%2fbanh-trung-thu-kinh-do-3.jpg&ehk=HttpY6c2zfffYZGnga2ouBmxHS0hh3CDmeQ3Ndn5G%2bg%3d&risl=&pid=ImgRaw&r=0"
         class="card-img-top" alt="...">
    <div class="card-body">
        <a class="card-text" href="">KHÁC</a>
    </div>
</div>

<div style="text-align: center; background-color: #b97f9c">
    <p>SWEETIE BAKERY</p>
    <p> Địa chỉ: 280 Trần Hưng Đạo, quận Sơn Trà, Đà Nẵng</p>
    <p> Điện thoại: 0236 3 888 348</p>
    <p> Email : sieuem2002@gmail.com</p>
</div>


<script>
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;
        setTimeout(function() {
            toast.style.display = "none";
        }, 3000);
    }
    window.addEventListener('load', function() {
        showToast("${message}");
    });
</script>
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

