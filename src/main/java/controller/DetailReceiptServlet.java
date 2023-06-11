package controller;

import model.DetailReceipt;
import model.Receipt;
import service.IDetailReceiptService;
import service.IReceiptService;
import service.impl.DetailReceiptService;
import service.impl.ReceiptService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DetailReceiptServlet", value = "/detailreceipt")
public class DetailReceiptServlet extends HttpServlet {
    private IDetailReceiptService iDetailReceiptService = new DetailReceiptService();
    private IReceiptService receiptService = new ReceiptService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                detailForm(request, response);
                break;
            case "delivery":
                delivery(request, response);
                break;
            case "delete":
                deleteFormDetail(request, response);
                break;
            default:
                showList(request, response);
                request.setCharacterEncoding("UTF-8");
                break;
        }
    }

    private void deleteFormDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteReceipt"));
        boolean check = receiptService.deleteRecript(id);
        if (check) {
            request.setAttribute("message", "Xóa thành công");
        } else {
            request.setAttribute("message", "Xóa thất bại");
        }
        showList(request, response);
    }

    private void delivery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt((request.getParameter("id")));
        request.setAttribute("id", id);
        boolean check = iDetailReceiptService.UpdateCondition(id);
        if (check) {
            request.setAttribute("message", "Giao hàng thành công");
        } else {
            request.setAttribute("message", "Đơn hàng này đã được giao");
        }
        showList(request, response);
    }

    private void detailForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Integer, Integer> integerMap = iDetailReceiptService.getMoney();
        request.setAttribute("integerMap", integerMap);
        boolean check = Boolean.parseBoolean(request.getParameter("delivery"));
        request.setAttribute("check", check);
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        List<DetailReceipt> receiptList = iDetailReceiptService.getAll();
        request.setAttribute("receiptList", receiptList);
        request.getRequestDispatcher("view/recript/detail.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Receipt> receipts = receiptService.showListReceipt();
        Map<Integer, Integer> integerMap = iDetailReceiptService.getPriceAll();
        request.setAttribute("integerMap", integerMap);
        request.setAttribute("receipts", receipts);
        try {
            request.getRequestDispatcher("view/recript/recript.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                String tinhTrang = request.getParameter("tinhTrang");
                Map<Integer, Integer> integerMap = iDetailReceiptService.getPriceAll();
                request.setAttribute("integerMap", integerMap);
                List<Receipt> detailReceipts = receiptService.searchReceipt(tinhTrang);
                request.setAttribute("receipts", detailReceipts);
                request.getRequestDispatcher("view/recript/recript.jsp").forward(request, response);
                break;

        }
    }

}
