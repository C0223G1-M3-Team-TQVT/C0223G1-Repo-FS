package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> getUser();

    boolean findUser(User user);
}
