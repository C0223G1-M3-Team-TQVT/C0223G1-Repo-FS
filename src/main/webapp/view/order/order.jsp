<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/3/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form method="post" action="/receipt-servlet">
    <c:forEach items="${list}" var="cake">

        <div class="card" style="width: 14rem; float: left; margin: 80px; border: none">
            <p>${cake.name}</p>
            <img src="${cake.picture}" class="card-img-top">
            <div class="card-body">

                <button type="button" onClick="tru(${cake.id})" style="float: left; width: 30px">-</button>
                <input value='0' id="${cake.id}" readonly style="width: 130px;float: left; text-align: center">
                <input id="Price${cake.id}" value="${cake.price}" hidden>
                <input id="Name${cake.id}" value="${cake.name}" hidden>
                <button type="button" onClick="cong(${cake.id})" style="float: left; width: 30px">+</button>
            </div>
        </div>
    </c:forEach>
    <button onclick="gioHang()" type="button" class="btn btn-primary" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop" style="position: fixed; right: 10px; bottom: 10px">
        Giỏ Hàng
    </button>

    <%--    GIỎ HÀNG--%>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="gioHang"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#datHang">
                        Đặt hàng
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- NÚT ĐẶT HÀNG -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#datHang">
        Đặt hàng
    </button>

    <!-- MODAL ĐẶT HÀNG -->
    <div class="modal fade" id="datHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Nhập tên <input name="name" value=""><br>
                    Nhập địa chỉ <input name="address" value=""><br>
                    Nhập sđt <input name="phoneNumber" value=""><br>
                    Nhập ghi chú thêm <input name="describe" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">quay lại</button>
                    <button type="submit" class="btn btn-primary">ĐẶT</button>
                </div>
            </div>
        </div>
    </div>

</form>
<script>
    function tru(i) {
        let a = document.getElementById(i).value * 1;
        if (a == 0) {
            return;
        }
        document.getElementById(i).value = a - 1;
        gioHang();
    }

    function cong(i) {
        let a = document.getElementById(i).value * 1;
        document.getElementById(i).value = a + 1;
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
        let tableString = '<table border="1">';
        tableString += '<tr>';
        tableString += '<th>Tên Sản Phẩm</th>';
        tableString += '<th>Số lượng</th>';
        tableString += '<th>Giá</th>';
        tableString += '</tr>';
        while (document.getElementById(a) != null) {
            if (document.getElementById(a).value * 1 > 0) {
                tableString += '<tr>';
                tableString += '<th>' + layTen(a) + '</th>';
                tableString += '<th>' + (document.getElementById(a).value * 1) + '</th>';
                tableString += '<th>' + (document.getElementById(a).value * 1 * layGia(a)) + '</th>';
                tableString += '<input name="' + a + '" value="' + document.getElementById(a).value + '" hidden>'
                tableString += '</tr>';
                gia += (document.getElementById(a).value * 1 * layGia(a));
            }
            a = Number(a) + 1;
            a = String(a);
        }
        tableString += '<tr>';
        tableString += '<td>Tổng</td>';
        tableString += '<td colspan="2">' + gia + '</td>';
        tableString += '<tr>';

        tableString += '</table>'
        document.getElementById("gioHang").innerHTML = tableString;
    }
</script>
</body>
</html>
