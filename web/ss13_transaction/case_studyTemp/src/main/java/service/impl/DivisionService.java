package service.impl;

import model.employee.Division;
import model.facility.RentType;
import repository.impl.DivisionRepository;
import repository.impl.RentTypeRepository;

import java.util.List;

public class DivisionService {
    DivisionRepository divisionRepository =new DivisionRepository();
    public List<Division> getDivision() {
        return divisionRepository.getDivision();
    }
}
