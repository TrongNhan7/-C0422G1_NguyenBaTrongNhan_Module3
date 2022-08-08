package service;

import model.customer.Customer;
import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAllEmployee();

    boolean createEmployee(Employee employee);

    boolean deleteEmployee(int id);

    boolean editEmployee(Employee employee);

    Employee findByIdEmployee(int id);

}
