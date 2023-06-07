<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 8:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>
        form {
            /*width: 450px;*/
            /*min-height: 500px;*/
            /*height: auto;*/
            /*border-radius: 5px;*/
            /*margin: 2% auto;*/
            box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
            /*padding: 2%;*/
            background-image: linear-gradient(-225deg, #E3FDF5 50%, #FFE6FA 50%);
        }
    </style>
</head>
<body>
<form method="post" action="/cake?action=update">
    <fieldset>
        <legend>
            <h3>Chỉnh sửa sản phẩm</h3>
        </legend>
        <%--        String name, int typeOfCake, double price, int amount, String picture--%>
        <table border="1px" class="table table-striped table-bordered" id="tableStudent" style="width:100%">
            <thead>
            <th>Tên bánh</th>
            <th>Loại bánh</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Ảnh(nếu có)</th>
            </thead>
            <tr>
                <td>
                    <c:out value="${cake.name}"/>
                    <input name="name" value="${cake.name}">
                </td>
                <td>
                    <select name="typeOfCake">
                        <option value="${cake.typeOfCake}">${cake.typeOfCake}</option>
                        <c:forEach items="${typeOfCakeList}" var="type">
                            <option value="${type.id}">${type.id} - ${type.name}</option>
                        </c:forEach>
                    </select> <br>
                </td>
                <td>
                    <c:out value="${cake.price}"/>
                    <input name="price" value="${cake.price}">
                </td>
                <td>
                    <c:out value="${cake.amount}"/>
                    <input name="amount" value="${cake.amount}">
                </td>
                <td>
                    <img src="${cake.picture}" width="100px" height="100px">
                    <input name="picture" value="${cake.picture}">
                </td>
            </tr>
        </table>
    </fieldset>
    <input name="id" value="${cake.id}" type="hidden">
    <button type="submit" class="btn btn-outline-primary">Xác nhận chỉnh sửa</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>
