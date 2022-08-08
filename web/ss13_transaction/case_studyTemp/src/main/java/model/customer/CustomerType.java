package model.customer;

public class CustomerType {
    private int idCustomerType;
    private String name;

    public CustomerType() {
    }

    public CustomerType(int idCustomerType, String name) {
        this.idCustomerType = idCustomerType;
        this.name = name;
    }

    public int getIdCustomerType() {
        return idCustomerType;
    }

    public void setIdCustomerType(int idCustomerType) {
        this.idCustomerType = idCustomerType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

