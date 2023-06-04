package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
private IEmployeeRepository employeeRepository=new EmployeeRepository();
    @Override
    public List<Employee> getList() {
        return employeeRepository.getList();
    }
}
