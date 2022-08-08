package repository;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAllCustomer();

    boolean createCustomer(Customer customer);

    boolean deleteCustomer(int id);

    boolean editCustomer(Customer customer);

    Customer findByIdCustomer(int id);

}
