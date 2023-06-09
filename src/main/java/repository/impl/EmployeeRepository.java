package repository.impl;

import model.Employee;
import model.Position;
import model.User;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {

    private static final String SELECT = "select*from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu = cv.ma_chuc_vu " +
            "order by nv.ma_nhan_vien";

    private static final String INSERT = "INSERT INTO nhan_vien ( ten_nhan_vien, " +
            "cccd, sdt, dia_chi, ma_chuc_vu) VALUES ( ?, ?, ?, ?, ?);";

    private static final String DELETE = "delete from nhan_vien where ma_nhan_vien = ?";

    private static final String SELECTBYID = "select * from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu = cv.ma_chuc_vu " +
            "where nv.ma_nhan_vien =?;";

    private static final String UPDATE = "update nhan_vien set ten_nhan_vien =?, cccd=?, sdt=?, dia_chi=?,ma_chuc_vu=? " +
            "where ma_nhan_vien=?";

    private static final String FINDBYNAME = "select*from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu = cv.ma_chuc_vu " +
            "where ten_nhan_vien like '%?%'; ";


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

    //int id, String name, String citizenId, String phoneNumber, String address, Position position
    @Override
    public void addEmployee(Employee employee, int idPosition) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getCitizenId());
            preparedStatement.setString(3, employee.getPhoneNumber());
            preparedStatement.setString(4, employee.getAddress());
            preparedStatement.setInt(5, idPosition);
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

    @Override
    public void deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
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

    @Override
    public Employee selectById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECTBYID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("ten_nhan_vien");
                String citizenId = resultSet.getString("cccd");
                String phoneNumber = resultSet.getString("sdt");
                String address = resultSet.getString("dia_chi");
                int idPosition = resultSet.getInt("ma_chuc_vu");
                String namePosition = resultSet.getString("ten_chuc_vu");
                Position position = new Position(idPosition, namePosition);
                employee = new Employee(id, name, citizenId, phoneNumber, address, position);
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
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getCitizenId());
            preparedStatement.setString(3, employee.getPhoneNumber());
            preparedStatement.setString(4, employee.getAddress());
            preparedStatement.setInt(5, employee.getPosition().getId());
            preparedStatement.setInt(6, employee.getId());
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

    @Override
    public List<Employee> findByName(String name) {
        Connection connection = BaseRepository.getConnection();
        String findByName = "select*from nhan_vien nv join chuc_vu cv on nv.ma_chuc_vu = cv.ma_chuc_vu " +
                "where ten_nhan_vien like '%" +name +"%'; ";
        List<Employee> employeeList=  new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(findByName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("nv.ma_nhan_vien");
                String name1 = resultSet.getString("ten_nhan_vien");
                String citizenId = resultSet.getString("cccd");
                String phoneNumber = resultSet.getString("sdt");
                String address = resultSet.getString("dia_chi");
                int positionId = resultSet.getInt("cv.ma_chuc_vu");
                String positionName = resultSet.getString("cv.ten_chuc_vu");
                Position position = new Position(positionId, positionName);
                Employee employee = new Employee(id, name1, citizenId, phoneNumber, address, position);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeList;
    }
}
