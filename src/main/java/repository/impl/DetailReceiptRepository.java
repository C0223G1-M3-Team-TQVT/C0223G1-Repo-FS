package repository.impl;

import model.Cake;
import model.Customer;
import model.DetailReceipt;
import model.Receipt;
import repository.BaseRepository;
import repository.IDetailReceiptRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DetailReceiptRepository implements IDetailReceiptRepository {
private final String SELECT_ALL_DETAIL="select kh.ten_khach_hang,b.ten_banh,hdct.so_luong,sum(hdct.so_luong*b.gia) as tong_tien\n" +
        "from hoa_don hd\n" +
        "join hoa_don_chi_tiet hdct\n" +
        "on hd.ma_hoa_don=hdct.ma_hoa_don\n" +
        "join banh b\n" +
        "on b.ma_banh=hdct.ma_banh\n" +
        "join loai_banh lb\n" +
        "on lb.ma_loai_banh=b.ma_loai_banh\n" +
        "join khach_hang kh\n" +
        "on kh.ma_khach_hang=hd.ma_khach_hang\n" +
        "group by kh.ten_khach_hang,b.ten_banh,hdct.so_luong;";

    @Override
    public List<DetailReceipt> getAll() {
        List<DetailReceipt> detailReceipts=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(SELECT_ALL_DETAIL);
            while (resultSet.next()){
             String khachHang=   resultSet.getString("kh.ten_khach_hang");
             String tenBanh=   resultSet.getString("b.ten_banh");
             int maBanh=resultSet.getInt("b.ma_banh");
             int giaBanh=resultSet.getInt("b.gia");
             int soLuong=   resultSet.getInt("hdct.so_luong");
             int maHoaDon=resultSet.getInt("hdct.ma_hoa_don");
                Customer customer=new Customer(khachHang);
                Cake cake=new Cake(maBanh,tenBanh,giaBanh);
                Receipt receipt=new Receipt(maHoaDon,customer);
                detailReceipts.add(new DetailReceipt(soLuong,cake,receipt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailReceipts;
    }
}
