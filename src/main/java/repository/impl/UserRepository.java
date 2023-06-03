package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String LIST_USER ="";

    @Override
    public List<User> getUser() {
        List<User> userList=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet= statement.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
