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
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
            padding: 20px 30px 120px;
            background: #bb8496;
            box-shadow: 0 5px 10px rgba(
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
            padding: 20px 140px;
            border-radius: 50%;
            height: 100%;
            background: #fff;
            transition: all 0.6s ease;
        }

        .wrapper.active
        .form.login {
            bottom: -15%;
            border-radius: 35%;
            box-shadow: 0 -5px 10px rgba(0, 0, 0, 0.1);
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
            padding: 0 15px;
            font-size: 16px;
            font-weight: 400;
            color: #333;
            border-radius: 8px;
            background: #fff;
        }

        .form.login
        input {
            border: 1px solid #aaa;
        }

        .form.login
        input:focus {
            box-shadow: 0 1px 0 #ddd;
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

        .toast {
            background-color: #bb8496;
            color: #fff;
            padding: 15px;
            border-radius: 20px;
            position: fixed;
            bottom: 530px;
            right: 30px;
            z-index: 1;
            display: none;
        }

    </style>
</head>
<body>
<div>

</div>
<section class="wrapper" style="box-shadow: 6px 6px 6px 6px #171515;position: absolute">
    <div class="form signup">
        <header>Đăng nhập</header>
        <form action="/bakery?action=login" method="post">
            <c:if test='${message != null}'>
                <div id="toastMessage" class="toast"></div>
            </c:if>
            <input id="dangnhaptaikhoan" type="text" placeholder="Số điện thoại" name="taikhoan" pattern="[0-9]{1,}" required
                   />
            <input id="dangnhapmatkhau" type="password" placeholder="Mật khẩu" name="matkhau" pattern="[a-zA-Z0-9]{6,}[a-zA-Z]{1,}" required
                  />
            <div class="checkbox">
                <input type="checkbox" id="signupCheck"/>
                <label for="signupCheck">Lưu mật khẩu</label>
            </div>
            <input type="submit" value="Login"/>
        </form>
    </div>
    <div class="form login">
        <header>Đăng kí</header>
        <form action="/bakery?action=register" method="post">
            <input id="dangkitaikhoan" type="text" placeholder="Số điện thoại" name="taikhoan1" pattern="[0-9]{1,}" required
                   />
            <input id="dangkimatkhau" type="password" placeholder="Mật khẩu" name="matkhau1" pattern="[a-zA-Z0-9]{6,}[a-zA-Z]{1,}" required
                  />
            <input type="submit" value="Đăng kí"/>
        </form>
    </div>
    <script>
        var inputtaikhoan=document.getElementById("dangnhaptaikhoan");
        input.oninvalid = function(event) {
            event.target.setCustomValidity('Vui lòng nhập đúng định dạng số điện thoại');
        }
        var inputmatkhau=document.getElementById("dangnhapmatkhau");
        inputregister.oninvalid = function(event) {
            event.target.setCustomValidity('Mật khẩu phải hơn 6 kí tự và phải có chữ ở cuối')
        };
    </script>
    <script>
        var input=document.getElementById("dangkitaikhoan");
        input.oninvalid = function(event) {
            event.target.setCustomValidity('Vui lòng nhập đúng định dạng số điện thoại');
        }
        var inputregister=document.getElementById("dangkimatkhau");
        inputregister.oninvalid = function(event) {
            event.target.setCustomValidity('Mật khẩu phải hơn 6 kí tự và phải có chữ ở cuối')
        };
    </script>
    <script>
        function showToast(message) {
            var toast = document.getElementById("toastMessage");
            toast.style.display = "block";
            toast.innerText = message;
            setTimeout(function () {
                toast.style.display = "none";
            }, 3000);
        }

        window.addEventListener('load', function () {
            showToast("${message}");
        });
    </script>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</section>

</body>
</html>