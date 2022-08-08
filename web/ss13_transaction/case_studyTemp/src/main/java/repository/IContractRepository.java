package repository;

import model.contract.Contract;
import model.customer.Customer;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAllContract();

    boolean createContract(Contract contract);

    boolean deleteContract(int id);

    boolean editContract(Contract contract);

    Contract findByIdContract(int id);
}
