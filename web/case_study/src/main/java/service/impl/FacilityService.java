package service.impl;

import model.customer.Customer;
import model.facility.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {

    IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> findAllFacility() {
        return facilityRepository.findAllFacility();
    }

    @Override
    public boolean createFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        return false;
    }

    @Override
    public Customer findByIdFacility(int id) {
        return null;
    }
}
