package repository.impl;

import model.TypeOfCake;
import repository.BaseRepository;
import repository.ITypeOfCakeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeOfCakeRepository implements ITypeOfCakeRepository {
    @Override
    public List<TypeOfCake> display() {
        List<TypeOfCake> typeOfCakeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("select * from loai_banh;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_loai_banh");
                String name = resultSet.getString("ten_loai_banh");
                typeOfCakeList.add(new TypeOfCake(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return typeOfCakeList;
    }
}
