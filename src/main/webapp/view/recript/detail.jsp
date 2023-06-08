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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
        <div><h2 style="text-align: center">CHI TIẾT HÓA ĐƠN</h2></div>
        <table class="table table-striped table-bordered" id="tableStudent" style="width:100%">
            <thead>
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
                <td>
                    <c:set var="accountBalance" value="${integerMap.get(detailReceipts.cake.id)*1000 }"/>
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${accountBalance}"/>
                </td>
            </tr>
            </c:if>
            </c:forEach>
        </table>
    </div>
</div>
<center>
    <div>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Xác nhận thanh toán
        </button>
    </div>
</center>
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


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bảng xác nhận</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h2>Bạn có muốn giao đơn hàng này không?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <form action="/detailreceipt?action=delivery&id=${id}" method="post">
                    <button type="submit" class="btn btn-primary">
                        <a style="color: white">Giao hàng</a>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

