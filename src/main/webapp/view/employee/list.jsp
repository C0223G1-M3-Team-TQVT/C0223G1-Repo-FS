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
    <title>Danh sách nhân viên</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <style>
        th{
            color: rgba(21, 19, 19, 0.76);
        }
        td{
            color: rgba(21, 19, 19, 0.76);
        }
    </style>
</head>
<body style="background: white">
<jsp:include page="/header-management.jsp"></jsp:include>
<%--<div class="container-fluid" style="background: white; padding-top: 50px">--%>
<%--    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding-left:70em;padding-top:20px">--%>
<%--            <form method="get" action="/employee">--%>
<%--                <input name="action" value="searchName" hidden>--%>
<%--                <input type="text" name="name" placeholder="Tìm theo tên">--%>
<%--                <button type="submit" class="btn" style="background-color: #bb8496">Tìm</button>--%>
<%--            </form>--%>
<%--        <form class="d-flex" method="get" action="/cake" >--%>
<%--            <input name="action" value="searchName" hidden>--%>
<%--            <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search"--%>
<%--                   name="name">--%>
<%--            <button class="btn" type="submit" style="color: rgba(21,19,19,0.76)"><i class="fa-solid fa-magnifying-glass"--%>
<%--                                                                                    style="color: rgba(21,19,19,0.76);"></i> Tìm--%>
<%--            </button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--        <div class="container-fluid">--%>
<%--            <a class="navbar-brand" href="#"> <i class="fa-regular fa-user"></i> Quản lý</a>--%>
<%--            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                    aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                <span class="navbar-toggler-icon"></span>--%>
<%--            </button>--%>
<%--            <div >--%>
<%--                <form method="get" action="/employee">--%>
<%--                    <input name="action" value="searchName" hidden>--%>
<%--                    <input type="text" name="name" placeholder="Tìm theo tên">--%>
<%--                    <button type="submit" class="btn" style="background-color: #bb8496">Tìm</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>

<div class="row content" style="padding-top: 70px;">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #bb8496">
        <div class="container-fluid" >
<%--            <a class="navbar-brand" href="/cake" style="color: rgba(21,19,19,0.76)"> <i class="fa-regular fa-user"></i>Cake</a>--%>
<%--            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                    aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                <span class="navbar-toggler-icon"></span>--%>
<%--            </button>--%>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding-left:78em;padding-top:20px">
                <form class="d-flex" method="get" action="/employee">
                    <input name="action" value="searchName" hidden>
                    <input type="text" name="name" placeholder="Tìm theo tên">
                    <button class="btn" type="submit" style="color: rgba(21,19,19,0.76)"><i class="fa-solid fa-magnifying-glass"
                                                                                            style="color: rgba(21,19,19,0.76);"></i> Tìm
                    </button>
                </form>
            </div>
        </div>
    </nav>
</div>
<%--    <a href="/employee?action=create">--%>
<%--        <button type="submit" class="btn" style="background-color: #bb8496">Thêm</button>--%>
<%--    </a>--%>
<tr>
    <th colspan="8"><h2 style="text-align: center">QUẢN LÝ NHÂN VIÊN </h2></th>
    <%--        <span id="success"--%>
    <%--              class="thien"--%>
    <%--              style="float: left; background-color: #bb8496;font-size: 15px">${result}</span>--%>
    <c:if test='${result != null}'>
        <center>
            <div id="toastMessage" class="toast"></div>
        </center>
    </c:if>
</tr>
    <div class="btn-group" role="group" aria-label="Basic outlined example">
        <form method="get" action="/employee?">
            <input name="action" value="create" hidden>
            <button type="submit" class="btn btn-dark" style="background-color: #f8b3c7">Thêm mới</button>
        </form>
    </div>
    <table class="table table-bordered" id="tableStudent" style="width:100%;background-color: #b0b0ad">
        <thead style="background-color: #bb8496">
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
                        <button type="submit" class="btn btn-outline-light" style="background-color: #f8b3c7">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-danger"
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
<%--toast--%>
<div class="position-fixed top-0 end-5 p-3" style="z-index:10;margin-left: 500px; margin-top: 50px">
    <div id="liveToast" style="width: 230px; color: white; background:lightgreen ;border-radius:20%/20%;" class="toast"
         role="dialog" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="30px" height="30px">
                <g id="surface1_4_">
                    <path style="fill:#4CAF50;"
                          d="M44,24c0,11.045-8.955,20-20,20S4,35.045,4,24S12.955,4,24,4S44,12.955,44,24z"/>
                    <path style="fill:#CCFF90;"
                          d="M34.602,14.602L21,28.199l-5.602-5.598l-2.797,2.797L21,33.801l16.398-16.402L34.602,14.602z"/>
                </g>
            </svg>
            <span id="toastContent">Nội dung hiển thị</span>
        </div>
    </div>
</div>

<script>
    function displayToast(message, color) {
        document.getElementById("toastContent").innerText = message;
        document.getElementById("liveToast").style.background = color;
        let myAlert = document.getElementById('liveToast');//select id of toast
        let bsAlert = new bootstrap.Toast(myAlert);//inizialize it
        bsAlert.show();//show it
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtp',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("name").innerText = name;
        document.getElementById("id").value = id;
    }
</script>
<c:if test="${param.mess==1}">
    <script>
        displayToast("Thêm mới thành công", "#bb8496")
    </script>
</c:if>
</body>
</html>

