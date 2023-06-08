package service.impl;

import model.Position;
import repository.impl.PositionRepository;
import service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    PositionRepository positionRepository = new PositionRepository();

    @Override
    public List<Position> displayList() {
        return positionRepository.displayList();
    }
}
