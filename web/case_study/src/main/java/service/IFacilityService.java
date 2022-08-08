package service;

import model.customer.Customer;
import model.facility.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> findAllFacility();

   Map<String,String> createFacility(Facility facility);

    boolean deleteFacility(int id);

    boolean editFacility(Facility facility);

    Facility findByIdFacility(int id);

    List<Facility> findFacilityByName(String name);


}
