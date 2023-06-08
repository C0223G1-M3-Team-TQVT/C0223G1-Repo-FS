package service.impl;

import model.Employee;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> getList() {
        return employeeRepository.getList();
    }

    @Override
    public void addEmployee(Employee employee, int idPosition) {
        employeeRepository.addEmployee(employee, idPosition);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeRepository.deleteEmployee(id);
    }

    @Override
    public Employee selectById(int id) {
        return employeeRepository.selectById(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeRepository.updateEmployee(employee);
    }
}
