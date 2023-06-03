<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/3/2023
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .gradient-custom-2 {
            background: #fccb90;
            background: -webkit-linear-gradient(to right, #bd6490, #c0568a, #b65d7e, #a6538d);
            background: linear-gradient(to right, #c291a7, #c291a7, #c291a7, #c291a7);
        }

        @media (max-width: 500px) {
            .gradient-form {
                height: 100vh !important;
            }
        }

        @media (max-width: 500px) {
            .gradient-custom-2 {
                border-top-right-radius: .3rem;
                border-bottom-right-radius: .3rem;
            }
        }
    </style>
</head>
<body style="background-color: #f5f1f1;">
<section class="h-100 gradient-form">
    <div class="container py-3 h-100">
        <div class="row d-flex justify-content-center align-items-center h-90">
            <div class="col-xl-10">
                <div class="card  text-black "
                     style="border-top-right-radius: 30px;border-bottom-left-radius: 30px ;box-shadow: 6px 6px 6px 6px #171515">
                    <div class="row g-0 b">
                        <div class="col-lg-6 b">
                            <div class="card-body p-md-5 mx-md-4 b">
                                <div class="text-center">
                                    <img src="../giao_dien/Screenshot 2023-05-29 093831.png"
                                         style="width: 185px;border-radius: 50%" alt="logo">
                                    <h4 class="mt-1 mb-5 pb-1">We are TQTV Team</h4>
                                </div>
                                <div >
                                    <c:if test='${message != null}'>
                                        <span style="color: #790000" class="message">${message}</span>
                                    </c:if>
                                </div>
                                <form method="post" action="/bakery?action=login">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example11">Tài Khoản</label>
                                        <input type="text" id="form2Example11" class="form-control"
                                               placeholder="Số điện thoại" name="taikhoan"/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example22">Mật khẩu</label>
                                        <input type="password" id="form2Example22" class="form-control" name="matkhau"/>

                                    </div>
                                    <div class="text-center pt-1 mb-5 pb-1 ">
                                        <button
                                                class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3 container"
                                                type="submit">
                                            Đăng nhập
                                        </button>
                                        <div style="text-align: left">
                                            <input type="checkbox" id="luu">
                                            <label for="luu" class="text-muted">Lưu tài khoản</label>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Bạn chưa có tài khoản?</p>
                                        <button type="button" class="btn btn-outline-danger">Tạo mới</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2"
                             style="border-top-right-radius: 30px">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4" style="position: absolute">
                                <h4 class="mb-4">We are more than just a company</h4>
                                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                    eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
