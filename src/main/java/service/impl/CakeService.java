package service.impl;

import model.Cake;
import repository.ICakeRepository;
import repository.impl.CakeRepository;
import service.ICakeService;

import java.util.List;

public class CakeService implements ICakeService {
    ICakeRepository cakeRepository = new CakeRepository();
    @Override
    public List<Cake> display() {
        return cakeRepository.display();
    }

    @Override
    public boolean add(Cake cake) {
        if (cakeRepository.add(cake)){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean edit(int id, Cake cake) {
        if (cakeRepository.edit(id,cake)){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        if (cakeRepository.delete(id)){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Cake> findByName(String name) {
        return  cakeRepository.findByName(name);
    }
}
