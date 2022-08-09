package repository.impl;

import model.customer.Customer;
import model.facility.Facility;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    private static final String SELECT_ALL_CUSTOMER = "select * from khach_hang where status = 0";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)" +
            " VALUES (?,?,?,?,?,?,?,?);";

    private static final String DELETE_CUSTOMER_BY_ID =
            " UPDATE khach_hang" +
                    " SET" +
                    " `status` = 1" +
                    " WHERE ma_khach_hang = ?;";

    private static final String SELECT_USER_BY_ID = "select * from khach_hang where ma_khach_hang =?";

    private static final String EDIT_CUSTOMER = "update khach_hang" +
            " set ho_ten = ?, ngay_sinh = ?, gioi_tinh = ?, so_cmnd = ?, so_dien_thoai = ?, email = ?, dia_chi =?, ma_loai_khach=? where ma_khach_hang = ?;";

    private static final String FIND_CUSTOMER = "CALL find_by_sp(?)";
    @Override
    public List<Customer> findAllCustomer() {
        Connection connection = BaseRepository.getConnectDB();
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_khach_hang");
                String nameCustomer = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                boolean gender = rs.getBoolean("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int customerTypeId = rs.getInt("ma_loai_khach");
                boolean status = rs.getBoolean("status");
                customerList.add(new Customer(id, nameCustomer, birthday, gender, idCard, phone, email, address, customerTypeId, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }


    @Override
    public boolean createCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, customer.getNameCustomer());
            preparedStatement.setDate(2, Date.valueOf(customer.getBirthday()));
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setString(1, customer.getNameCustomer());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            preparedStatement.setInt(9, customer.getId());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer findByIdCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nameCustomer = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                boolean gender = rs.getBoolean("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int customerTypeId = rs.getInt("ma_loai_khach");
                boolean status = rs.getBoolean("status");
                customer = new Customer(id, nameCustomer, birthday, gender, idCard, phone, email, address, customerTypeId, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }


    public List<Customer> findByCustomer(String key) {
        Connection connection = BaseRepository.getConnectDB();
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER);
            preparedStatement.setString(1, key);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_khach_hang");
                String nameCustomer = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                boolean gender = rs.getBoolean("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int customerTypeId = rs.getInt("ma_loai_khach");
                boolean status = rs.getBoolean("status");
                customers.add(new Customer(id, nameCustomer, birthday, gender, idCard, phone, email, address, customerTypeId, status))  ;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
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
