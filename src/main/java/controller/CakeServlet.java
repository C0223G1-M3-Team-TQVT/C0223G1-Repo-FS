package controller;

import model.Cake;
import model.TypeOfCake;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.ICakeService;
import service.ITypeOfCakeService;
import service.impl.CakeService;
import service.impl.TypeOfCakeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CakeServlet", value = "/cake")
public class CakeServlet extends HttpServlet {
    ICakeService cakeService = new CakeService();
    ITypeOfCakeService typeOfCakeService = new TypeOfCakeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "find":
                String name = request.getParameter("name");
                List<Cake> cakeList1 = cakeService.findByName(name);
                showListCake(request, response, cakeList1);
                break;
            default:
                List<Cake> cakeList = cakeService.display();
                String result = "Chào bạn";
                request.setAttribute("result", result);
                showListCake(request, response, cakeList);
                break;
        }
    }

    private void showListCake(HttpServletRequest request, HttpServletResponse response, List<Cake> cakeList) {

        request.setAttribute("cakeList", cakeList);
        try {
            request.getRequestDispatcher("view/cake/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.getRequestDispatcher("view/cake/delete.jsp").forward(request, response);
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cake cake = null;
        for (Cake c : cakeService.display()) {
            if (c.getId() == id) {
                cake = c;
                break;
            }
        }
        List<TypeOfCake> typeOfCakeList = typeOfCakeService.display();
        List<Cake> cakeList = cakeService.display();
        request.setAttribute("cakeList", cakeList);
        request.setAttribute("typeOfCakeList", typeOfCakeList);
        request.setAttribute("cake", cake);
        request.getRequestDispatcher("view/cake/update.jsp").forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TypeOfCake> typeOfCakeList = typeOfCakeService.display();
        request.setAttribute("typeOfCakeList", typeOfCakeList);
        request.getRequestDispatcher("view/cake/create.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                createCake2(request, response);
                createCake(request, response);
                break;
            case "update":
                updateCake(request, response);
                break;
            case "delete":
                deleteCake(request, response);
                break;
        }
    }

    private void createCake2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id, String name, int typeOfCake, double price, int amount, String picture
//        String name = request.getParameter("name");
//        int typeOfCake = Integer.parseInt(request.getParameter("typeOfCake"));
//        double price = Double.parseDouble(request.getParameter("price"));
//        int amount = Integer.parseInt(request.getParameter("amount"));
//        String picture = request.getParameter("picture");
        String name = null;
        int typeOfCake = 0;
        double price = 0;
        int amount = 0;
        String picture = null;
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                // Nếu là trường dữ liệu ( không phải là file)
                if (fileItem.isFormField()) {
                    switch (fileItem.getFieldName()) {
                        case "name":
                            name = fileItem.getString();
                            break;
                        case "typeOfCake":
                            typeOfCake = Integer.parseInt(fileItem.getString());
                            break;
                        case "price":
                            price = Double.parseDouble(fileItem.getString());
                            break;
                        case "amount":
                            amount = Integer.parseInt(fileItem.getString());
                            break;
                    }
                    System.out.println(fileItem.getFieldName() + " : " + fileItem.getString());
                } else {
                    // Nêu không phải là trường dữ liêu => xử lý file
                    String fileName = fileItem.getName();
                    if (!fileName.equals("")) {
                        // tạo thư mục tên "upload-photo" ở trên server để lưu trữ file
                        String dirUrl = request.getServletContext()
                                .getRealPath("") + "upload-photo";
//                                    .getRealPath("") + File.separator + "files";
                        File dir = new File(dirUrl);
                        if (!dir.exists()) {
                            dir.mkdir();
                        }
                        String fileImg = dirUrl + File.separator + fileName;
                        File file = new File(fileImg);
                        try {
                            fileItem.write(file);
                            picture = dirUrl + File.separator + fileName;
                            System.out.println("--------------------------------");
                            System.out.println("UPLOAD SUCCESS...!");
                            System.out.println("DUONG DAN KIEM TRA UPLOAD HINH ANH : \n" + picture);
                            System.out.println("----------------------------------");
                        } catch (Exception e) {
                            System.out.println("ERROR IN UPLOAD!");
                            e.printStackTrace();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        Cake cake = new Cake(name, typeOfCake, price, amount, picture);
//        boolean flag = cakeService.add(cake);
//        String result = "";
//        if (flag) {
//            result = "Thêm mới thành công";
//            request.setAttribute("result", result);
//            List<Cake> cakeList3 = cakeService.display();
//            showListCake(request, response, cakeList3);
//        } else {
//            result = "Thêm mới không thành công";
//            request.setAttribute("result", result);
//            showFormCreate(request, response);
//        }
        System.out.println("-------------------------INFO TO SAVE-- ------------------------------");
        System.out.println("Name: " + name);
        System.out.println("typeOfCake : " + typeOfCake);
        System.out.println("Price : " + price);
        System.out.println("Amount: " + amount);
        System.out.println("UrlPicture : " + picture);
        System.out.println("------------------------------------ ------------------------------");
    }

    private void deleteCake(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        boolean flag = cakeService.delete(id);
        String result = "";
        if (flag) {
            result = "Xóa thành công";
            request.setAttribute("result", result);
            List<Cake> cakeList2 = cakeService.display();
            showListCake(request, response, cakeList2);
        } else {
            result = "Xóa không thành công";
            request.setAttribute("result", result);
            showFormCreate(request, response);
        }
    }

    private void updateCake(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int typeOfCake = Integer.parseInt(request.getParameter("typeOfCake"));
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String picture = request.getParameter("picture");
        Cake cake = new Cake(name, typeOfCake, price, amount, picture);
        boolean flag = cakeService.edit(id, cake);
        String result = "";
        if (flag) {
            result = "Chỉnh sửa thành công";
            request.setAttribute("result", result);
            List<Cake> cakeList4 = cakeService.display();
            showListCake(request, response, cakeList4);
        } else {
            request.setAttribute("result", result);
            result = "Chỉnh sửa không thành công không thành công";
            showFormCreate(request, response);
        }
    }

    private void createCake(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int typeOfCake = Integer.parseInt(request.getParameter("typeOfCake"));
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String picture = request.getParameter("picture");
        Cake cake = new Cake(name, typeOfCake, price, amount, picture);
        boolean flag = cakeService.add(cake);
        String result = "";
        if (flag) {
            result = "Thêm mới thành công";
            request.setAttribute("result", result);
            List<Cake> cakeList3 = cakeService.display();
            showListCake(request, response, cakeList3);
        } else {
            result = "Thêm mới không thành công";
            request.setAttribute("result", result);
            showFormCreate(request, response);
        }
    }
}
