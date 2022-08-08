package service;

import model.customer.Customer;
import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAllFacility();

    boolean createFacility(Facility facility);

    boolean deleteFacility(int id);

    boolean editFacility(Facility facility);

    Facility findByIdFacility(int id);

    List<Facility> findFacilityByName(String name);


}
