package service;

import model.contract.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepository;

import java.util.List;

public class ContractService implements IContractService {
    IContractRepository contractRepository = new ContractRepository();
    @Override
    public List<Contract> findAllContract() {
        return contractRepository.findAllContract();
    }

    @Override
    public boolean createContract(Contract contract) {
        return contractRepository.createContract(contract);
    }

    @Override
    public boolean deleteContract(int id) {
        return contractRepository.deleteContract(id);
    }

    @Override
    public boolean editContract(Contract contract) {
        return contractRepository.editContract(contract);
    }

    @Override
    public Contract findByIdContract(int id) {
        return contractRepository.findByIdContract(id);
    }
}
