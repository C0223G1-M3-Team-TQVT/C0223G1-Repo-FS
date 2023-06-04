package service.impl;

import model.Employee;
import model.User;
import repository.IEmployeeRepository;
import repository.IUserRepository;
import repository.impl.EmployeeRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepository();
    private List<User> userList = iUserRepository.getUser();
    private List<Employee> employeeList = iEmployeeRepository.getList();

    @Override
    public List<User> getUser() {
        return userList;
    }

    @Override
    public boolean findUser(User user) {
        for (User value : userList) {
            if (user.getPhoneNumber().equals(value.getPhoneNumber()) && user.getPassword().equals(value.getPassword())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean checkUser(User user) {
        int count = 0;
        for (Employee e : employeeList) {
            if (e.getPhoneNumber().equals(user.getPhoneNumber())) {
                count++;
                for (User u: userList) {
                    if (u.getPhoneNumber().equals(user.getPhoneNumber())){
                        return false;
                    }
                }
            }
        }
        return count == 1;
    }

    @Override
    public void addUser(User user) {
        iUserRepository.addUser(user);
    }

}
