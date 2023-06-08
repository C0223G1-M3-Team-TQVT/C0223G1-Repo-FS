package repository.impl;

import model.Employee;
import model.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {

    private static final String SELECT = "select * from chuc_vu";



    @Override
    public List<Position> displayList() {
        Connection connection = BaseRepository.getConnection();
        List<Position> positionList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_chuc_vu");
                String name = resultSet.getString("ten_chuc_vu");
                Position position = new Position(id, name);
                positionList.add(position);
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
        return positionList;
    }
}
