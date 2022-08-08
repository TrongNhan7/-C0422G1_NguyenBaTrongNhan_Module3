package service.impl;

import model.customer.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> selectCustomerTypeList() {
        return customerTypeRepository.selectCustomerTypeList();
    }
}
