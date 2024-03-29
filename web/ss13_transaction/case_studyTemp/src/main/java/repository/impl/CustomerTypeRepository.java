package repository.impl;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {

    private final String SELECT_ALL_CUS_TYPE = "select *from loai_khach";

    @Override
    public List<CustomerType> selectCustomerTypeList() {
        Connection connection = BaseRepository.getConnectDB();
        List<CustomerType> customerTypes = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUS_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_loai_khach");
                String name = resultSet.getString("ten_loai_khach");
                CustomerType customerType = new CustomerType(id, name);
                customerTypes.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }
}
