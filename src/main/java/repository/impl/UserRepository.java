package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String LIST_USER = "select * from user;";
    private final String ADD_USER = " insert into user(sdt,mat_khau) value(?,?);";

    @Override
    public List<User> getUser() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(LIST_USER);
            while (resultSet.next()) {
                String taiKhoan = resultSet.getString("sdt");
                String matKhau = resultSet.getString("mat_khau");
                userList.add(new User(taiKhoan, matKhau));
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
        return userList;
    }

    @Override
    public void addUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER);
            preparedStatement.setString(1, user.getPhoneNumber());
            preparedStatement.setString(2, user.getPassword());
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

}
