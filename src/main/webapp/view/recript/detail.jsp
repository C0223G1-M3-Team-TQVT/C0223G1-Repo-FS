<%--
Created by IntelliJ IDEA.
User: Admin
Date: 6/5/2023
Time: 2:17 AM
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <style>
        .toast {
            background-color: #333;
            color: #fff;
            padding: 15px;
            border-radius: 5px;
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1;
            display: none;
        }
    </style>
</head>
<body>
<c:if test='${message != null}'>
    <center>
        <div id="toastMessage" class="toast"></div>
    </center>
</c:if>
<div>
    <div class="row header bg-info">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <jsp:include page="/header-login.jsp"></jsp:include>
            </div>
        </nav>
    </div>
    <div class="row content" style="padding-top: 50px">
        <nav class="navbar navbar-expand-lg navbar-light " style="background: #bb8496">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"> <i class="fa-regular fa-user"></i> Quản lý</a>
            </div>
        </nav>
    </div>
    <div class="row  addProduct" style="padding-top: 60px">
        <div class="col-0 col-md-8 col-lg-8">
        </div>
        <div class="col-0 col-md-2 col-2">
        </div>
        <div><h2 style="text-align: center">CHI TIẾT HÓA ĐƠN</h2></div>
        <table class="table table-striped table-bordered" id="tableStudent"
               style="width:100%;background-color: #b0b0ad">
            <thead style="background-color: #bb8496">
            <tr style="text-align: center">
                <th>Tên khách hàng</th>
                <th>Tên loại bánh</th>
                <th>Số lượng</th>
                <th>Tổng giá sản phẩm</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${receiptList}" var="detailReceipts" varStatus="loop">
            <c:if test="${id==detailReceipts.receipt.id}">
            <tr>
                <td><c:out value="${detailReceipts.receipt.customer.name}"/></td>
                <td><img src="${detailReceipts.cake.picture}" alt="" style="width:80px;border-radius: 20px "> <c:out
                        value="${detailReceipts.cake.name}"/></td>
                <td><c:out value="${detailReceipts.amount}"/></td>
                <td>
                    <c:set var="accountBalance" value="${integerMap.get(detailReceipts.cake.id)*1000}"/>
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${accountBalance}"/> <c:out
                        value="VNĐ"/>
                </td>
            </tr>
            </c:if>
            </c:forEach>
        </table>
    </div>
</div>
<center>
    <div>
        <button type="button" class="btn " data-bs-toggle="modal" data-bs-target="#exampleModal"
                style="background: #bb8496;color: white">
            Giao Hàng
        </button>
    </div>
</center>
<script>
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;
        setTimeout(function () {
            toast.style.display = "none";
        }, 3000);
    }

    window.addEventListener('load', function () {
        showToast("${message}");
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js">
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'ltp',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>
<script>
    function remove(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</body>
</html>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="padding-top: 220px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bảng xác nhận</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" >
                <p style="font-size: 50px;text-align: center"><i class="fa-solid fa-coins"></i></p>
                <br>
                <h5>Đơn hàng này đã được thanh khoản?</h5>
            </div>
            <div class="modal-footer">
                <form action="/detailreceipt">
                    <button type="submit" class="btn " style="background: #bb8496">
                        <input type="text" value="delivery" name="action" hidden>
                        <input type="text" value="${id}" name="id" hidden>
                        <a style="color: white;background: #bb8496"><i class="fa-sharp fa-solid fa-truck"></i></a>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

