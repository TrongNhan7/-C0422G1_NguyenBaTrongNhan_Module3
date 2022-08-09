package service;

import model.customer.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAllCustomer();

    Map<String,String> createCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Map<String,String> editCustomer(Customer customer);

    Customer findByIdCustomer(int id);

    Map<String, String> validate(Customer customer);

     List<Customer> findByCustomer(String key);
}
