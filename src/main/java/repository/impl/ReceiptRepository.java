package repository.impl;

import javafx.util.converter.LocalDateTimeStringConverter;
import model.*;
import repository.BaseRepository;
import repository.IReceiptRepository;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class ReceiptRepository implements IReceiptRepository {
    private static String DISPLAY = "select * from banh";
    private static String ADD = "insert into hoa_don(ma_khach_hang,ma_nhan_vien,ngay_dat_hang,dia_chi_giao_hang,trang_thai,mo_ta) value(?,?,?,?,?,?)";
    private final String RECEIPT_SELECT = "select * from hoa_don hd " +
            "join khach_hang kh " +
            "on hd.ma_khach_hang=kh.ma_khach_hang " +
            "join nhan_vien nv " +
            "on nv.ma_nhan_vien=hd.ma_nhan_vien;";


    @Override
    public List<Cake> showListCakeOrder() {
        Connection connection = BaseRepository.getConnection();
        List<Cake> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(DISPLAY);
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_banh");
                String name = resultSet.getString("ten_banh");
                int typeOfCake = resultSet.getInt("ma_loai_banh");
                double price = resultSet.getDouble("gia");
                int amount = resultSet.getInt("so_luong_hien_co");
                String picture = resultSet.getString("anh_banh");
                if (picture == null) {
                    picture = "";
                }
                list.add(new Cake(id, name, typeOfCake, price, amount, picture));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public List<Receipt> showListReceipt() {
        List<Receipt> receiptList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(RECEIPT_SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("hd.ma_hoa_don");
                int maKhach = resultSet.getInt("kh.ma_khach_hang");
                String tenKhachHang = resultSet.getString("kh.ten_khach_hang");
                int maNhanVien = resultSet.getInt("nv.ma_nhan_vien");
                String tenNhanVien = resultSet.getString("nv.ten_nhan_vien");
                String check = resultSet.getString("hd.ngay_dat_hang");
                String sdt = resultSet.getString("kh.sdt");
                LocalDate check1 = LocalDate.parse(check.substring(0, 10));
                LocalTime check2 = LocalTime.parse(check.substring(11, 19));
                LocalDateTime ngayDatHang = LocalDateTime.of(check1, check2);
                String diaChi = resultSet.getString("dia_chi_giao_hang");
                Employee employee = new Employee(tenNhanVien, maNhanVien);
                Customer customer = new Customer(tenKhachHang, maKhach, sdt);
                receiptList.add(new Receipt(id, customer, employee, ngayDatHang, diaChi));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return receiptList;
    }

    @Override
    public void addReceipt(List<DetailReceipt> list, Receipt receipt) {
        Connection connection = BaseRepository.getConnection();
        LocalDateTime localDateTime = LocalDateTime.now();
        String time1 = String.valueOf(localDateTime);
        String time = time1.substring(0, 10) + " " + time1.substring(11, 19);
        System.out.println(time1);
        System.out.println(time);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            int id = checkCustomer(receipt.getCustomer());
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, receipt.getEmployee().getId());
            preparedStatement.setString(3, time);
            preparedStatement.setString(4, receipt.getAddress());
            preparedStatement.setBoolean(5, false);
            preparedStatement.setString(6, receipt.getDescribe());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        Receipt receipt1 = new Receipt(getIdReceipt(time));
        for (int i = 0; i < list.size(); i++) {
            addDetailReceipt(new DetailReceipt(receipt1, list.get(i).getCake(), list.get(i).getAmount()));
        }
    }

    public int getIdReceipt(String date) {
        String string = date.substring(0, 10) + " " + date.substring(11, 19);
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select ma_hoa_don from hoa_don where ngay_dat_hang='" + string + "'");
            resultSet.next();
            id = resultSet.getInt("ma_hoa_don");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println("id hoa don la: " + id);
        return id;
    }

    private void addDetailReceipt(DetailReceipt detailReceipt) {
        String addDetailReceipt = "insert into hoa_don_chi_tiet(ma_banh, ma_hoa_don, so_luong) value (?,?,?);";
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(addDetailReceipt);
            preparedStatement.setInt(1, detailReceipt.getCake().getId());
            preparedStatement.setInt(2, detailReceipt.getReceipt().getId());
            preparedStatement.setInt(3, detailReceipt.getAmount());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private int checkCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        boolean flag = true;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from khach_hang");
            while (resultSet.next()) {
                if (resultSet.getString("sdt").equals(customer.getPhoneNumber())) {
                    id = resultSet.getInt("ma_khach_hang");
                    flag = false;
                    connection.close();
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (flag) {
            String add = "insert into khach_hang(ten_khach_hang, sdt)values('" + customer.getName() + "', '" + customer.getPhoneNumber() +
                    "');";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(add);
                preparedStatement.executeUpdate();
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select * from khach_hang where sdt = '" + customer.getPhoneNumber() + "'");
                resultSet.next();
                id = resultSet.getInt("ma_khach_hang");
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return id;
    }

}
