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
        return facilityRepository.createFacility(facility);
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
