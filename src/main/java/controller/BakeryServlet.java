package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BakeryServlet", value = "/bakery")
public class BakeryServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "login":
                loginFormEmployee(request, response);
                break;
            default:
                listUser(request, response);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = iUserService.getUser();
        request.setAttribute("user", userList);

    }

    private void loginFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taiKhoan = request.getParameter("taikhoan1");
        String matKhau = request.getParameter("matkhau1");
        boolean check = iUserService.checkUser(new User(taiKhoan, matKhau));
        if (check) {
            request.setAttribute("message", "Thêm tài khoản thành công");
            request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
            iUserService.addUser(new User(taiKhoan, matKhau));
            response.sendRedirect("/bakery");
        } else {
            request.setAttribute("message", "Tài khoản này đã có hoặc chưa đăng kí số điện thoại này");
            request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taiKhoan = request.getParameter("taikhoan");
        String matKhau = request.getParameter("matkhau");
        if (matKhau == null) {
            matKhau = "";
        }
        boolean check = iUserService.findUser(new User(taiKhoan, matKhau));
        if (check) {
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("message", "Tài khoản hoặc mật khẩu sai,vui lòng nhập lại");
            try {
                request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
    }
}
