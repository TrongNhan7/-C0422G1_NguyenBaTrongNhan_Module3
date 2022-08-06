package repository.impl;

import model.customer.Customer;
import model.facility.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL_FACILITY = "select * from dich_vu";

    @Override
    public List<Facility> findAllFacility() {
        Connection connection = BaseRepository.getConnectDB();
        List<Facility> facilityList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_dich_vu");
                String nameFacility = rs.getString("ten_dich_vu");
                int area = rs.getInt("dien_tich");
                double cost = rs.getDouble("chi_phi_thue");
                int maxPeople = rs.getInt("so_nguoi_toi_da");
                String standardRoom = rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = rs.getString("mo_ta_tien_nghi_khac");
                double areaPool = rs.getDouble("dien_tich_ho_boi");
                int numberOfFloors = rs.getInt("so_tang");
                String serviceFree = rs.getString("dich_vu_mien_phi_di_kem");
                int rentTypeId = rs.getInt("ma_kieu_thue");
                int serviceTypeId = rs.getInt("ma_loai_dich_vu");
                facilityList.add(new Facility(id, nameFacility, area, cost, maxPeople, standardRoom, descriptionOtherConvenience,
                        areaPool, numberOfFloors, serviceFree,rentTypeId,serviceTypeId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return facilityList;
    }


    @Override
    public boolean createFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        return false;
    }

    @Override
    public Customer findByIdFacility(int id) {
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
