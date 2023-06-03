package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
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

        }
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

                break;

        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taiKhoan = request.getParameter("taikhoan");
        String matKhau = request.getParameter("matkhau");
        boolean check= iUserService.findUser(new User(taiKhoan,matKhau));
        if (check){
            response.sendRedirect("index.jsp");
        }else {
//            String message
            response.sendRedirect("view/login/login.jsp");
        }
    }
}
