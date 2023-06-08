package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getList();

    void addEmployee(Employee employee, int idPosition);

    void deleteEmployee(int id);

    Employee selectById(int id);

    void updateEmployee(Employee employee);
}
