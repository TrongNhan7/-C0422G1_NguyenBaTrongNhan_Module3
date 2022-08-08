package repository.impl;

import model.contract.Contract;
import model.customer.Customer;
import repository.BaseRepository;
import repository.IContractRepository;
import service.ICustomerService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT = "call select_all_contract();";

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
