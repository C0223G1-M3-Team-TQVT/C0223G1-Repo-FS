<%@ page import="model.Receipt" %>
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/4/2023
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
<style>
    .toast {
        background-color: #bb8496;
        color: #fff;
        padding: 15px;
        border-radius: 20px;
        position: fixed;
        bottom:530px;
        right: 30px;
        z-index: 1;
        display: none;
    }
</style>
</head>
<body>
<div>
    <div class="row header bg-info">
        <nav    >
            <div class="container-fluid">
                <jsp:include page="/header-login.jsp"></jsp:include>
            </div>
        </nav>
    </div>
    <div class="row content" style="padding-top: 50px">
        <c:if test='${message != null}'>
            <center>
                <div id="toastMessage" class="toast"></div>
            </center>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-light"  style="background: #bb8496">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"> <i class="fa-regular fa-user"></i> Quản lý</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div>
                    <form action="/detailreceipt?action=search" name="tinhTrang" method="post">
                        <select style="border-radius: 30px" name="tinhTrang" id="tinhTrang">
                            <option value="">Tìm kiếm</option>
                            <option value="1">Đã giao</option>
                            <option value="0">Chưa giao</option>
                        </select>
                        <button style="border-radius: 50%" type="submit"><i class="fa-solid fa-magnifying-glass" style="color: #2bac1b;"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row  addProduct" style="padding-top: 60px">
        <div class="col-0 col-md-8 col-lg-8">
        </div>
        <div class="col-0 col-md-2 col-2">
        </div>
        <div><h2 style="text-align: center">QUẢN LÝ HÓA ĐƠN </h2></div>
        <div class="col-lg-12">
            <table class="table table-striped table-bordered col-lg-12" id="tableStudent" style="width:100%">
                <thead >
                <tr >
                    <th >STT</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Ngày đặt hàng</th>
                    <th>Tình trạng</th>
                    <th>Tổng giá</th>
                    <th style="text-align: center">Chi tiết</th>
                    <th style="text-align: center">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${receipts}" var="receipts" varStatus="loop">
                    <tr >
                        <td><c:out value="${loop.count}"/></td>
                        <td><c:out value="${receipts.customer.name}"/></td>
                        <td><c:out value="${receipts.customer.phoneNumber}"/></td>
                        <td>

                            <c:out value="${receipts.date.getDayOfMonth()}"/>/<c:out
                                value="${receipts.date.getMonthValue()}"/>/<c:out value="${receipts.date.getYear()}"/>
                            <c:out value="${receipts.date.toLocalTime()}"/>
                        </td>
                        <td><c:if test="${receipts.status=='false'}"><c:out value="Chưa giao"/></c:if>
                            <c:if test="${receipts.status=='true'}"><c:out value="Đã giao"/></c:if>
                        </td>
                        <td>
                                <c:set var="accountBalance" value="${integerMap.get(receipts.id)*1000}"/>
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${accountBalance}"/>
                                <c:out value="VNĐ"/>
                        <td>
                            <center>
                                <button class="btn " type="submit" style="background: #bb8496;color: white">
                                    <a style="color: #ffffff" href="/detailreceipt?action=detail&id=${receipts.id}">
                                        <i class="fa-solid fa-circle-info"></i></a>
                                </button>
                            </center>
                        </td>
                        <td>
                            <center>
                                <button onclick="deleteReceipt(${receipts.id},'${receipts.customer.name}',${receipts.customer.phoneNumber})"
                                        type="button" class="btn " data-bs-toggle="modal"
                                        data-bs-target="#exampleModal1" style="background: #bb8496;color: white">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </center>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog " style="padding-top: 220px">
        <div class="modal-content" >
            <center>
            <div class="modal-header" style="background: #bb8496">
                <h5 class="modal-title" id="exampleModalLabel1">Thông tin khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            </center>
            <div class="modal-body">
              <span >Bạn có muốn xóa khách hàng</span>  <h6 style="color: #b02a37" id="name"></h6>có số điện thoại là <h6 id="sdt"></h6>
            </div>
            <div class="modal-footer">
                <form action="/detailreceipt" method="get">
                    <input name="action" value="delete" hidden>
                    <input type="text" name="deleteReceipt" id="deleteReceipt" hidden>
                    <button type="submit" class="btn " style="background:#bb8496 "><i class="fa-solid fa-trash" ></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function showToast(message) {
        var toast = document.getElementById("toastMessage");
        toast.style.display = "block";
        toast.innerText = message;
        setTimeout(function() {
            toast.style.display = "none";
        }, 3000);
    }
    window.addEventListener('load', function() {
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
    function deleteReceipt(id, name, sdt) {
        document.getElementById("deleteReceipt").value = id;
        document.getElementById("name").innerText = name;
       document.getElementById("sdt").innerText = sdt;
    }

    function remove(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'ltp',
            "lengthChange": false,
            "pageLength": 4
        })
    })
</script>
</body>
</html>































