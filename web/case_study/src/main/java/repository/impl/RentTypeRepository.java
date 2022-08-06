package repository.impl;

import model.facility.RentType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository {
    private final String SELECT_ALL_RENT_TYPE = "select *from kieu_thue";
    public List<RentType> selectRentTypeList() {
        Connection connection = BaseRepository.getConnectDB();
        List<RentType> rentTypes = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_kieu_thue");
                String name = resultSet.getString("ten_kieu_thue");
                RentType rentType = new RentType(id, name);
                rentTypes.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypes;
    }
}
