package controller;

import model.*;
import service.IReceiptService;
import service.impl.ReceiptService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReceiptServlet", value = "/receipt-servlet")
public class ReceiptServlet extends HttpServlet {
    IReceiptService receiptService = new ReceiptService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "order":
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                List<Cake> list = receiptService.showListCakeOrder();
                request.setAttribute("list", list);
                RequestDispatcher rd = request.getRequestDispatcher("view/order/order.jsp");
                rd.forward(request, response);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "order":
                List<DetailReceipt> detailReceiptList = new ArrayList<>();
                for (int i = 1; i <= receiptService.showListCakeOrder().size(); i++) {
                    if (request.getParameter(String.valueOf(i)) != null) {
                        int amount = Integer.parseInt(request.getParameter(String.valueOf(i)));
                        detailReceiptList.add(new DetailReceipt(amount, new Cake(i)));

                    }
                }
                String name = request.getParameter("name");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                String describe = request.getParameter("describe");
                Receipt receipt = new Receipt(new Customer(name, phoneNumber), new Employee(2), address, describe);
                receiptService.addReceipt(detailReceiptList, receipt);
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }
}
