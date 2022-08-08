package service;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAllCustomer();

    boolean createCustomer(Customer customer);

    boolean deleteCustomer(int id);

    boolean editCustomer(Customer customer);

    Customer findByIdCustomer(int id);

}
