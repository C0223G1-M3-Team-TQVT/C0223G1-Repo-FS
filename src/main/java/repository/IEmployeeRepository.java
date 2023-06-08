package repository;

import model.Employee;
import model.User;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> getList();

    void addEmployee(Employee employee, int idPosition);

    void deleteEmployee(int id);

    Employee selectById(int id);

    void updateEmployee(Employee employee);

}
