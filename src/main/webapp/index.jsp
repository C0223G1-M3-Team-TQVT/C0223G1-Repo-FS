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
            background-color: #333;
            color: #fff;
            padding: 15px;
            border-radius: 5px;
            position: fixed;
            top: 30px;
            right: 30px;
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
    </style>
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>

<body>
<!-- Video Source -->
<!-- https://www.pexels.com/video/aerial-view-of-beautiful-resort-2169880/ -->
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

<div id="toastMessage" class="toast"style="z-index: 100"></div>
<script>
<%--    <%--%>
<%--    String t = (String)request.getAttribute("toast");--%>
<%--    if(t==null){--%>
<%--        t="";--%>
<%--    }--%>
<%--    if(t.equals("t")){--%>
<%--        %>--%>
    // Function to show the toast message
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;
        setTimeout(function () {
            toast.style.display = "none";
        }, 3000); // Hide the toast message after 3 seconds
    }

    // Automatically show the toast message when the page is reloaded
    window.addEventListener('load', function () {
        showToast("Page reloaded!");
    });
<%--    <%}--%>
<%--    %>--%>

    const menuToggle = document.querySelector('.toggle');
    const showcase = document.querySelector('.showcase');

    menuToggle.addEventListener('click', () => {
        menuToggle.classList.toggle('active');
        showcase.classList.toggle('active');
    })
</script>
</body>
</html>

