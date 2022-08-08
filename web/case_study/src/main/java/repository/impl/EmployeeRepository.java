package repository.impl;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "call select_all_employee";

    @Override
    public List<Employee> findAllEmployee() {
        Connection connection = BaseRepository.getConnectDB();
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String birthday = rs.getString(3);
                String idCard = rs.getString(4);
                double salary = rs.getDouble(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                String address = rs.getString(8);
                String namePosition = rs.getString(9);
                String  nameEducation = rs.getString(10);
                String nameDivision = rs.getString(11);
                employeeList.add(new Employee(id, name, birthday, idCard,salary, phone, email,
                        address, namePosition, nameEducation,nameDivision));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }

    @Override
    public void insertEmployee(Employee employee) {

    }

    @Override
    public void deleteEmployee(Integer id) {

    }

    @Override
    public Employee selectEmployeeById(Integer id) {
        return null;
    }

    @Override
    public void updateEmployee(Employee employee) {

    }

    @Override
    public List<Employee> searchByName(String name) {
        return null;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
