<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 8:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm mới bánh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Abel|Abril+Fatface|Alegreya|Arima+Madurai|Dancing+Script|Dosis|Merriweather|Oleo+Script|Overlock|PT+Serif|Pacifico|Playball|Playfair+Display|Share|Unica+One|Vibur');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            background-attachment: fixed;
            background-repeat: no-repeat;

            font-family: 'Vibur', cursive;
            /*   the main font */
            font-family: 'Abel', sans-serif;
            opacity: .95;
            /* background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%); */
        }

        form {
            width: 450px;
            min-height: 500px;
            height: auto;
            border-radius: 5px;
            margin: 2% auto;
            box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
            padding: 2%;
            background-image: linear-gradient(-225deg, #E3FDF5 50%, #FFE6FA 50%);
        }

        /* form Container */
        form .con {
            display: -webkit-flex;
            display: flex;

            -webkit-justify-content: space-around;
            justify-content: space-around;

            -webkit-flex-wrap: wrap;
            flex-wrap: wrap;

            margin: 0 auto;
        }

        /* the header form form */
        header {
            margin: 2% auto 10% auto;
            text-align: center;
        }

        /* Login title form form */
        header h2 {
            font-size: 250%;
            font-family: 'Playfair Display', serif;
            color: #3e403f;
        }

        /*  A welcome message or an explanation of the login form */
        header p {
            letter-spacing: 0.05em;
        }

        /* inputs form  */
        input[class="form-input"] {
            width: 220px;
            height: 50px;

            margin-top: 2%;
            padding: 15px;

            font-size: 16px;
            font-family: 'Abel', sans-serif;
            color: #5E6472;

            outline: none;
            border: none;

            border-radius: 0px 5px 5px 0px;
            transition: 0.2s linear;

        }

        input[id="txt-input"] {
            width: 250px;
        }

        /* focus  */
        input:focus {
            transform: translateX(-2px);
            border-radius: 5px;
        }

        /* //////////////////////////////////////////// */
        /* //////////////////////////////////////////// */

        /* input[type="text"] {min-width: 250px;} */
        /* buttons  */
        button {
            display: inline-block;
            color: #252537;

            width: 260px;
            height: 50px;

            padding: 0 20px;
            background: #fff;
            border-radius: 5px;

            outline: none;
            border: none;

            cursor: pointer;
            text-align: center;
            transition: all 0.2s linear;

            margin: 7% auto;
            letter-spacing: 0.05em;
        }

        /* Submits */
        .submits {
            width: 48%;
            display: inline-block;
            float: left;
            margin-left: 2%;
        }

        /*       Forgot Password button FAF3DD  */
        .frgt-pass {
            background: transparent;
        }

        /*     Sign Up button  */
        .sign-up {
            background: #B8F2E6;
        }


        /* buttons hover */
        button:hover {
            transform: translatey(3px);
            box-shadow: none;
        }

        /* buttons hover Animation */
        button:hover {
            animation: ani9 0.4s ease-in-out infinite alternate;
        }

        @keyframes ani9 {
            0% {
                transform: translateY(3px);
            }
            100% {
                transform: translateY(5px);
            }
        }

        #out {
            color: #E3FDF5;
        }
    </style>
</head>
<body>
<div id="out">
    <a href="/cake" style="color: rgba(21,19,19,0.76)">
        Quay lại
    </a>
</div>
<div class="overlay">
    <form action="/cake?action=create" method="post" id="form-1">
        <div class="con">
            <header class="head-form">
                <h2>Thêm Mới</h2>
                <p>Nhập các thông tin sản phẩm bạn muốn thêm mới</p>
            </header>
            <br>
            <div class="field-set">
                <div class="mb-2 form-group">
                    <label for="name" class="form-label">Tên bánh</label>
                    <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp" required>
                </div>
                <div class="mb-4 form-group">
                    <label for="typeOfCake" class="form-label">Mã loại bánh</label>
                    <select class="form-select" aria-label="Default select example" id="typeOfCake" name="typeOfCake"
                            pattern="^([A-Z]([a-z])+)(\s[A-Z]([a-z])+)+$" title="Vui lòng nhập tên có thực" required>
                        <option selected></option>
                        <c:forEach items="${typeOfCakeList}" var="typeOfCake">
                            <option value="${typeOfCake.id}">${typeOfCake.name}</option>
                        </c:forEach>
                    </select> <br>
                </div>
                <div class="mb-2 form-group">
                    <label for="price" class="form-label">Giá bánh</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <div class="mb-2 form-group">
                    <label for="amount" class="form-label">Số lượng bánh hiện tại</label>
                    <input type="number" class="form-control" id="amount" name="amount" required>
                </div>
                <div class="mb-2 form-group">
                    <label for="picture" class="form-label">Ảnh minh họa</label>
                    <input type="text" class="form-control" id="picture" name="picture">
                </div>
                <button class="log-in" type="submit">Thêm mới</button>
            </div>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js">
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
