<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <style>

        #success{
            position: fixed;
            right: 1em;
        }
        .son{
            contain: layout ;
            display: flex;
            align-items: center;
            background-color: wheat;
            border-radius: 12px;
            border-left: 16px #a0b4ff;
            min-width: 10em;
            max-width: 17em;
            max-height: 5rem;
            box-shadow: 0 5px 8px rgba(36, 245, 10, 0.08);
            animation: slideInLeft ease 2s, fadeOut linear 1s 2s forwards;
            transition: all linear 0.3s;
        }
        @keyframes slideInLeft {
            from{
                opacity: 0;
                transform: translateX(calc(100% + 1em) );
            }
            to{
                opacity: 1;
                transform: translateX(0);
            }
        }
        @keyframes fadeOut {
            to{
                opacity: 0;
            }
        }

        th{
            color: rgba(21, 19, 19, 0.76);
        }
        td{
            color: rgba(21, 19, 19, 0.76);
        }
    </style>
</head>
<body style="background-color:#4df8f8">
<div class="container-fluid">
    <div class="row header bg-info">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <jsp:include page="/header-login.jsp"></jsp:include>
            </div>
        </nav>
    </div>

    <div class="row content" style="padding-top: 50px;">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #c0ffff">
            <div class="container-fluid" >
                <a class="navbar-brand" href="/cake" style="color: rgba(21,19,19,0.76)"> <i class="fa-regular fa-user"></i>Cake</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent" style="padding-left:70em;padding-top:20px">
                    <form class="d-flex" method="get" action="/cake" >
                        <input name="action" value="find" hidden>
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                               name="name">
                        <button class="btn" type="submit" style="color: rgba(21,19,19,0.76)"><i class="fa-solid fa-magnifying-glass"
                                                                                                style="color: rgba(21,19,19,0.76);"></i> Tìm
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <tr>
        <th colspan="8"><h4 style="text-align: center">QUẢN LÝ SẢN PHẨM </h4></th>
        <span id="success"
              class="son"
              style="float: left; background-color: #bb8496;font-size: 30px">${result}</span>
    </tr>
    <div class="row  addProduct">
        <div class="col-12 col-md-2 col-2 buttonAdd">
            <div class="btn-group" role="group" aria-label="Basic outlined example">
                <form method="get" action="/cake?action">
                    <input name="action" value="create" hidden>
                    <button type="submit" class="btn btn-dark" style="background-color: #5670f5">Thêm mới</button>
                </form>
            </div>
        </div>
        <div class="col-0 col-md-8 col-lg-8">
        </div>
        <div class="col-0 col-md-2 col-2">
        </div>
        <table class="table table-bordered" id="tableStudent" style="width:100%;background-color: #eeede7" >
            <thead style="background-color: #eeede7">
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
<%--                            <img id="img" src="" height="200" alt="Image preview...">--%>
                            <c:out value="${cake.name}"/>
                        </p>
                    </td>
                    <td>
                        <c:out value="${cake.typeOfCake}"/>
                    </td>
                    <td>
                        <c:set var="priceBalance" value="${cake.price*1000}"/>
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${priceBalance}"/>
                        <c:out value="VNĐ"/>
                    </td>
                    <td>
                        <c:out value="${cake.amount}"/>
                    </td>
                    <td>
                        <form method="get">
                            <input name="action" value="update" hidden>
                            <input name="id" value="${cake.id}" hidden>
                            <button type="submit" class="btn btn-dark" style="background-color: #f6c925">Sửa</button>
                        </form>
                    </td>
                    <td>
                        <form>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
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
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background-color:#a8a59b ">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>
                    Bạn có chắc sẽ xóa sản phẩm này?
                <h3 id="nameDelete" style="color: red"></h3>
                <p style="font-family: 'Abel', sans-serif"> CHỨC NĂNG NÀY KHÔNG THỂ HOÀN TÁC </p>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <form method="post" action="/cake?action=delete&id=${cake.id}">
                    <input id="idDelete" name="idDelete" type="hidden">
                    <button type="submit" class="btn btn-primary">Xóa</button>
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
            "dom": 'lrtp',
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
<script>
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
    },3000)
</script>
<%--<script>--%>
<%--    function previewFile() {--%>
<%--        var preview = document.getElementById("img");--%>
<%--        var file   =  document.getElementById("file").files[0];--%>
<%--        var reader  = new FileReader();--%>
<%--        reader.onloadend = function () {--%>
<%--            preview.src = reader.result;--%>
<%--        }--%>
<%--        if (file) {--%>
<%--            reader.readAsDataURL(file);--%>
<%--        } else {--%>
<%--            preview.src = "";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
