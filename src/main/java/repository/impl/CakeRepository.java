package repository.impl;

import model.Cake;
import repository.BaseRepository;
import repository.ICakeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CakeRepository implements ICakeRepository {
    private static final String CREATE = "insert into banh(ten_banh,ma_loai_banh,gia,so_luong_hien_co,anh_banh)"
            + "value (?,?,?,?,?)";
    private static final String DELETE = "delete from banh where ma_banh = ?";
    private static final String EDIT = "update banh set ten_banh = ?,ma_loai_banh= ?, gia =?,so_luong_hien_co= ?,anh_banh= ?  where ma_banh = ?;";
    private static final String FIND_BY_NAME = "select * from banh where ten_banh like '%?%';";

    @Override
    public List<Cake> display() {
        Connection connection = BaseRepository.getConnection();
        List<Cake> cakeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from banh;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_banh");
                String name = resultSet.getString("ten_banh");
                int typeOfCake = resultSet.getInt("ma_loai_banh");
                double price = resultSet.getDouble("gia");
                int amount = resultSet.getInt("so_luong_hien_co");
                String picture = resultSet.getString("anh_banh");
                Cake cake = new Cake(id, name, typeOfCake, price, amount, picture);
                cakeList.add(cake);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cakeList;
    }

    @Override
    public List<Cake> findByName(String name) {
        Connection connection = BaseRepository.getConnection();
        List<Cake> cakeList = new ArrayList<>();
        String findByName = "select * from banh where ten_banh like '%" + name + "%';";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(findByName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_banh");
                String name2 = resultSet.getString("ten_banh");
                int typeOfCake = resultSet.getInt("ma_loai_banh");
                double price = resultSet.getDouble("gia");
                int amount = resultSet.getInt("so_luong_hien_co");
                String picture = resultSet.getString("anh_banh");
                Cake cake = new Cake(id, name2, typeOfCake, price, amount, picture);
                cakeList.add(cake);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cakeList;
    }

    @Override
    public boolean add(Cake cake) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setString(1, cake.getName());
            preparedStatement.setInt(2, cake.getTypeOfCake());
            preparedStatement.setDouble(3, cake.getPrice());
            preparedStatement.setInt(4, cake.getAmount());
            if (cake.getPicture() == "") {
                preparedStatement.setString(5, "https://antimatter.vn/wp-content/uploads/2022/11/anh-avatar-trang-fb-mac-dinh.jpg");
            } else {
                preparedStatement.setString(5, cake.getPicture());
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            return false;
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return true;
    }

    @Override
    public boolean edit(int id, Cake cake) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setString(1, cake.getName());
            preparedStatement.setInt(2, cake.getTypeOfCake());
            preparedStatement.setDouble(3, cake.getPrice());
            preparedStatement.setInt(4, cake.getAmount());
            preparedStatement.setString(5, cake.getPicture());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            return false;
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return true;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }


}
