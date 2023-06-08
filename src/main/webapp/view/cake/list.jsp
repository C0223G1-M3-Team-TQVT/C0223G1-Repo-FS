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
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div class="container-fluid">
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
                <a class="navbar-brand" href="/cake"> <i class="fa-regular fa-user"></i>Cake</a>
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
                                Sắp xếp theo
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Giá(tăng dần)</a></li>
                                <li><a class="dropdown-item" href="#">Giá(giảm dần)</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Số lượng</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex" method="get" action="/cake">
                        <input name="action" value="find" hidden>
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="name">
                        <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"
                                                                                 style="color: #2bac1b;"></i> Tìm
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <tr>
        <th colspan="8"> <h4 style="text-align: center">QUẢN LÝ SẢN PHẨM </h4></th>
        <span>${result}</span>
    </tr>
    <div class="row  addProduct">
        <div class="col-12 col-md-2 col-2 buttonAdd">
            <div class="btn-group" role="group" aria-label="Basic outlined example">
                <form method="get" action="/cake?action">
                    <input name="action" value="create" hidden>
                    <button type="submit" class="btn btn-outline-primary">Thêm mới</button>
                </form>
            </div>
        </div>
        <div class="col-0 col-md-8 col-lg-8">
        </div>
        <div class="col-0 col-md-2 col-2">
        </div>
        <table class="table table-striped table-bordered" id="tableStudent" style="width:100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Name</th>
                <th>Mã loại bánh</th>
                <th>Giá</th>
                <th>Số lượng hiện có</th>
                <th>Sửa</th>
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cakeList}" var="cake">
                <tr>
                    <td>
                        <c:out value="${cake.id}"/>
                    </td>
                    <td>
                        <p>
                                <img src="${cake.picture}" width="100px" height="100px">
                                <c:out value="${cake.name}"/>
                        </p>
                    </td>
                    <td>
                        <c:out value="${cake.typeOfCake}"/>
                    </td>
                    <td>
                        <c:out value="${cake.price}"/>
                    </td>
                    <td>
                        <c:out value="${cake.amount}"/>
                    </td>
                    <td>
                        <form method="get">
                            <input name="action" value="update" hidden>
                            <input name="id" value="${cake.id}" hidden>
                            <button type="submit" class="btn btn-outline-primary">Sửa</button>
                        </form>
                    </td>
                    <td>
                        <form>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"
                                    onclick="remove('${cake.id}','${cake.name}')"
                            >Xóa
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%--modal--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>
                    Bạn có chắc sẽ xóa sản phẩm này?
                <h3 id="nameDelete"></h3>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <form method="post" action="/cake?action=delete&id=${cake.id}">
                    <input id="idDelete" name="idDelete" type="hidden">
                    <button type="submit" class="btn btn-primary">Xoa</button>
                </form>
            </div>
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
