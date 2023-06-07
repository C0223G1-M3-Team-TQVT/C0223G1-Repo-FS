package service.impl;

import model.TypeOfCake;
import repository.ITypeOfCakeRepository;
import repository.impl.TypeOfCakeRepository;
import service.ITypeOfCakeService;

import java.util.List;

public class TypeOfCakeService implements ITypeOfCakeService {
    ITypeOfCakeRepository typeOfCakeRepository = new TypeOfCakeRepository();
    @Override
    public List<TypeOfCake> display() {
        return typeOfCakeRepository.display();
    }
}
