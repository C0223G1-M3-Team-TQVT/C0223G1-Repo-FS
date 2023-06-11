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
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>
        #fixNav {
            width: 100%;
            height: 35px;
            background-color: #bb8496;
            display: block;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5); /*Đổ bóng cho menu*/
            position: fixed; /*Cho menu cố định 1 vị trí với top và left*/
            top: 0; /*Nằm trên cùng*/
            left: 0; /*Nằm sát bên trái*/
            z-index: 100000; /*Hiển thị lớp trên cùng*/
        }

        #fixNav ul {
            margin: 0;
            padding: 0;
        }

        #fixNav ul li {
            list-style: none inside;
            width: auto;
            float: left;
            line-height: 35px; /*Cho text canh giữa menu*/
            color: #fff;
            padding: 0;
            margin-right: 10px;
            position: relative;
        }

        #fixNav ul li a {
            text-transform: uppercase;
            white-space: nowrap; /*Cho chữ trong menu không bị wrap*/
            padding: 0 10px;
            color: #fff;
            display: block;
            font-size: 0.8em;
            text-decoration: none;
        }

        /*CSS Style cho Submenu*/


        /* Hover cho submenu */
        #fixNav ul li:hover {
            /* Hover thì li sẽ đổi màu*/
            background-color: deeppink;
        }

        #fixNav ul li:hover ul {
            /*Display ra submenu*/
            display: block;
        }
    </style>
</head>
<body>
<nav id="fixNav">
    <ul>
        <li><a href="/index.jsp">Trang chủ</a></li>
        <%--        <li><a href="/cake">Sản phẩm</a></li>--%>
        <li><a href="/receipt-servlet?action=order">Đặt hàng</a></li>
        <%--        <li><a href="/employee?action=list">Nhân viên</a></li>--%>
        <%--        <li><a href="/detailreceipt?action=a">Hóa đơn</a></li>--%>
     <li style="float: right"><i class="fa-solid fa-user-gear"></i></li>
        <li style="float: right"><a href="/bakery?action=login" style="font-size: 15px">Đăng nhập</a></li>
        <%--        <li style="float: right;"> ${taikhoan} <a href="/bakery?action=logout"> Đăng xuất</a></li>--%>
    </ul>
</nav>
</body>
</html>
