<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/7/2023
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #fixNav {
            width: 100%;
            height: 35px;
            background-color: #bb8496;
            display: block;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100000;
        }

        #fixNav ul {
            margin: 0;
            padding: 0;
        }

        #fixNav ul li {
            list-style: none inside;
            width: auto;
            float: left;
            line-height: 35px;
            color: #fff;
            padding: 0;
            margin-right: 10px;
            position: relative;
        }

        #fixNav ul li a {
            text-transform: uppercase;
            white-space: nowrap;
            padding: 0 10px;
            color: #fff;
            display: block;
            font-size: 0.8em;
            text-decoration: none;
        }


        #fixNav ul li:hover {

            background-color: deeppink;
        }

        #fixNav ul li:hover ul {

            display: block;
        }
    </style>
</head>
<body>
<nav id="fixNav">
    <ul>
        <li><a href="/employee?action=list">Nhân viên</a></li>
        <li style="float: right"><i class="fa-solid fa-right-from-bracket"></i></li>
        <li style="float: right;"><a href="/bakery?action=logout"> Đăng xuất</a></li>
        <li style="float:right;">${taikhoan}</li>
    </ul>
</nav>
</body>
</html>