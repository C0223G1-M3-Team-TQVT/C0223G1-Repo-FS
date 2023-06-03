package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String LIST_USER ="select nv.*,u.sdt as tai_khoan,u.mat_khau\n" +
            " from nhan_vien nv \n" +
            " join `user`u \n" +
            " on  nv.sdt=u.sdt;";

    @Override
    public List<User> getUser() {
        List<User> userList=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet= statement.executeQuery(LIST_USER);
            while (resultSet.next()){
                String taiKhoan=resultSet.getString("tai_khoan");
                String matKhau=resultSet.getString("mat_khau");
                userList.add(new User(taiKhoan,matKhau));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
