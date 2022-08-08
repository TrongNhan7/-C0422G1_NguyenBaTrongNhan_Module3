package service.impl;

import model.facility.FacilityType;
import repository.impl.FacilityTypeRepository;

import java.util.List;

public class FacilityTypeService {
    FacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    public List<FacilityType> selectFacilityTypeList() {
        return facilityTypeRepository.selectFacilityTypeList();
    }
}
