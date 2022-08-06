package repository;

import model.customer.Customer;
import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAllFacility();

    boolean createFacility(Facility facility);

    boolean deleteFacility(int id);

    boolean editFacility(Facility facility);

    Customer findByIdFacility(int id);

}
