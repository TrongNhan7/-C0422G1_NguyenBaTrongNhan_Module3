package repository.impl;

import model.customer.Customer;
import model.facility.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL_FACILITY = "select * from dich_vu";
    private static final String INSERT_FACILITY_SQL = "INSERT INTO  dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)" +
            " VALUES (?,?,?,?,?,?,?,?,?,?,?);";

//    private static final String DELETE_FACILITY_SQL = " DELETE FROM dich_vu WHERE ma_dich_vu= ? ;";

    private static final String DELETE_FACILITY_SQL_BY_SP = "call delete_By_SP(?)";

    private static final String SELECT_FACILITY_BY_ID = "select * from dich_vu where ma_dich_vu = ?";

    private static final String EDIT_FACILITY_SQL = "update dich_vu" +
            " set ten_dich_vu = ?,dien_tich = ?,chi_phi_thue = ?,so_nguoi_toi_da = ?," +
            " tieu_chuan_phong = ?, mo_ta_tien_nghi_khac = ?, dien_tich_ho_boi = ?,so_tang = ?,dich_vu_mien_phi_di_kem = ?," +
            " ma_kieu_thue= ?,ma_loai_dich_vu = ?" +
            " where ma_dich_vu = ?;";

    private static final String SELECT_FACILITY_BY_NAME = "select * from dich_vu where ten_dich_vu like ? ";


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
                        areaPool, numberOfFloors, serviceFree, rentTypeId, serviceTypeId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return facilityList;
    }


    @Override
    public boolean createFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY_SQL);
            preparedStatement.setString(1, facility.getNameService());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getAreaPool());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getServiceFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getServiceTypeId());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement statement = connection.prepareCall(DELETE_FACILITY_SQL_BY_SP);
            statement.setInt(1, id);
            int check = statement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            try {
                throw new SQLException();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_FACILITY_SQL);
            preparedStatement.setString(1, facility.getNameService());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getAreaPool());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getServiceFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getServiceTypeId());
            preparedStatement.setInt(12, facility.getId());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility findByIdFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nameService = rs.getString("ten_dich_vu");
                int area = rs.getInt("dien_tich");
                double cost = rs.getDouble("chi_phi_thue");
                int maxPeo = rs.getInt("so_nguoi_toi_da");
                String standardRoom = rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = rs.getString("mo_ta_tien_nghi_khac");
                double areaPool = rs.getDouble("dien_tich_ho_boi");
                int numberOfFloors = rs.getInt("so_tang");
                String serviceFree = rs.getString("dich_vu_mien_phi_di_kem");
                int rentTypeId = rs.getInt("ma_kieu_thue");
                int serviceTypeId = rs.getInt("ma_loai_dich_vu");

                facility = new Facility(id, nameService, area, cost, maxPeo, standardRoom, descriptionOtherConvenience,
                        areaPool, numberOfFloors, serviceFree, rentTypeId, serviceTypeId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return facility;
    }

    @Override
    public List<Facility> findFacilityByName(String name) {
        Connection connection = BaseRepository.getConnectDB();
        List<Facility> facilities = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY_BY_NAME);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ma_dich_vu");
                int area = rs.getInt("dien_tich");
                double cost = rs.getDouble("chi_phi_thue");
                int maxPeo = rs.getInt("so_nguoi_toi_da");
                String standardRoom = rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = rs.getString("mo_ta_tien_nghi_khac");
                double areaPool = rs.getDouble("dien_tich_ho_boi");
                int numberOfFloors = rs.getInt("so_tang");
                String serviceFree = rs.getString("dich_vu_mien_phi_di_kem");
                int rentTypeId = rs.getInt("ma_kieu_thue");
                int serviceTypeId = rs.getInt("ma_loai_dich_vu");

                facilities.add(new Facility(id, name, area, cost, maxPeo, standardRoom, descriptionOtherConvenience,
                        areaPool, numberOfFloors, serviceFree, rentTypeId, serviceTypeId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return facilities;
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
