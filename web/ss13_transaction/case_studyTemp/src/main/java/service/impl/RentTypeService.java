package service.impl;

import model.facility.RentType;
import repository.impl.RentTypeRepository;

import java.util.List;

public class RentTypeService {
    RentTypeRepository rentTypeRepository =new RentTypeRepository();
    public List<RentType> selectRentTypeList() {
        return rentTypeRepository.selectRentTypeList();
    }
}
