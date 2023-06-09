package repository.impl;

import model.Cake;
import model.Customer;
import model.DetailReceipt;
import model.Receipt;
import repository.BaseRepository;
import repository.IDetailReceiptRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DetailReceiptRepository implements IDetailReceiptRepository {
    private final String SELECT_ALL_DETAIL = "select b.anh_banh,hd.ma_hoa_don,kh.ten_khach_hang,b.ten_banh,hdct.so_luong,b.ma_banh,b.gia,hdct.ma_hoa_don" +
            " from hoa_don hd\n" +
            "join hoa_don_chi_tiet hdct\n" +
            "on hd.ma_hoa_don=hdct.ma_hoa_don\n" +
            "join banh b\n" +
            "on b.ma_banh=hdct.ma_banh\n" +
            "join loai_banh lb\n" +
            "on lb.ma_loai_banh=b.ma_loai_banh\n" +
            "join khach_hang kh\n" +
            "on kh.ma_khach_hang=hd.ma_khach_hang\n;";

    private final String GET_PRICE_ALL = "select hd.ma_hoa_don,sum(b.gia*hdct.so_luong) as tong_tien\n" +
            "         from hoa_don hd\n" +
            "        join hoa_don_chi_tiet hdct \n" +
            "        on hd.ma_hoa_don=hdct.ma_hoa_don\n" +
            "        join banh b\n" +
            "        on b.ma_banh=hdct.ma_banh\n" +
            "        group by  hd.ma_hoa_don;";

    private final String UPDATE_CONDITION = "update hoa_don set trang_thai = 1 where ma_hoa_don = ?";

    private final String GET_PRICE_CAKE = " select b.anh_banh,hd.ma_hoa_don,kh.ten_khach_hang,b.ten_banh,hdct.so_luong,b.ma_banh,b.gia,hdct.ma_hoa_don,hdct.so_luong*b.gia as tien" +
            " from hoa_don hd\n" +
            "join hoa_don_chi_tiet hdct\n" +
            "on hd.ma_hoa_don=hdct.ma_hoa_don\n" +
            "join banh b \n" +
            "on b.ma_banh=hdct.ma_banh\n" +
            "join loai_banh lb\n" +
            "on lb.ma_loai_banh=b.ma_loai_banh\n" +
            "join khach_hang kh\n" +
            "on kh.ma_khach_hang=hd.ma_khach_hang group by b.anh_banh,hd.ma_hoa_don,kh.ten_khach_hang,b.ten_banh,hdct.so_luong,b.ma_banh,b.gia,hdct.ma_hoa_don;";
    public boolean checkStatus(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select trang_thai from hoa_don where ma_hoa_don = '" + id + "'");
            while (resultSet.next()) {
                String statsSQL = resultSet.getString("trang_thai");
                if (statsSQL.equals("1")) {
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean UpdateCondition(int id) {
        Connection connection = BaseRepository.getConnection();
        boolean check = checkStatus(id);
        if (!check) {
            return false;
        } else {
            PreparedStatement preparedStatement = null;
            try {
                preparedStatement = connection.prepareStatement(UPDATE_CONDITION);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    @Override
    public boolean findPosition(String sdt) {
        String checkPosition=null;
        Connection connection=BaseRepository.getConnection();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(("select * from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu=cv.ma_chuc_vu where nv.sdt= "+sdt ));
         while (resultSet.next()){
          checkPosition = resultSet.getString("cv.ten_chuc_vu");
         }
         if (checkPosition==null){
             checkPosition="";
         }
       if (checkPosition.equals("Quản lí")){
           return true;
       }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<DetailReceipt> getDetail(int id) {
        List<DetailReceipt> detailReceipts = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from hoa_don_chi_tiet hdct join hoa_don hd on hdct.ma_hoa_don=hd.ma_hoa_don" +
                    " join banh b on b.ma_banh=hdct.ma_banh   where hd.ma_hoa_don = " + id);
            while (resultSet.next()) {
                int idDetail = resultSet.getInt("b.ma_banh");
                int idReceipt = resultSet.getInt("hd.ma_hoa_don");
                int amount = resultSet.getInt("so_luong");
                Receipt receipt = new Receipt(idReceipt);
                Cake cake = new Cake(amount);
                detailReceipts.add(new DetailReceipt(amount, cake, receipt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailReceipts;
    }


    @Override
    public Map<Integer, Integer> getMoney() {
        Map<Integer, Integer> integerMap = new LinkedHashMap<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_PRICE_CAKE);
            while (resultSet.next()) {
                int maHoaDon = resultSet.getInt("b.ma_banh");
                int tien = resultSet.getInt("tien");
                integerMap.put(maHoaDon, tien);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return integerMap;
    }

    @Override
    public List<DetailReceipt> getAll() {
        List<DetailReceipt> detailReceipts = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_DETAIL);
            while (resultSet.next()) {
                String khachHang = resultSet.getString("kh.ten_khach_hang");
                String tenBanh = resultSet.getString("b.ten_banh");
                String anhBanh = resultSet.getString("b.anh_banh");
                int maBanh = resultSet.getInt("b.ma_banh");
                int giaBanh = resultSet.getInt("b.gia");
                int soLuong = resultSet.getInt("hdct.so_luong");
                int maHoaDon = resultSet.getInt("hd.ma_hoa_don");
                Customer customer = new Customer(khachHang);
                Cake cake = new Cake(maBanh, tenBanh, giaBanh, anhBanh);
                Receipt receipt = new Receipt(maHoaDon, customer);
                detailReceipts.add(new DetailReceipt(soLuong, cake, receipt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailReceipts;
    }

    @Override
    public Map<Integer, Integer> getPriceAll() {
        Map<Integer, Integer> integerMap = new LinkedHashMap<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_PRICE_ALL);
            while (resultSet.next()) {
                int maHoaDon = resultSet.getInt("hd.ma_hoa_don");
                int tongTien = resultSet.getInt("tong_tien");
                integerMap.put(maHoaDon, tongTien);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return integerMap;
    }


}
