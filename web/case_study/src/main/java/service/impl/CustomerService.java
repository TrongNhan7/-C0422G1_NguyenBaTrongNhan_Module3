package service.impl;

import model.customer.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAllCustomer() {
        return customerRepository.findAllCustomer();
    }

    @Override
    public Map<String,String> createCustomer(Customer customer) {
        Map<String,String> mapErrors = this.validate(customer);
        if (mapErrors.size() == 0) {
            this.customerRepository.createCustomer(customer);
        }
        return mapErrors;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public Map<String,String> editCustomer(Customer customer) {
        Map<String,String> mapErrors = this.validate(customer);
        if (mapErrors.size() == 0) {
            this.customerRepository.editCustomer(customer);
        }
        return mapErrors;
    }

    @Override
    public Customer findByIdCustomer(int id) {
        return customerRepository.findByIdCustomer(id);
    }

    public List<Customer> findByCustomer(String key) {
        return customerRepository.findByCustomer(key);
    }

    @Override
    public Map<String, String> validate(Customer customer) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!customer.getNameCustomer().isEmpty()) {
            if (!customer.getNameCustomer().matches("[A-Z][a-z]+( [A-Z][a-z]+)*")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }

        if (!customer.getPhone().isEmpty()) {
            if (!customer.getPhone().matches("^((090)|(091)|(\\\\(84\\\\)+90)|(\\\\(84\\\\)+91))[0-9]{7}$")) {
                mapErrors.put("phone", "Please input right format!");
            }
        } else {
            mapErrors.put("phone", "Please input phone!");
        }

        if (!customer.getIdCard().isEmpty()) {
            if (!customer.getIdCard().matches("([0-9]{9}|[0-9]{12})")) {
                mapErrors.put("Cmnd", "Please input right format!");
            }
        } else {
            mapErrors.put("Cmnd", "Please input IdCard!");
        }

        if (!customer.getEmail().isEmpty()) {
            if (!customer.getEmail().matches("^\\w+@(\\w+\\.)+\\w+$")) {
                mapErrors.put("email", "Please input right format!");
            }
        } else {
            mapErrors.put("email", "Please input email!");
        }
        LocalDate birdthDay=null;
        if ((!customer.getBirthday().isEmpty())){
//            if ((customer.getBirthday()).matches("^[0-9]{2}/[0-9]{2}/[0-9]{4}$")){
//                mapErrors.put("birthdayErr","Please input right format!");
//            }
            try {
                birdthDay = LocalDate.parse(customer.getBirthday(), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            } catch (Exception exception) {
                mapErrors.put("birthdayErr", "please input format! (dd/MM/yyyy)");
            }
        }else {
            mapErrors.put("birthdayErr","please input birthday");
        }



        return mapErrors;
    }


}
