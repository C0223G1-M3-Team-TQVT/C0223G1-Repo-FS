<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 6/3/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>

</head>
<body style="background: #bb8496">
<jsp:include page="/header.jsp"></jsp:include>
<div class="container-fluid" style="background: #bb8496; padding-top: 50px" >
    <a href="/employee?action=create">
        <button type="submit" style="color: black" class="btn btn-primary btn-outline-success">Thêm</button>
    </a>
    <table id="tableEmployee" style="color: whitesmoke" class="table table-striped table-bordered col-lg-12">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Căn cước công dân</th>
            <th>Số điện thoại</th>
            <th>Địa Chỉ</th>
            <th>Chức vụ</th>
            <th>Sửa</th>
            <th>Xoá</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>
                    <c:out value="${employee.id}"/>
                </td>
                <td>
                    <c:out value="${employee.name}"/>
                </td>
                <td>
                    <c:out value="${employee.citizenId}"/>
                </td>
                <td>
                    <c:out value="${employee.phoneNumber}"/>
                </td>
                <td>
                    <c:out value="${employee.address}"/>
                </td>
                <td>
                    <c:out value="${employee.position.name}"/>
                </td>
                <td>
                    <a href="/employee?action=update&id=${employee.id}">
                        <button type="submit" style="color: black" class="btn btn-warning ">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" style="color: black" class="btn btn-danger"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="remove(${employee.id},'${employee.name}')">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--Modal--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa nhân viên</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Bạn có chắc chắn xóa nhân viên có tên:
                    <span style="color:red" id="name"></span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/employee?action=delete" method="post">
                    <input type="hidden" name="id" id="id">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("name").innerText = name;
        document.getElementById("id").value = id;
    }
</script>
</body>
</html>

