package repository.impl;

import model.customer.CustomerType;
import model.facility.FacilityType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository {
    private final String SELECT_ALL_FAC_TYPE = "select *from loai_dich_vu";
    public List<FacilityType> selectFacilityTypeList() {

        Connection connection = BaseRepository.getConnectDB();
        List<FacilityType> facilityTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FAC_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ma_loai_dich_vu");
                String name = resultSet.getString("ten_loai_dich_vu");
                FacilityType facilityType = new FacilityType(id, name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }
}
