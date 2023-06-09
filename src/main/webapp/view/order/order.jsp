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
<style>
    button {
        background-color: #b97f9c;
    }
</style>
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>

<form method="post" action="/receipt-servlet?action=order">
    <c:forEach items="${list}" var="cake">

        <div class="card col-4" style="float: left; padding: 80px; border: none">
            <p>${cake.name}</p>
            <img src="${cake.picture}" class="card-img-top" style="height: 220px; width: 220px">
            <div class="card-body">

                <button type="button" onClick="tru1(${cake.id})" style="float: left; width: 30px">-</button>
                <input id="${cake.id}" value='' readonly style="width: 130px;float: left; text-align: center">
                <input id="Price${cake.id}" value="${cake.price}" hidden>
                <input id="Name${cake.id}" value="${cake.name}" hidden>
                <button type="button" onClick="cong1(${cake.id})" style="float: left; width: 30px">+</button>
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
    <button onclick="gioHang()" type="button" class="btn btn-primary" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
            style="position: fixed; right: 10px; bottom: 10px;background-color: #b97f9c">
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
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#datHang"
            style="position: fixed; right: 120px; bottom: 10px; background-color: #b97f9c">
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
                    <table>
                        <tr>
                            <td>Nhập tên</td>
                            <td><input name="name" value=""><br></td>
                        </tr>
                        <tr>
                            <td>Nhập địa chỉ</td>
                            <td><input name="address" value=""><br></td>
                        </tr>
                        <tr>
                            <td>Nhập sđt</td>
                            <td><input name="phoneNumber" value="" pattern="[0-9]{10}"><br></td>
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
                tableString += '<th>' + (document.getElementById(a).value * 1000 * layGia(a)) + ' VNĐ</th>';
                tableString += '<input name="' + a + '" value="' + document.getElementById(a).value + '" hidden>'
                tableString += '</tr>';
                gia += (document.getElementById(a).value * 1000 * layGia(a));
            }
            a = Number(a) + 1;
            a = String(a);
        }
        tableString += '<tr>';
        tableString += '<td>Tổng</td>';
        tableString += '<td colspan="2">' + gia + ' VNĐ</td>';
        tableString += '<tr>';

        tableString += '</table>'
        document.getElementById("gioHang").innerHTML = tableString;
    }
</script>
</body>
</html>
