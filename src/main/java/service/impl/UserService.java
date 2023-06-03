package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
private IUserRepository iUserRepository=new UserRepository();
private List<User> userList=iUserRepository.getUser();
    @Override
    public List<User> getUser() {
        return userList;
    }

    @Override
    public boolean findUser(User user) {
        for (int i = 0; i < userList.size(); i++) {
            if (user.getPhoneNumber().equals(userList.get(i).getPhoneNumber())&&user.getPassword().equals(userList.get(i).getPassword())){
                return true;
            }
        }
        return false;
    }

}
