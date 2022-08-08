package service;

import model.contract.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> findAllContract();

    boolean createContract(Contract contract);

    boolean deleteContract(int id);

    boolean editContract(Contract contract);

    Contract findByIdContract(int id);
}
