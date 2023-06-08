package service;

import model.Cake;

import java.util.List;

public interface ICakeService {
    List<Cake> display();

    boolean add(Cake cake);

    boolean edit(int id, Cake cake);

    boolean delete(int id);

    List<Cake> findByName(String name);
}
