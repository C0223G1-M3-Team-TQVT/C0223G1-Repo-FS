package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getUser();
    void addUser(User user);
}
