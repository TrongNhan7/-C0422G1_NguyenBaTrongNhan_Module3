package repository.impl;

import model.contract.Contract;
import model.customer.Customer;
import repository.BaseRepository;
import repository.IContractRepository;
import service.ICustomerService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT = "call select_all_contract();";
    private static final String INSERT_CONTRACT = " INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)" +
            " VALUES(?,?,?,?,?,?)";


    @Override
    public List<Contract> findAllContract() {
        Connection connection = BaseRepository.getConnectDB();
        List<Contract> contractList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String facilityId = rs.getString(2);
                String customerId = rs.getString(3);
                String employeeId = rs.getString(4);
                String startDay = rs.getString(5);
                String endDay = rs.getString(6);
                double deposit = rs.getDouble(7);
                double totalMoney = rs.getDouble(8);
                contractList.add(new Contract(id, startDay, endDay, deposit, employeeId, customerId, facilityId,totalMoney));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return contractList;
    }

    @Override
    public boolean createContract(Contract contract) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT);
            preparedStatement.setDate(1, Date.valueOf(contract.getStartDate()));
            preparedStatement.setDate(2, Date.valueOf(contract.getEndDate()));
            preparedStatement.setDouble(3, contract.getDeposit());
            preparedStatement.setInt(4, Integer.parseInt(contract.getEmployeeId()));
            preparedStatement.setInt(5, Integer.parseInt(contract.getCustomerId()));
            preparedStatement.setInt(6, Integer.parseInt(contract.getFacilityId()));
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteContract(int id) {
        return false;
    }

    @Override
    public boolean editContract(Contract contract) {
        return false;
    }

    @Override
    public Contract findByIdContract(int id) {
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
