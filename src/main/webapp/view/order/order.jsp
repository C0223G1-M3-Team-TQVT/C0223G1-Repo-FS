<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/3/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    table {

    }

    section {
        background-image: url("https://th.bing.com/th/id/OIP.YmqQzldwnRxwcGT1X9sbLgHaEK?w=289&h=180&c=7&r=0&o=5&dpr=2&pid=1.7");

    }

    button {
        background-color: #b97f9c;
    }

    button:hover {
        background-color: deeppink;
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

    .showcase video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.8;
    }

</style>
<script src="https://kit.fontawesome.com/yourcode.js"></script>
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>
<form method="post" action="/receipt-servlet?action=order">
    <section class="showcase">
        <video src="https://player.vimeo.com/external/377041468.sd.mp4?s=4187b0e72997a22cb434600a1da9baef74e82704&profile_id=164&oauth2_token_id=57447761"
               muted loop autoplay></video>
        <div class="text">
            <h1 style="color:white ">SWEETER </h1>
            <h1 style="color:white ">THAN </h1>
            <h1 style="color:white ">YOUR EX</h1>
        </div>
    </section>
    <div class="col-12" style="height: 100%"></div>


    <c:forEach items="${list}" var="cake">

        <div class="card col-6" style="height: 200px;float: left">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="${cake.picture}" class="img-fluid rounded-start" alt="..." style="height: 200px">
                </div>
                <div class="col-md-8" style="background-color: #c2b1b9">
                    <div class="card-body" style="background-color: whitesmoke">
                        <p style="font-size: larger; font-family: 'Apple Chancery, cursive'">${cake.name}</p>
                        <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${cake.price*1000}"/> <c:out
                            value="VNĐ"/></p>
<%--                        <p style="font-size: larger; font-family: 'Apple Chancery, cursive'"> VNĐ</p>--%>
                        <button type="button" onClick="tru1(${cake.id})" style="float: left; width: 30px">-</button>
                        <input id="${cake.id}" value='' readonly style="width: 130px;float: left; text-align: center">
                        <input id="Price${cake.id}" value="${cake.price}" hidden>
                        <input id="Name${cake.id}" value="${cake.name}" hidden>
                        <button type="button" onClick="cong1(${cake.id})" style="float: left; width: 30px">+</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            if (sessionStorage.getItem(${cake.id}) == null) {
                sessionStorage.setItem(${cake.id}, 0)
                document.getElementById(${cake.id}).value = 0;
            } else {
                document.getElementById(${cake.id}).value = sessionStorage.getItem(${cake.id}) * 1;
            }
        </script>
    </c:forEach>

    <%--NÚT GIỎ HÀNG--%>

    <button onclick="gioHang()" type="button" class="btn btn-primary" data-bs-toggle="modal"
    data-bs-target="#staticBackdrop"
    style="position: fixed; right: 10px; bottom: 10px;z-index: 100;background-color: #b97f9c; font-size: 27px"> <i class="fa-solid fa-cart-shopping"></i></button>


    <%--    GIỎ HÀNG--%>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Giỏ hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="gioHang"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                            style="background-color: #b97f9c">Đóng
                    </button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#datHang"
                            style="background-color: #b97f9c">
                        Đặt hàng
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- NÚT ĐẶT HÀNG -->
    <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#datHang"
            style="position: fixed; right: 90px; bottom: 10px; background-color: #b97f9c;z-index: 100">
        Đặt hàng
    </button>

    <!-- MODAL ĐẶT HÀNG -->
    <div class="modal fade" id="datHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông tin đặt hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table>
                        <tr>
                            <td>Nhập tên</td>
                            <td><input name="name" value="" required><br></td>
                        </tr>
                        <tr>
                            <td>Nhập địa chỉ</td>
                            <td><input name="address" value="" required><br></td>
                        </tr>
                        <tr>
                            <td>Nhập sđt</td>
                            <td><input name="phoneNumber" value="" pattern="[0-9]{10,12}"><br></td>
                        </tr>
                        <tr>
                            <td>Nhập ghi chú thêm</td>
                            <td><input name="describe" value=""></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                            style="background-color: #b97f9c">Quay lại
                    </button>
                    <button onclick="clear()" type="submit" class="btn btn-primary" style="background-color: #b97f9c">
                        Đặt
                    </button>
                </div>
            </div>
        </div>
    </div>

</form>

<script>

    function clear() {
        sessionStorage.clear();
    }

    function cong1(i) {
        sessionStorage.setItem(i, sessionStorage.getItem(i) * 1 + 1);
        document.getElementById(i).value = sessionStorage.getItem(i);
        gioHang();
    }

    function tru1(i) {
        if (document.getElementById(i).value == 0) {
            return;
        }
        sessionStorage.setItem(i, sessionStorage.getItem(i) * 1 - 1);
        document.getElementById(i).value = sessionStorage.getItem(i);
        gioHang();
    }

    function layGia(i) {
        let id = "Price" + i;
        let gia = document.getElementById(id).value * 1;
        return gia;
    }

    function layTen(i) {
        let id = "Name" + i;
        let ten = document.getElementById(id).value;
        return ten;
    }

    function gioHang() {
        let a = "1";
        let gia = 0;
        let tableString = '<table border="1" class="table-bordered ">';
        tableString += '<tr>';
        tableString += '<th>Tên Sản Phẩm</th>';
        tableString += '<th>Số lượng</th>';
        tableString += '<th>Giá</th>';
        tableString += '</tr>';
        while (document.getElementById(a) != null) {
            if (document.getElementById(a).value * 1 > 0) {
                tableString += '<tr>';
                tableString += '<td>' + layTen(a) + '</td>';
                tableString += '<td style="text-align: center">' + (document.getElementById(a).value * 1) + '</td>';
                tableString += '<td>' + (document.getElementById(a).value * 1000 * layGia(a)) + ' VNĐ</td>';
                tableString += '<input name="' + a + '" value="' + document.getElementById(a).value + '" hidden>'
                tableString += '</tr>';
                gia += (document.getElementById(a).value * 1000 * layGia(a));
            }
            a = Number(a) + 1;
            a = String(a);
        }
        tableString += '<tr>';
        tableString += '<th>Tổng</th>';
        tableString += '<th colspan="2">' + gia + ' VNĐ</th>';
        tableString += '<tr>';

        tableString += '</table>'
        document.getElementById("gioHang").innerHTML = tableString;
    }
</script>
</body>
</html>
