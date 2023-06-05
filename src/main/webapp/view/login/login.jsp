<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/3/2023
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>

</head>
<body>


</body>
</html>




<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login & Signup Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                                              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        /* Import Google font - Poppins */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins",
            sans-serif;
        }
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f0faff;
        }
        .wrapper {
            position: relative;
            max-width: 470px;
            width: 100%;
            border-radius: 12px;
            padding: 20px
            30px
            120px;
            background: #306279;
            box-shadow: 0
            5px
            10px
            rgba(
                    0,
                    0,
                    0,
                    0.1
            );
            overflow: hidden;
        }
        .form.login {
            position: absolute;
            left: 50%;
            bottom: -86%;
            transform: translateX(
                    -50%
            );
            width: calc(
                    100% +
                    220px
            );
            padding: 20px
            140px;
            border-radius: 50%;
            height: 100%;
            background: #fff;
            transition: all
            0.6s
            ease;
        }
        .wrapper.active
        .form.login {
            bottom: -15%;
            border-radius: 35%;
            box-shadow: 0 -5px
            10px rgba(0, 0, 0, 0.1);
        }
        .form
        header {
            font-size: 30px;
            text-align: center;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }
        .form.login
        header {
            color: #333;
            opacity: 0.6;
        }
        .wrapper.active
        .form.login
        header {
            opacity: 1;
        }
        .wrapper.active
        .signup
        header {
            opacity: 0.6;
        }
        .wrapper
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 40px;
        }
        form
        input {
            height: 60px;
            outline: none;
            border: none;
            padding: 0
            15px;
            font-size: 16px;
            font-weight: 400;
            color: #333;
            border-radius: 8px;
            background: #fff;
        }
        .form.login
        input {
            border: 1px
            solid
            #aaa;
        }
        .form.login
        input:focus {
            box-shadow: 0
            1px 0
            #ddd;
        }
        form
        .checkbox {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .checkbox
        input[type="checkbox"] {
            height: 16px;
            width: 16px;
            accent-color: #fff;
            cursor: pointer;
        }
        form
        .checkbox
        label {
            cursor: pointer;
            color: #fff;
        }
        form a {
            color: #333;
            text-decoration: none;
        }
        form
        a:hover {
            text-decoration: underline;
        }
        form
        input[type="submit"] {
            margin-top: 15px;
            padding: 0px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
        }
        .form.login
        input[type="submit"] {
            background: #306279;
            color: #fff;
            border: none;
        }
    </style>
</head>
<body>
<section class="wrapper" style="box-shadow: 6px 6px 6px 6px #171515">
    <div class="form signup">
        <header>Đăng nhập</header>
        <c:if test='${message != null}'>
            <div class="alert alert-info alert-dismissible" style="position: relative;margin-top: 30px;">
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>  <span style="color: #8f2e2e" class="message">${message}</span></strong>
            </div>
        </c:if>
        <form action="/bakery?action=login" method="post">
            <input type="text" placeholder="Số điện thoại" name="taikhoan" pattern="[0-9]{1,}" title="Vui lòng nhập đúng tài khoản"/>
            <input type="password" placeholder="Mật khẩu" name="matkhau" pattern="[/W]{6,}[a-zA-Z]{1,}" title="Mật khẩu cần nhiều hơn 6 kí tự và phải có chữ ở cuối"/>
            <div class="checkbox">
                <input type="checkbox" id="signupCheck" />
                <label for="signupCheck">Lưu mật khẩu</label>
            </div>
            <input type="submit" value="Login" />
        </form>
    </div >
    <div class="form login">
        <header>Đăng kí</header>
        <form action="/bakery?action=register" method="post">
            <input type="text" placeholder="Số điện thoại" name="taikhoan1" pattern="[0-9]{1,}" title="Bạn cần phải nhập đúng định dạng tài khoản"/>
            <input type="password" placeholder="Mật khẩu" name="matkhau1" pattern="[a-zA-Z0-9]{6,}[a-zA-Z]" title="Mật khẩu cần nhiều hơn 6 kí tự và phải có chữ ở cuối"/>
            <input type="submit" value="Đăng kí" />
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script>
        const wrapper = document.querySelector(".wrapper"),
            signupHeader = document.querySelector(".signup header"),
            loginHeader = document.querySelector(".login header");

        loginHeader.addEventListener("click", () => {
            wrapper.classList.add("active");
        });
        signupHeader.addEventListener("click", () => {
            wrapper.classList.remove("active");
        });
    </script>
</section>

</body>
</html>