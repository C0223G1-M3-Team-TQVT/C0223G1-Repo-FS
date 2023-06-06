<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row header bg-info">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <div class="col-12 col-md-4">
                    <a> <i class="fa-regular fa-user"></i> Quản lý</a>
                </div>
                <div class="col-12 col-md-4">
                    <a class="navbar-brand" href="#">
                        <img src="../../Screenshot 2023-05-29 093831.png" height="5px" width="100p  x" alt="Logo"
                             width="30" height="30" class="d-inline-block align-text-top">
                    </a>
                </div>
                <div class="col-12 col-md-4" style="text-align: right">
                    <div class="btn-group" role="group">
                        <a href="/index.jsp" style="color: #171515"> Trở lại trang chủ</a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <div class="row content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"> <i class="fa-regular fa-user"></i> ADMIN</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Tìm kiếm theo
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">ID</a></li>
                                <li><a class="dropdown-item" href="#">Số lượng</a></li>
                                <li><a class="dropdown-item" href="#">Giá(tăng dần)</a></li>
                                <li><a class="dropdown-item" href="#">Giá(giảm dần)</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Ngẫu nhiên</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"
                                                                                 style="color: #2bac1b;"></i> Tìm
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row  addProduct">
        <div class="col-0 col-md-8 col-lg-8">
        </div>
        <div class="col-0 col-md-2 col-2">
        </div>
        <table class="table table-striped table-bordered" id="tableStudent" style="width:100%">
            <thead>
            <tr>
                <th colspan="4"><h2 style="text-align: center">QUẢN LÝ CHI TIẾT </h2></th>
            </tr>
            <tr>
                <th>Tên khách hàng</th>
                <th>Tên loại bánh</th>
                <th>Số lượng</th>
                <th>Tổng sản phẩm</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${receiptList}" var="detailReceipts" varStatus="loop">
                <c:if test="${id==detailReceipts.receipt.id}">
                    <tr>
                        <td><c:out value="${detailReceipts.receipt.customer.name}"/></td>
                        <td><c:out value="${detailReceipts.cake.name}"/></td>
                        <td><c:out value="${detailReceipts.amount}"/></td>
                        <td><c:out value="${detailReceipts.cake.price*detailReceipts.amount}"/></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
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
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
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
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Xác nhận thanh toán
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" >Bảng xác nhận</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h2>Bạn có muốn giao đơn hàng này không?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <form action="/detailreceipt?action=delivery&id=${id}" method="post">
                <button type="submit" class="btn btn-primary">
                    <a style="color: white" >Giao hàng</a>
                </button>
                </form>
            </div>
        </div>
    </div>
</div>

