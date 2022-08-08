package service.impl;

import model.employee.Education;
import model.employee.Position;
import repository.impl.EducationRepository;
import repository.impl.PositionRepository;

import java.util.List;

public class PositionService {
    PositionRepository positionRepository =new PositionRepository();
    public List<Position> getPosition() {
        return positionRepository.getPosition();
    }
}
