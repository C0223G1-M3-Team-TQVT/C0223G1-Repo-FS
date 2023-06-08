package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.util.List;

import model.Position;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class EmployeeRepository implements IEmployeeRepository {

    private static final String SELECT = "select*from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu = cv.ma_chuc_vu;";

    @Override
    public List<Employee> getList() {
        Connection connection = BaseRepository.getConnection();
        List<Employee> employeeList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                //int id, String name, String citizenId, String phoneNumber, String address, Position position
                int id = resultSet.getInt("nv.ma_nhan_vien");
                String name = resultSet.getString("ten_nhan_vien");
                String citizenId = resultSet.getString("cccd");
                String phoneNumber = resultSet.getString("sdt");
                String address = resultSet.getString("dia_chi");
                int positionId = resultSet.getInt("cv.ma_chuc_vu");
                String positionName = resultSet.getString("cv.ten_chuc_vu");
                Position position = new Position(positionId, positionName);
                Employee employee = new Employee(id, name, citizenId, phoneNumber, address, position);
                employeeList.add(employee);
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
        return employeeList;
    }
}
