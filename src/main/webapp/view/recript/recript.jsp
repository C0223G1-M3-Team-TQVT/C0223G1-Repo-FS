<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/4/2023
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<div >
    <div class="row header bg-info">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <div class="col-12 col-md-4">
                    <a> <i class="fa-regular fa-user"></i>admin</a>
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
        <div class="col-lg-12">
            <table class="table table-striped table-bordered" id="tableStudent" style="width:100% ; float: right;">
                <thead>
                <tr>
                    <th colspan="8"><h2 style="text-align: center">QUẢN LÝ HÓA ĐƠN </h2></th>
                </tr>
                <tr>
                    <th>STT</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Ngày đặt hàng</th>
                    <th>Tình trạng</th>
                    <th>Tổng giá</th>
                    <th>Chi tiết</th>
                    <th>Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${receipts}" var="receipts" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}"/></td>
                        <td><c:out value="${receipts.customer.name}"/></td>
                        <td><c:out value="${receipts.customer.phoneNumber}"/></td>
                        <td><c:out value="${receipts.date}"/></td>

                        <td><c:if test="${receipts.condition=='false'}"><c:out value="Chưa giao"/></c:if>
                            <c:if test="${receipts.condition=='true'}"><c:out value="Đã giao"/></c:if>
                        </td>
                        <td><c:out value="${integerMap.get(receipts.id)} VNĐ"/></td>
                        <td>
                            <button type="submit" class="btn">
                                <a style="color: #283edc" href="/detailreceipt?action=detail&id=${receipts.id}">Chi
                                    tiết</a>
                            </button>
                        </td>
                        <td><a type="submit" href="/detailreceipt?action=delete&id=${receipts.id}">delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
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
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
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



































