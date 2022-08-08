package service.impl;

import model.customer.Customer;
import model.facility.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityService implements IFacilityService {

    IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> findAllFacility() {
        return facilityRepository.findAllFacility();
    }

    @Override
    public Map<String,String> createFacility(Facility facility) {
        Map<String, String> mapErrors = new HashMap<>();

        if (!facility.getNameService().isEmpty()) {
            if (!facility.getNameService().matches("[A-Z][a-z0-9]+( [A-Z][a-z0-9]+)*")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }

            if (facility.getNumberOfFloors()<0) {
                mapErrors.put("numberFlo", "Please input right format!");
            }


        if (mapErrors.size() == 0) {
            this.facilityRepository.createFacility(facility);
        }

        return mapErrors;
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityRepository.deleteFacility(id);
    }

    @Override
    public boolean editFacility(Facility facility) {
        return facilityRepository.editFacility(facility);
    }

    @Override
    public Facility findByIdFacility(int id) {
        return facilityRepository.findByIdFacility(id);
    }

    @Override
    public List<Facility> findFacilityByName(String name) {
        return facilityRepository.findFacilityByName(name);
    }
}
