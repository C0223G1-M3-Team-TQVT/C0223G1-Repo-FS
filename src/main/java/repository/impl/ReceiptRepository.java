package repository.impl;

import javafx.util.converter.LocalDateTimeStringConverter;
import model.Cake;
import model.Customer;
import model.DetailReceipt;
import model.Receipt;
import repository.BaseRepository;
import repository.IReceiptRepository;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ReceiptRepository implements IReceiptRepository {
    private static String DISPLAY = "select * from banh";
    private static String ADD = "insert into hoa_don(ma_khach_hang,ma_nhan_vien,ngay_dat_hang,dia_chi_giao_hang) value(?,?,?,?)";

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
    public void addReceipt(List<DetailReceipt> list, Receipt receipt) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            int id = checkCustomer(receipt.getCustomer());
            System.out.println(id);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, receipt.getEmployee().getId());
            preparedStatement.setString(3, String.valueOf(LocalDateTime.now()));
            preparedStatement.setString(4, receipt.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int checkCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        int id = 0;
        boolean flag = true;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * form khach_hang");
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
